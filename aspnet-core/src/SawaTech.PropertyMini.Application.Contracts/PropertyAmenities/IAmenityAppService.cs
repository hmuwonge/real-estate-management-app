using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Volo.Abp.Application.Services;

namespace SawaTech.PropertyMini.PropertyAmenities
{
    public interface IAmenityAppService : IApplicationService
    {
        Task<List<AmenityDto>> GetListAsync();
        Task<AmenityDto> GetAsync(Guid id);
        Task<AmenityDto> CreateAsync(CreateUpdateAmenityDto input);
        Task<AmenityDto> UpdateAsync(Guid id, CreateUpdateAmenityDto input);
        Task DeleteAsync(Guid id);
    }
   
}
