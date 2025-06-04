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
        Task<GeneralResponse> GetAsync(Guid id);
        Task<GeneralResponse> CreateAsync(CreateUpdateAmenityDto input);
        Task<GeneralResponse> UpdateAsync(Guid id, CreateUpdateAmenityDto input);
        Task<GeneralResponse> DeleteAsync(Guid id);
    }
   
}
