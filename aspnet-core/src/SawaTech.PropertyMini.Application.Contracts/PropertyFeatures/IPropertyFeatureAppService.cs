using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using SawaTech.PropertyMini.AuthResponses;
using SawaTech.PropertyMini.PropertyTypes;
using Volo.Abp.Application.Services;

namespace SawaTech.PropertyMini.PropertyFeatures
{
    public interface IPropertyFeatureAppService : IApplicationService
    {
        Task<GeneralResponse> GetListAsync();
        Task<PropertyFeatureDto> GetAsync(Guid id);
        Task<GeneralResponse> CreateAsync(CreateUpdatePropertyFeaturesDto input);
        Task<PropertyFeatureDto> UpdateAsync(Guid id, CreateUpdatePropertyFeaturesDto input);
        Task DeleteAsync(Guid id);
    }
   
}
