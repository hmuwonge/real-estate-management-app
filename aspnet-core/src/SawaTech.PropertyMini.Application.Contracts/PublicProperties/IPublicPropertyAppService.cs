using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using SawaTech.PropertyMini.Properties;
using SawaTech.PropertyMini.PropertyEntities;

namespace SawaTech.PropertyMini.PublicProperties;

public interface IPublicPropertyAppService
{
    Task<List<PropertyListDto>> GetPublicPropertyListAsync();
    Task<PropertyDetailDto> GetPublicPropertyAsync(Guid id);
}