using Abp.AspNetCore.Mvc.Controllers;
using SawaTech.PropertyMini.Localization;
using Volo.Abp.AspNetCore.Mvc;
using Volo.Abp.Localization;

namespace SawaTech.PropertyMini.Controllers;

/* Inherit your controllers from this class.
 */
public abstract class PropertyMiniController : AbpController
{
    protected PropertyMiniController()
    {
        //LocalizationResource = typeof(PropertyMiniResource);
    }
}
