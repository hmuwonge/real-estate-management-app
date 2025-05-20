using System;
using System.Threading.Tasks;
using SawaTech.PropertyMini.Properties;
using Volo.Abp.Application.Dtos;
using Volo.Abp.Application.Services;

namespace SawaTech.PropertyMini.PropertyData;

public class PropertyAppService : ICrudAppService<PropertyDto,Guid,PagedAndSortedResultRequestDto,CreateUpdatePropertyDto>
{
    public Task<PropertyDto> GetAsync(Guid id)
    {
        throw new NotImplementedException();
    }

    public Task<PagedResultDto<PropertyDto>> GetListAsync(PagedAndSortedResultRequestDto input)
    {
        throw new NotImplementedException();
    }

    public async Task<PropertyDto> CreateAsync(CreateUpdatePropertyDto input)
    {
        throw new NotImplementedException();
    }

    public Task<PropertyDto> UpdateAsync(Guid id, CreateUpdatePropertyDto input)
    {
        throw new NotImplementedException();
    }

    public Task DeleteAsync(Guid id)
    {
        throw new NotImplementedException();
    }
}