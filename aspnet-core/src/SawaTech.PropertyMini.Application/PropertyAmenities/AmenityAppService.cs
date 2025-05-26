using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using SawaTech.PropertyMini.Amenities;
using SawaTech.PropertyMini.PropertyEntities;
using Volo.Abp.Application.Services;
using Volo.Abp.Domain.Repositories;
using Volo.Abp.ObjectMapping;

namespace SawaTech.PropertyMini.PropertyAmenities
{
    [Authorize]
    public class AmenityAppService: ApplicationService, IAmenityAppService
    {
        private readonly IRepository<Amenity, Guid> _repository;

        public AmenityAppService(IRepository<Amenity, Guid> repository)
        {
            _repository = repository;
        }

        public async  Task<AmenityDto> CreateAsync(CreateUpdateAmenityDto input)
        {
            
            var amenity = ObjectMapper.Map<CreateUpdateAmenityDto, Amenity>(input);
            await _repository.InsertAsync(amenity);
            return ObjectMapper.Map<Amenity, AmenityDto>(amenity);
        }

        public Task DeleteAsync(Guid id)
        {
            return _repository.DeleteAsync(id);
        }

        public async Task<AmenityDto> GetAsync(Guid id)
        {
            var propertyType = await _repository.GetAsync(id);
            return ObjectMapper.Map<Amenity, AmenityDto>(propertyType);
        }

        public async Task<List<AmenityDto>> GetListAsync()
        {
            var amenities = await _repository.GetListAsync(); // Await the Task to get the actual List<Amenity>
            return ObjectMapper.Map<List<Amenity>, List<AmenityDto>>(amenities);
        }

        public async Task<AmenityDto> UpdateAsync(Guid id, CreateUpdateAmenityDto input)
        {
            var propertyType = await _repository.GetAsync(id);
            ObjectMapper.Map(input, propertyType);
            return ObjectMapper.Map<Amenity, AmenityDto>(propertyType);
        }
    }
    
}
