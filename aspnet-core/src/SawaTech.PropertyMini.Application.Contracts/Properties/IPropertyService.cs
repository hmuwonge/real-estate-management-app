using System;
using Volo.Abp.Application.Dtos;
using Volo.Abp.Application.Services;

namespace SawaTech.PropertyMini.Properties;

public interface IPropertyService: ICrudAppService<
    PropertyDto,Guid, 
    PagedAndSortedResultRequestDto,
    CreateUpdatePropertyDto>
{
    
}