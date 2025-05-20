using System;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;
using SawaTech.PropertyMini.Data;
using Volo.Abp.DependencyInjection;

namespace SawaTech.PropertyMini.EntityFrameworkCore;

public class EntityFrameworkCorePropertyMiniDbSchemaMigrator
    : IPropertyMiniDbSchemaMigrator, ITransientDependency
{
    private readonly IServiceProvider _serviceProvider;

    public EntityFrameworkCorePropertyMiniDbSchemaMigrator(
        IServiceProvider serviceProvider)
    {
        _serviceProvider = serviceProvider;
    }

    public async Task MigrateAsync()
    {
        /* We intentionally resolve the PropertyMiniDbContext
         * from IServiceProvider (instead of directly injecting it)
         * to properly get the connection string of the current tenant in the
         * current scope.
         */

        await _serviceProvider
            .GetRequiredService<PropertyMiniDbContext>()
            .Database
            .MigrateAsync();
    }
}
