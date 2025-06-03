using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using SawaTech.PropertyMini.PublicProperties;
using SawaTech.PropertyMini.PropertyTypes;
using Volo.Abp.Application.Services;
using Volo.Abp.Domain.Repositories;
using SawaTech.PropertyMini.AuthResponses;
using SawaTech.PropertyMini.Amenities;
using SawaTech.PropertyMini.PropertyAmenities;
using Volo.Abp.ObjectMapping;
using Microsoft.Extensions.Caching.Memory;

namespace SawaTech.PropertyMini.PropertyFeatures
{
    //[Authorize]
    public class PropertyFeatureAppService : ApplicationService, IPropertyFeatureAppService
    {
        private readonly IRepository<Feature, Guid> _repository;
        private readonly IMemoryCache _memoryCache;

        public PropertyFeatureAppService(IRepository<Feature, Guid> repository, IMemoryCache memoryCache)
        {
            _repository = repository;
            _memoryCache = memoryCache;
        }

        public async Task<GeneralResponse> GetListAsync()
        {
            try
            {
                const string cacheKey = "PublicFeatureList";

                if (!_memoryCache.TryGetValue(cacheKey, out List<PropertyFeatureDto>? cachedList)) // Use nullable type for cachedList  
                {
                    var features = await _repository.GetListAsync();
                    cachedList = ObjectMapper.Map<List<Feature>, List<PropertyFeatureDto>>(features);

                    // Cache for 5 minutes  
                    _memoryCache.Set(cacheKey, cachedList, TimeSpan.FromMinutes(5));
                }

                return new GeneralResponse(true, "Success", cachedList);
            }
            catch (Exception ex)
            {
                return new GeneralResponse(false, ex.Message, ex.StackTrace);
            }

        }

        public async Task<PropertyFeatureDto> GetAsync(Guid id)
        {
            var propertyFeature = await _repository.GetAsync(id);
            return ObjectMapper.Map<Feature, PropertyFeatureDto>(propertyFeature);
        }

        public async Task<GeneralResponse> CreateAsync(CreateUpdatePropertyFeaturesDto input)
        {

            var propertyFeature = new Feature
            {
                Name = input.Name,
                IconUrl = input.IconUrl,
            };
            await _repository.InsertAsync(propertyFeature);
            var amenity = ObjectMapper.Map<Feature, PropertyFeatureDto>(propertyFeature);
            return new GeneralResponse(true, "Successfully create amenity", amenity);
        }

        public async Task<PropertyFeatureDto> UpdateAsync(
            Guid id,
            CreateUpdatePropertyFeaturesDto input
        )
        {
            var propertyFeature = await _repository.GetAsync(id);
            propertyFeature.Name = input.Name;
            propertyFeature.IconUrl = input.IconUrl;
            await _repository.UpdateAsync(propertyFeature);
            return ObjectMapper.Map<Feature, PropertyFeatureDto>(propertyFeature);
        }

        public async Task DeleteAsync(Guid id)
        {
            var propertyFeature = await _repository.GetAsync(id);
            if (propertyFeature == null)
            {
                throw new Exception("Property feature not found");
            }
            await _repository.DeleteAsync(propertyFeature);
        }
    }
}
