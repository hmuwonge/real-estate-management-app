using Volo.Abp.Modularity;

namespace SawaTech.PropertyMini;

public abstract class PropertyMiniApplicationTestBase<TStartupModule> : PropertyMiniTestBase<TStartupModule>
    where TStartupModule : IAbpModule
{

}
