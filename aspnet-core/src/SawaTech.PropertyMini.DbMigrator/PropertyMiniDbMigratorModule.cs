using SawaTech.PropertyMini.EntityFrameworkCore;
using Volo.Abp.Autofac;
using Volo.Abp.Modularity;

namespace SawaTech.PropertyMini.DbMigrator;

[DependsOn(
    typeof(AbpAutofacModule),
    typeof(PropertyMiniEntityFrameworkCoreModule),
    typeof(PropertyMiniApplicationContractsModule)
    )]
public class PropertyMiniDbMigratorModule : AbpModule
{
}
