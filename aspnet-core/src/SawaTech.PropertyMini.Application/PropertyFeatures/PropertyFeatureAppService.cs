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

namespace SawaTech.PropertyMini.PropertyFeatures
{
    //[Authorize]
    public class PropertyFeatureAppService : ApplicationService, IPropertyFeatureAppService
    {
        private readonly IRepository<Feature, Guid> _repository;

        public PropertyFeatureAppService(IRepository<Feature, Guid> repository)
        {
            _repository = repository;
        }

        public async Task<List<PropertyFeatureDto>> GetListAsync()
        {
            var propertyFeatures = await _repository.GetListAsync();
            return ObjectMapper.Map<List<Feature>, List<PropertyFeatureDto>>(
                propertyFeatures
            );
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
            var amenity= ObjectMapper.Map<Feature, PropertyFeatureDto>(propertyFeature);
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
