using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Volo.Abp.Application.Services;

namespace SawaTech.PropertyMini.PropertyFeatures
{
    public interface IPropertyFeatureAppService : IApplicationService
    {
        Task<List<PropertyFeatureDto>> GetListAsync();
        Task<PropertyFeatureDto> GetAsync(Guid id);
        Task<PropertyFeatureDto> CreateAsync(CreateUpdatePropertyFeatureDto input);
        Task<PropertyFeatureDto> UpdateAsync(Guid id, CreateUpdatePropertyFeatureDto input);
        Task DeleteAsync(Guid id);
    }
   
}
