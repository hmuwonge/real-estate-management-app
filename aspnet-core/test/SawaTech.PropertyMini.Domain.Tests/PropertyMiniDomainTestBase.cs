using Volo.Abp.Modularity;

namespace SawaTech.PropertyMini;

/* Inherit from this class for your domain layer tests. */
public abstract class PropertyMiniDomainTestBase<TStartupModule> : PropertyMiniTestBase<TStartupModule>
    where TStartupModule : IAbpModule
{

}
