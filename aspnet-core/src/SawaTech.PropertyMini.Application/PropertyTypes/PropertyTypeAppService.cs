using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SawaTech.PropertyMini.AuthResponses;
using SawaTech.PropertyMini.PublicProperties;
using Volo.Abp.Application.Services;
using Volo.Abp.Domain.Repositories;
using Volo.Abp.ObjectMapping;

namespace SawaTech.PropertyMini.PropertyTypes
{
    public class PropertyTypeAppService: ApplicationService, IPropertyTypeAppService
    {
        private readonly IRepository<PropertyType, Guid> _repository;

        public PropertyTypeAppService(IRepository<PropertyType, Guid> repository)
        {
            _repository = repository;
        }

        public async Task<PropertyTypeDto> CreateAsync(CreateUpdatePropertyTypeDto input)
        {
            var propertyType = new PropertyType
            {
                Name = input.Name
            };
            await _repository.InsertAsync(propertyType);

            return ObjectMapper.Map<PropertyType, PropertyTypeDto>(propertyType);
        }

        public async Task DeleteAsync(Guid id)
        {

            var propertyType = await _repository.GetAsync(id);
            if (propertyType == null)
            {
                throw new Exception("Property feature not found");
            }
            await _repository.DeleteAsync(propertyType);
        }

        public  async Task<PropertyTypeDto> GetAsync(Guid id)
        {

            var propertyType = await _repository.GetAsync(id);
            return ObjectMapper.Map<PropertyType, PropertyTypeDto>(propertyType);
        }

        public async Task<GeneralResponse> GetListAsync()
        {

            var propertyTypes = await _repository.GetListAsync(); // Await the Task to get the actual List<PropertyType>
            var results =  ObjectMapper.Map<List<PropertyType>, List<PropertyTypeDto>>(propertyTypes);
            return new GeneralResponse(true, "Success", results);
        }

        public async Task<PropertyTypeDto> UpdateAsync(Guid id, CreateUpdatePropertyTypeDto input)
        {

            var propertyType = await _repository.GetAsync(id);
            ObjectMapper.Map(input, propertyType);
            return ObjectMapper.Map<PropertyType, PropertyTypeDto>(propertyType);
        }
    }
    
}
