using System.Threading.Tasks;

namespace SawaTech.PropertyMini.Data;

public interface IPropertyMiniDbSchemaMigrator
{
    Task MigrateAsync();
}
