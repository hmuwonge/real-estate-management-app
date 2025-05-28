using Microsoft.Extensions.Localization;
using SawaTech.PropertyMini.Localization;
using Volo.Abp.DependencyInjection;
using Volo.Abp.Ui.Branding;

namespace SawaTech.PropertyMini;

[Dependency(ReplaceServices = true)]
public class PropertyMiniBrandingProvider : DefaultBrandingProvider
{
    private readonly IStringLocalizer<PropertyMiniResource> _localizer;

    public PropertyMiniBrandingProvider(IStringLocalizer<PropertyMiniResource> localizer)
    {
        _localizer = localizer;
    }

    public override string AppName => _localizer["AppName"];
}
