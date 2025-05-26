using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SawaTech.PropertyMini.PropertyEntities;
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

        public async Task<PropertTypeDto> CreateAsync(CreateUpdatePropertyTypeDto input)
        {
            //var propertyType = ObjectMapper.Map<CreateUpdatePropertyTypeDto, PropertyType>(input);
            var propertyType = new PropertyType
            {
                Name = input.Name
            };
            await _repository.InsertAsync(propertyType);

            return ObjectMapper.Map<PropertyType, PropertTypeDto>(propertyType);
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

        public  async Task<PropertTypeDto> GetAsync(Guid id)
        {

            var propertyType = await _repository.GetAsync(id);
            return ObjectMapper.Map<PropertyType, PropertTypeDto>(propertyType);
        }

        public async Task<List<PropertTypeDto>> GetListAsync()
        {

            var propertyTypes = await _repository.GetListAsync(); // Await the Task to get the actual List<PropertyType>
            return ObjectMapper.Map<List<PropertyType>, List<PropertTypeDto>>(propertyTypes);
        }

        public async Task<PropertTypeDto> UpdateAsync(Guid id, CreateUpdatePropertyTypeDto input)
        {

            var propertyType = await _repository.GetAsync(id);
            ObjectMapper.Map(input, propertyType);
            return ObjectMapper.Map<PropertyType, PropertTypeDto>(propertyType);
        }
    }
    
}
