using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using SawaTech.PropertyMini.Amenities;
using SawaTech.PropertyMini.Governorates;
using SawaTech.PropertyMini.Properties;
using SawaTech.PropertyMini.PropertyEntities;
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

public class PropertyAppService : ApplicationService, IPropertyAppService, ITransientDependency
{
    private readonly IRepository<Property, Guid> _repository;
    private readonly IBlobContainer<PropertyGalleryContainer> _blobContainer;
    private readonly IRepository<PropertyImage, Guid> _propertyImageRepository;
    private readonly IRepository<Amenity, Guid> _propertyAmenityRepository;
    private readonly IRepository<AccountUser, Guid> _accountUserRepository;
    private readonly IRepository<Governorate, Guid> _governorateRepository;
    private readonly IUnitOfWorkManager _unitOfWorkManager;
    private readonly IRepository<PropertyType, Guid> _propertyTypeRepository;

    private readonly IRepository<PropertyVideo, Guid> _propertViedoRepository;
    public PropertyAppService(
        IRepository<Property, Guid> repository,
        IBlobContainer<PropertyGalleryContainer> blobContainer,
        IRepository<PropertyImage, Guid> propertyImageRepository,
    IRepository<PropertyVideo, Guid> propertyVideoRepository,
        IRepository<Amenity, Guid> propertyAmenityRepository,
        IRepository<AccountUser, Guid> accountUserRepository,
        IRepository<Governorate, Guid> governorateRepository,
        IRepository<PropertyType, Guid> propertyTypeRepository, 
        IUnitOfWorkManager unitOfWorkManager
    )
    {
        _repository = repository;
        _blobContainer = blobContainer;
        _propertyImageRepository = propertyImageRepository;
        _propertViedoRepository = propertyVideoRepository;
        _propertyAmenityRepository = propertyAmenityRepository;
        _accountUserRepository = accountUserRepository;
        _governorateRepository = governorateRepository;
        _unitOfWorkManager = unitOfWorkManager;
        _propertyTypeRepository = propertyTypeRepository;
    }

    public async Task<ListResultDto<PropertyDto>> GetListAsync(
        PropertyFilterDto? filterDto = null,
        string? sortBy = null,
        bool sortDescending = false,
        int? maxResults = 10
    )
    {
        // 1. Get base queryable
        var queryable = (await _repository.GetQueryableAsync()).AsQueryable();

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

            //if(filterDto.PropertType.HasValue)
            //{
            //    queryable = queryable.Where(p => p.PropertType == filterDto.PropertType.Value);
            //}

            //if (filterDto.Status.HasValue)
            //{
            //    queryable = queryable.Where(p => p.Status == filterDto.Status.Value);
            //}
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
        var property = await _repository.GetAsync(id);
        return ObjectMapper.Map<Property, PropertyDto>(property);
    }

    public async Task<PropertyDto> CreateAsync([FromForm] CreateUpdatePropertyDto input)
    {
        await ValidateRelationships(input);
        // var property = ObjectMapper.Map<CreateUpdatePropertyDto, Property>(input);

        var guidType = Guid.Parse(input.PropertyTypeId.ToString());
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
            Type = input.PropertyTypeId,
            OwnerId = input.OwnerId,
            // Governorate= new Governorate {Id = input.GovernorateId},
            GovernorateId = input.GovernorateId,
        };
        
        
        var images = input.PhotoUrls;
        var video = input.VideoUrl;
        
        Console.WriteLine($" Property being saved::{property}" );
        // await _repository.InsertAsync(property, autoSave: true);

        using (var uow = _unitOfWorkManager.Begin(requiresNew: true))
        {
            try
            {
                if (images?.Count > 0)
                {
                    // save property images/photos
                    foreach (var image in images)
                    {
                        var blobName =
                            $"images/{property.Id}/{Guid.NewGuid()}{Path.GetExtension(image.FileName)}"; // $"/{property.Id}/gallery/{Guid.NewGuid()}_{image.FileName}";
                        using var stream = image.OpenReadStream();
                    
                        await _blobContainer.SaveAsync(blobName, stream, overrideExisting: true);
                    
                        var propertyImage = new PropertyImage
                        {
                            Url = blobName,
                            MediaType = MediaTypeEnum.Image,
                            PropertyId = property.Id,
                        };
                        await _propertyImageRepository.InsertAsync(propertyImage);
                    }
                }
        
                if (input.Amenities?.Count > 0)
                {
                    var amenityGuids = input.Amenities.Select(Guid.Parse).ToList();
                    var amenities = await _propertyAmenityRepository.GetListAsync(
                        a => amenityGuids.Contains(a.Id));
                    
                    property.PropertyAmenities = amenities.Select(a=>new PropertyAmenity
                    {
                        AmenityId = a.Id
                    }).ToList();
                }
                Console.WriteLine($" Property being saved::{property}" );
                await _repository.InsertAsync(property, autoSave: true);
        
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                throw;
            }
        }

        

        

        // Save video
        // if (video != null)
        // {
        //     string blobName = $"videos/{property.Id}/{Guid.NewGuid()}_{video.FileName}";
        //     using var stream = video.OpenReadStream();
        //     await _blobContainer.SaveAsync(blobName, stream, overrideExisting: true);
        //     property.PropertyVideo = blobName;
        // }

        return ObjectMapper.Map<Property, PropertyDto>(property);
    }

    public async Task<PropertyDto> UpdateAsync(Guid id, CreateUpdatePropertyDto input)
    {
        var property = await _repository.GetAsync(id);
        ObjectMapper.Map(input, property);
        await _repository.UpdateAsync(property);
        return ObjectMapper.Map<Property, PropertyDto>(property);
    }

    public async Task DeleteAsync(Guid id)
    {
        await _repository.DeleteAsync(id);
    }

    public async Task<Stream> GetImageAsync(string blobName)
    {
        return await _blobContainer.GetAsync(blobName);
    }

    public async Task<Stream> GetVideoAsync(string blobName)
    {
        return await _blobContainer.GetAsync(blobName);
    }

    private async Task ValidateRelationships(CreateUpdatePropertyDto input)
    {
        
        //validate property types
        if (!await _propertyTypeRepository.AnyAsync(x=>x.Id == input.PropertyTypeId))
        {
            throw new UserFriendlyException(" Invalid Property PropertType specified");
        }
        
        // validate owner exists
        if (!await _accountUserRepository.AnyAsync(x=>x.Id == input.OwnerId))
        {
            throw new UserFriendlyException(" Invalid Owner specified");
        }
        
        if (!await _governorateRepository.AnyAsync(x=>x.Id == input.GovernorateId))
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
