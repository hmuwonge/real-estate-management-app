using System.Threading.Tasks;
using Volo.Abp.Application.Dtos;
using Volo.Abp.Application.Services;

namespace SawaTech.PropertyMini.Properties;

public interface IProductPropertyAppService: IApplicationService
{
    Task<ListResultDto<PropertyDto>> GetListAsync(PropertyFilterDto? filterDto =null,
        string? sortBy=null, bool sortDescending=false,int? maxResults=10);    
}
