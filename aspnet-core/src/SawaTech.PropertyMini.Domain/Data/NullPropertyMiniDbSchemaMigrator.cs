using System.Threading.Tasks;
using Volo.Abp.DependencyInjection;

namespace SawaTech.PropertyMini.Data;

/* This is used if database provider does't define
 * IPropertyMiniDbSchemaMigrator implementation.
 */
public class NullPropertyMiniDbSchemaMigrator : IPropertyMiniDbSchemaMigrator, ITransientDependency
{
    public Task MigrateAsync()
    {
        return Task.CompletedTask;
    }
}
