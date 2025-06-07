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

        public async Task<GeneralResponse> CreateAsync(CreateUpdatePropertyTypeDto input)
        {
            try
            {
                var propertyType = new PropertyType
                {
                    Name = input.Name
                };
                await _repository.InsertAsync(propertyType);

                var obj = ObjectMapper.Map<PropertyType, PropertyTypeDto>(propertyType);
                return new GeneralResponse(true, "Property type created successfully", obj);
            }
            catch (Exception ex)
            {
                return new GeneralResponse(false, "Error creating property type: " + ex.Message);
            }
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
            try
            {
                // Check if the repository is null
                if (_repository == null)
                {
                    return new GeneralResponse(false, "Repository is not initialized.");
                }
                // Retrieve all property types from the repository
                var propertyTypes = await _repository.GetListAsync();
                // Map the list of PropertyType entities to a list of PropertyTypeDto
                var propertyTypeDtos = propertyTypes.Select(pt => ObjectMapper.Map<PropertyType, PropertyTypeDto>(pt)).ToList();
                // Return the list wrapped in a GeneralResponse
                return new GeneralResponse(true, "Property types retrieved successfully", propertyTypeDtos);
            }
            catch (Exception ex)
            {
                return new GeneralResponse(false, "Error retrieving property types: " + ex.Message);

            }
        }

        public async Task<PropertyTypeDto> UpdateAsync(Guid id, CreateUpdatePropertyTypeDto input)
        {

            var propertyType = await _repository.GetAsync(id);
            ObjectMapper.Map(input, propertyType);
            return ObjectMapper.Map<PropertyType, PropertyTypeDto>(propertyType);
        }
    }
    
}
