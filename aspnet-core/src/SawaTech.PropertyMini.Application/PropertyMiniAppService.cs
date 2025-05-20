using System;
using System.Collections.Generic;
using System.Text;
using SawaTech.PropertyMini.Localization;
using Volo.Abp.Application.Services;

namespace SawaTech.PropertyMini;

/* Inherit your application services from this class.
 */
public abstract class PropertyMiniAppService : ApplicationService
{
    protected PropertyMiniAppService()
    {
        LocalizationResource = typeof(PropertyMiniResource);
    }
}
