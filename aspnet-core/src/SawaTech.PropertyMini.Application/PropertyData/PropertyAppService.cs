using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using SawaTech.PropertyMini.Amenities;
using SawaTech.PropertyMini.AuthResponses;
using SawaTech.PropertyMini.Governorates;
using SawaTech.PropertyMini.NearbyPlaces;
using SawaTech.PropertyMini.Properties;
using SawaTech.PropertyMini.PublicProperties;
using SawaTech.PropertyMini.Users;
using Volo.Abp;
using Volo.Abp.Application.Dtos;
using Volo.Abp.Application.Services;
using Volo.Abp.BlobStoring;
using Volo.Abp.DependencyInjection;
using Volo.Abp.Domain.Repositories;
using Volo.Abp.Uow;
using static Volo.Abp.Http.MimeTypes;

namespace SawaTech.PropertyMini.PropertyData;

public class PropertyAppService(
    IRepository<Property, Guid> repository,
    IBlobContainer<PropertyGalleryContainer> blobContainer,
    IRepository<PropertyImage, Guid> propertyImageRepository,
    IRepository<PropertyVideo, Guid> propertyVideoRepository,
    IRepository<Amenity, Guid> propertyAmenityRepository,
    IRepository<AccountUser, Guid> accountUserRepository,
    IRepository<Governorate, Guid> governorateRepository,
    IRepository<PropertyType, Guid> propertyTypeRepository,
    IRepository<Feature, Guid> propertyFeaturesRepository,
    IRepository<NearbyPlace, Guid> propertyNearbyPlacesRepository,
    IHttpContextAccessor httpContextAccessor
    //IUnitOfWorkManager unitOfWorkManager
    )
    : ApplicationService, IPropertyAppService, ITransientDependency
{
    private readonly IRepository<PropertyVideo, Guid> _propertViedoRepository = propertyVideoRepository;

    public async Task<ListResultDto<PropertyDto>> GetListAsync(
        PropertyFilterDto? filterDto = null,
        string? sortBy = null,
        bool sortDescending = false,
        int? maxResults = 10
    )
    {
        // 1. Get base queryable
        var queryable = (await repository.GetQueryableAsync()).AsQueryable();

        // 2. Apply filters
        if (filterDto != null)
        {
            if (!string.IsNullOrWhiteSpace(filterDto.AddressKeyword))
            {
                queryable = queryable.Where(p => p.Address.Contains(filterDto.AddressKeyword));
            }

            // Rooms filter (updated with proper validation)
            if (filterDto.Rooms.HasValue && filterDto.Rooms.Value > 0)
            {
                queryable = queryable.Where(p => p.Rooms == filterDto.Rooms.Value);
            }

            if (filterDto.MinPrice.HasValue)
                queryable = queryable.Where(p => p.Price >= filterDto.MinPrice.Value);

            if (filterDto.MaxPrice.HasValue)
                queryable = queryable.Where(p => p.Price <= filterDto.MaxPrice.Value);

        }

        // 4. Apply maxResults if specified
        if (maxResults.HasValue && maxResults > 0)
        {
            queryable = queryable.Take(maxResults.Value);
        }

        // 3. Apply sorting
        queryable = (string.IsNullOrEmpty(sortBy) ? "Price" : sortBy.ToLower()) switch
        {
            "price" => sortDescending
                ? queryable.OrderByDescending(p => p.Price)
                : queryable.OrderBy(p => p.Price),

            "address" => sortDescending
                ? queryable.OrderByDescending(p => p.Address)
                : queryable.OrderBy(p => p.Address),

            _ => queryable.OrderBy(p => p.Price), // Default
        };

        // 4. Execute query and map results
        var properties = await AsyncExecuter.ToListAsync(queryable);
        return new ListResultDto<PropertyDto>(
            ObjectMapper.Map<List<Property>, List<PropertyDto>>(properties)
        );
    }

    public async Task<PropertyDto> GetAsync(Guid id)
    {
        var property = await repository.GetAsync(id);
        return ObjectMapper.Map<Property, PropertyDto>(property);
    }

    public async Task<GeneralResponse> CreateAsync([FromForm] CreateUpdatePropertyDto input)
    {
        try
        {
            await ValidateRelationships(input);

            var property = new Property
            {
                Title = input.Title,
                Description = input.Description,
                Price = input.Price,
                PaymentType = input.PaymentType,
                Area = input.Area,
                Rooms = input.Rooms,
                Latitude = input.Latitude,
                Longitude = input.Longitude,
                InsurancePayment = input.InsurancePayment,
                PropertyTypeId = input.PropertyTypeId,
                OwnerId = input.OwnerId,
                // Governorate= new Governorate {Id = input.GovernorateId},
                GovernorateId = input.GovernorateId,
            };

            var uploadsPath = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", "uploads");

            if (!Directory.Exists(uploadsPath))
                Directory.CreateDirectory(uploadsPath);

            var request = httpContextAccessor.HttpContext?.Request;
            var baseUrl = $"{request?.Scheme}://{request?.Host}";

            var mainImage = input.MainImage;
            //set and store main property image
            var mainFileName = Path.GetFileName(input.MainImage.FileName);
            var mainUniqueFileName = $"{Guid.NewGuid()}_{mainFileName}";
            var mainFilePath = Path.Combine(uploadsPath, mainUniqueFileName);

            var mainStream = new FileStream(mainFilePath, FileMode.Create);
            {
                await mainImage.CopyToAsync(mainStream);
            }

            var mainImageFullUrl = $"{baseUrl}/uploads/{mainUniqueFileName}";
            property.MainImage = mainImageFullUrl;


            var images = input.PhotoUrls;
            var video = input.VideoUrl;


            await repository.InsertAsync(property, autoSave: true);

            //using (var uow = unitOfWorkManager.Begin(requiresNew: true))
            //{
            try
            {
                // check if we have some images
                if (images?.Count > 0)
                {
                    // save property images/photos
                    foreach (var image in images)
                    {
                        var fileName = Path.GetFileName(image.FileName);
                        var uniqueFileName = $"{Guid.NewGuid()}_{fileName}";
                        var filePath = Path.Combine(uploadsPath, uniqueFileName);

                        await using (var stream = new FileStream(filePath, FileMode.Create))
                        {
                            await image.CopyToAsync(stream);
                        }

                        var fullUrl = $"{baseUrl}/uploads/{uniqueFileName}";

                        var propertyImage = new PropertyImage
                        {
                            Url = fullUrl,
                            MediaType = MediaTypeEnum.Image,
                            PropertyId = property.Id,
                        };
                        await propertyImageRepository.InsertAsync(propertyImage);
                    }
                }

                // Save video
                if (video != null)
                {
                    var fileName = Path.GetFileName(video.FileName);
                    var uniqueFileName = $"{Guid.NewGuid()}_{fileName}";
                    var filePath = Path.Combine(uploadsPath, uniqueFileName);

                    await using (var stream = new FileStream(filePath, FileMode.Create))
                    {
                        await video.CopyToAsync(stream);
                    }

                    var fullUrl = $"{baseUrl}/uploads/videos/{uniqueFileName}";

                    var propertyVideo = new PropertyVideo
                    {
                        PropertyId = property.Id,
                        Url = fullUrl
                    };

                    property.PropertyVideo = propertyVideo;
                    await repository.UpdateAsync(property);
                }


                if (input.Amenities?.Count > 0)
                {
                    var amenityGuids = input.Amenities.Select(Guid.Parse).ToList();
                    var amenities = await propertyAmenityRepository.GetListAsync(
                        a => amenityGuids.Contains(a.Id));

                    property.PropertyAmenities = amenities.Select(a => new PropertyAmenity
                    {
                        AmenityId = a.Id
                    }).ToList();
                }


                //save property related features
                if (input.Features?.Count > 0)
                {
                    var featureGuids = input.Features.Select(Guid.Parse).ToList();
                    var features = await propertyFeaturesRepository.GetListAsync(
                        a => featureGuids.Contains(a.Id));

                    property.PropertyFeatures = [.. features.Select(a=>new PropertyFeature
                    {
                        FeatureId = a.Id
                    })];
                }


                //save property related nearby places
                if (input.NearbyPlaces?.Count > 0)
                {
                    var nearbyGuids = input.NearbyPlaces.Select(Guid.Parse).ToList();
                    var places = await propertyNearbyPlacesRepository.GetListAsync(
                        a => nearbyGuids.Contains(a.Id));

                    property.PropertyNearbyPlaces = [.. places.Select(a=>new PropertyNearbyPlace
                    {
                        NearbyPlaceId = a.Id
                    })];
                }
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                throw;
            }
            //}

            var result=  ObjectMapper.Map<Property, PropertyDetailDto>(property);
            return new GeneralResponse(true, "Succesfully created new property", result);
        }
        catch (Exception e)
        {
            //Console.WriteLine(e);
            return new GeneralResponse(false, e.Message, e.StackTrace);
        }

       
    }

    public async Task<PropertyDto> UpdateAsync(Guid id, CreateUpdatePropertyDto input)
    {
        var property = await repository.GetAsync(id);
        ObjectMapper.Map(input, property);
        await repository.UpdateAsync(property);
        return ObjectMapper.Map<Property, PropertyDto>(property);
    }

    public async Task DeleteAsync(Guid id)
    {
        await repository.DeleteAsync(id);
    }

    public async Task<Stream> GetImageAsync(string blobName)
    {
        return await blobContainer.GetAsync(blobName);
    }

    public async Task<Stream> GetVideoAsync(string blobName)
    {
        return await blobContainer.GetAsync(blobName);
    }

    private async Task ValidateRelationships(CreateUpdatePropertyDto input)
    {
        
        //validate property types
        if (!await propertyTypeRepository.AnyAsync(x=>x.Id == input.PropertyTypeId))
        {
            throw new UserFriendlyException(" Invalid Property PropertType specified");
        }
        
        // validate owner exists
        if (!await accountUserRepository.AnyAsync(x=>x.Id == input.OwnerId))
        {
            throw new UserFriendlyException(" Invalid Owner specified");
        }
        
        if (!await governorateRepository.AnyAsync(x=>x.Id == input.GovernorateId))
        {
            throw new UserFriendlyException(" Invalid Governorate specified");
        }
        
        //validate amenities exists
        // if (input.Amenities?.Count >0)
        // {
        //     var amenityGuids = input.Amenities.Select(x => Guid.Parse(x));
        //     var existingAmenitiesCount = await _propertyAmenityRepository.CountAsync(
        //         x=>amenityGuids.Contains(x.Id));
        //
        //     if (existingAmenitiesCount != amenityGuids.Count())
        //     {
        //         throw new UserFriendlyException(" one or more amenities not found");
        //     }
        // }
    }

}
