using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SawaTech.PropertyMini.PropertyEntities;
using Volo.Abp.Application.Services;
using Volo.Abp.Domain.Repositories;

namespace SawaTech.PropertyMini.PropertyFeatures
{
    public class PropertyFeatureAppService: ApplicationService, IPropertyFeatureAppService
    {
        private readonly IRepository<PropertyFeature, Guid> _repository;

        public PropertyFeatureAppService(IRepository<PropertyFeature, Guid> repository)
        {
            _repository = repository;
        }
        public async Task<List<PropertyFeatureDto>> GetListAsync()
        {
            var propertyFeatures = await _repository.GetListAsync();
            return ObjectMapper.Map<List<PropertyFeature>, List<PropertyFeatureDto>>(propertyFeatures);
        }
        
        public Task<PropertyFeatureDto> GetAsync(Guid id)
        {
            throw new NotImplementedException();
        }
        public async Task<PropertyFeatureDto> CreateAsync(CreateUpdatePropertyFeatureDto input)
        {
           var propertyFeature = ObjectMapper.Map<CreateUpdatePropertyFeatureDto, PropertyFeature>(input);
            await _repository.InsertAsync(propertyFeature);
            return ObjectMapper.Map<PropertyFeature, PropertyFeatureDto>(propertyFeature);
        }
        public Task<PropertyFeatureDto> UpdateAsync(Guid id, CreateUpdatePropertyFeatureDto input)
        {
            throw new NotImplementedException();
        }
        public Task DeleteAsync(Guid id)
        {
            throw new NotImplementedException();
        }
    }
    
}
