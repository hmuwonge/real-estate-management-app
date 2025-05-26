using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using SawaTech.PropertyMini.Properties;

namespace SawaTech.PropertyMini.PublicProperties;

public interface IPublicPropertyAppService
{
    Task<IEnumerable<PropertyDto>> GetPublicPropertyListAsync();
    Task<PropertyDto> GetPublicPropertyAsync(Guid id);
}