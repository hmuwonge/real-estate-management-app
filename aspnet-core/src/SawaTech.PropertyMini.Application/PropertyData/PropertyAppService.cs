using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using SawaTech.PropertyMini.Properties;
using SawaTech.PropertyMini.PropertyEntities;
using Volo.Abp.Application.Dtos;
using Volo.Abp.Application.Services;
using Volo.Abp.BlobStoring;
using Volo.Abp.DependencyInjection;
using Volo.Abp.Domain.Repositories;
using static Volo.Abp.Http.MimeTypes;

namespace SawaTech.PropertyMini.PropertyData;

public class PropertyAppService : ApplicationService,IPropertyAppService,ITransientDependency
{
    private readonly IRepository<Property, Guid> _repository;
    private readonly IBlobContainer<PropertyGalleryContainer> _blobContainer;
    private readonly IRepository<PropertyImage, Guid> _propertyImageRepository;
    //private readonly IRepository<PropertyVideo, Guid> _propertViedoRepository;
    public PropertyAppService(
        IRepository<Property, Guid> repository,
        IBlobContainer<PropertyGalleryContainer> blobContainer,
        IRepository<PropertyImage, Guid> propertyImageRepository
        //IRepository<PropertyVideo, Guid> propertyVideoRepository
        )
    {
        _repository = repository;
        _blobContainer = blobContainer;
        _propertyImageRepository = propertyImageRepository;
        //_propertViedoRepository = propertyVideoRepository;
    }

    public async Task<ListResultDto<PropertyDto>> GetListAsync(
    PropertyFilterDto? filterDto = null,
    string? sortBy = null,
    bool sortDescending = false,int? maxResults=10)
    {
        // 1. Get base queryable
        var queryable = (await _repository.GetQueryableAsync()).AsQueryable();

        // 2. Apply filters
        if (filterDto != null)
        {
            if (!string.IsNullOrWhiteSpace(filterDto.AddressKeyword))
            {
                queryable = queryable.Where(p =>
                    p.Address.Contains(filterDto.AddressKeyword));
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

            //if(filterDto.Type.HasValue)
            //{
            //    queryable = queryable.Where(p => p.Type == filterDto.Type.Value);
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

            _ => queryable.OrderBy(p => p.Price) // Default
        };

        // 4. Execute query and map results
        var properties = await AsyncExecuter.ToListAsync(queryable);
        return new ListResultDto<PropertyDto>(
            ObjectMapper.Map<List<Property>, List<PropertyDto>>(properties));
    }
    public async Task<PropertyDto> GetAsync(Guid id)
    {
        var property = await _repository.GetAsync(id);
        return ObjectMapper.Map<Property, PropertyDto>(property);
    }
    public async Task<PropertyDto> CreateAsync([FromForm]  CreateUpdatePropertyDto input)
    {
        var property = ObjectMapper.Map<CreateUpdatePropertyDto, Property>(input);
        await _repository.InsertAsync(property);

        var images = input.PhotoUrls;
        var video =input.VideoUrl;

        // save property images/photos
        foreach (var image in images)
        {
            var blobName = $"images/{property.Id}/{Guid.NewGuid()}{Path.GetExtension(image.FileName)}"; // $"/{property.Id}/gallery/{Guid.NewGuid()}_{image.FileName}";
            using var stream = image.OpenReadStream();

            await _blobContainer.SaveAsync(blobName,stream, overrideExisting: true);

            var propertyImage = new PropertyImage
            {
                Url = blobName,
                MediaType = MediaTypeEnum.Image,
                PropertyId = property.Id
            };
            await _propertyImageRepository.InsertAsync(propertyImage);
        }

        // Save video
        //if (video != null)
        //{
        //    var blobName = $"properties/{property.Id}/videos/{Guid.NewGuid()}_{video.FileName}";
        //    using var stream = video.OpenReadStream();
        //    await _blobContainer.SaveAsync(blobName, stream, overrideExisting: true);
        //    property.PropertyVideo = blobName;
        //}

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


}