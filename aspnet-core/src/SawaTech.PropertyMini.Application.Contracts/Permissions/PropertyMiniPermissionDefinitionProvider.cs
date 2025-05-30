using SawaTech.PropertyMini.Localization;
using Volo.Abp.Authorization.Permissions;
using Volo.Abp.Localization;

namespace SawaTech.PropertyMini.Permissions;

public class PropertyMiniPermissionDefinitionProvider : PermissionDefinitionProvider
{
    public override void Define(IPermissionDefinitionContext context)
    {
        var myGroup = context.AddGroup(PropertyMiniPermissions.GroupName);
    }

    private static LocalizableString L(string name)
    {
        return LocalizableString.Create<PropertyMiniResource>(name);
    }
}
