using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using SawaTech.PropertyMini.AuthResponses;
using Volo.Abp.Application.Services;

namespace SawaTech.PropertyMini.PropertyAmenities
{
    public interface IAmenityAppService : IApplicationService
    {
        Task<GeneralResponse> GetListAsync();
        Task<AmenityDto> GetAsync(Guid id);
        Task<GeneralResponse> CreateAsync(CreateUpdateAmenityDto input);
        Task<AmenityDto> UpdateAsync(Guid id, CreateUpdateAmenityDto input);
        Task<GeneralResponse> DeleteAsync(Guid id);
    }
   
}
