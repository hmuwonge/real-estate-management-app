using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using SawaTech.PropertyMini.AuthResponses;
using SawaTech.PropertyMini.Properties;
using SawaTech.PropertyMini.PublicProperties;

namespace SawaTech.PropertyMini.PublicProperties;

public interface IPublicPropertyAppService
{
    Task<GeneralResponse> GetPublicPropertyListAsync();
    Task<GeneralResponse> GetPublicPropertyAsync(Guid id);
}