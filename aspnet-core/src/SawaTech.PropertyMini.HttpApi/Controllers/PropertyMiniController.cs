using SawaTech.PropertyMini.Localization;
using Volo.Abp.AspNetCore.Mvc;

namespace SawaTech.PropertyMini.Controllers;

/* Inherit your controllers from this class.
 */
public abstract class PropertyMiniController : AbpControllerBase
{
    protected PropertyMiniController()
    {
        LocalizationResource = typeof(PropertyMiniResource);
    }
}
