using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using SawaTech.PropertyMini.PropertyFeatures;
using Volo.Abp.Application.Services;

namespace SawaTech.PropertyMini.PropertyTypes
{
    public interface IPropertyTypeAppService : IApplicationService
    {
        Task<List<PropertTypeDto>> GetListAsync();
        Task<PropertTypeDto> GetAsync(Guid id);
        Task<PropertTypeDto> CreateAsync(CreateUpdatePropertyTypeDto input);
        Task<PropertTypeDto> UpdateAsync(Guid id, CreateUpdatePropertyTypeDto input);
        Task DeleteAsync(Guid id);
    }
   
   
}
