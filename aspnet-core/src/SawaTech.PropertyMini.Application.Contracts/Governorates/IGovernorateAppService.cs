using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Volo.Abp.Application.Services;

namespace SawaTech.PropertyMini.Governorates;

public interface IGovernorateAppService : IApplicationService
{
    Task<List<GovernorateDto>> GetListAsync();
    Task<GovernorateDto> GetAsync(Guid id);
    Task<GovernorateDto> CreateAsync(CreateUpdateGovernorateDto input);
    Task<GovernorateDto> UpdateAsync(Guid id, CreateUpdateGovernorateDto input);
    Task DeleteAsync(Guid id);
}
