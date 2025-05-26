using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using SawaTech.PropertyMini.Properties;

namespace SawaTech.PropertyMini.PublicProperties;

public interface IPublicPropertyAppService
{
    Task<List<PropertyDetailDto>> GetPublicPropertyListAsync();
    Task<PropertyDto> GetPublicPropertyAsync(Guid id);
}