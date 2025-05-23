using System;
using System.Collections.Generic;
using System.Globalization;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Volo.Abp.Application.Dtos;
using Volo.Abp.Application.Services;

namespace SawaTech.PropertyMini.Properties;

public interface IPropertyAppService: IApplicationService
{
    Task<ListResultDto<PropertyDto>> GetListAsync(PropertyFilterDto? filterDto =null, string? sortBy=null, bool sortDescending=false,int? maxResults=10);
    Task<PropertyDto> GetAsync(Guid id);
    Task<PropertyDto> CreateAsync(CreateUpdatePropertyDto input);
    Task<PropertyDto> UpdateAsync(Guid id, CreateUpdatePropertyDto input);
    Task DeleteAsync(Guid id);
    //Task<PagedResultDto<PropertyDto>> GetListAsync(PagedAndSortedResultRequestDto input, PropertyFilterDto filter = null);
}
