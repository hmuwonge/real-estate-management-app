using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using SawaTech.PropertyMini.AuthResponses;
using SawaTech.PropertyMini.PropertyFeatures;
using Volo.Abp.Application.Services;

namespace SawaTech.PropertyMini.PropertyTypes
{
    public interface IPropertyTypeAppService : IApplicationService
    {
        Task<GeneralResponse> GetListAsync();
        Task<PropertyTypeDto> GetAsync(Guid id);
        Task<GeneralResponse> CreateAsync(CreateUpdatePropertyTypeDto input);
        Task<PropertyTypeDto> UpdateAsync(Guid id, CreateUpdatePropertyTypeDto input);
        Task DeleteAsync(Guid id);
    }
   
   
}
