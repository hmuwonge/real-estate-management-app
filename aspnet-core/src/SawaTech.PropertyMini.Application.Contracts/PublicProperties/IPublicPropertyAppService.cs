using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using SawaTech.PropertyMini.Properties;

namespace SawaTech.PropertyMini.PublicProperties;

public interface IPublicPropertyAppService
{
    Task<List<PropertyDto>> GetPublicPropertyListAsync();
    Task<PropertyDto> GetPublicPropertyAsync(Guid id);
}