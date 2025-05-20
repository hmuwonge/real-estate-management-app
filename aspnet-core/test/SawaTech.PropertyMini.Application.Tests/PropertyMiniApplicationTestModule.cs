using Volo.Abp.Modularity;

namespace SawaTech.PropertyMini;

[DependsOn(
    typeof(PropertyMiniApplicationModule),
    typeof(PropertyMiniDomainTestModule)
)]
public class PropertyMiniApplicationTestModule : AbpModule
{

}
