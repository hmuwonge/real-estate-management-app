using Volo.Abp.Modularity;

namespace SawaTech.PropertyMini;

[DependsOn(
    typeof(PropertyMiniDomainModule),
    typeof(PropertyMiniTestBaseModule)
)]
public class PropertyMiniDomainTestModule : AbpModule
{

}
