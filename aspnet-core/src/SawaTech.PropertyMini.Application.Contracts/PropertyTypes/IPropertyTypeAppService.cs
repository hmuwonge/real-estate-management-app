using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using SawaTech.PropertyMini.PropertyFeatures;
using Volo.Abp.Application.Services;

namespace SawaTech.PropertyMini.PropertyTypes
{
    public interface IPropertyTypeAppService : IApplicationService
    {
        Task<List<PropertyTypeDto>> GetListAsync();
        Task<PropertyTypeDto> GetAsync(Guid id);
        Task<PropertyTypeDto> CreateAsync(CreateUpdatePropertyTypeDto input);
        Task<PropertyTypeDto> UpdateAsync(Guid id, CreateUpdatePropertyTypeDto input);
        Task DeleteAsync(Guid id);
    }
   
   
}
