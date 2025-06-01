using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using SawaTech.PropertyMini.AuthResponses;
using SawaTech.PropertyMini.Properties;
using SawaTech.PropertyMini.PublicProperties;

namespace SawaTech.PropertyMini.PublicProperties;

public interface IPublicPropertyAppService
{
    Task<AuthResponses.GeneralResponse> GetPublicPropertyListAsync();
    Task<AuthResponses.GeneralResponse> GetExploreHomePropertyListAsync();
    Task<AuthResponses.GeneralResponse> GetPublicPropertyAsync(Guid id);
}