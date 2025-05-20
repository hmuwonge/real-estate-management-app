using System;
using System.IO;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Design;
using Microsoft.Extensions.Configuration;

namespace SawaTech.PropertyMini.EntityFrameworkCore;

/* This class is needed for EF Core console commands
 * (like Add-Migration and Update-Database commands) */
public class PropertyMiniDbContextFactory : IDesignTimeDbContextFactory<PropertyMiniDbContext>
{
    public PropertyMiniDbContext CreateDbContext(string[] args)
    {
        PropertyMiniEfCoreEntityExtensionMappings.Configure();

        var configuration = BuildConfiguration();

        var builder = new DbContextOptionsBuilder<PropertyMiniDbContext>()
            .UseSqlServer(configuration.GetConnectionString("Default"));

        return new PropertyMiniDbContext(builder.Options);
    }

    private static IConfigurationRoot BuildConfiguration()
    {
        var builder = new ConfigurationBuilder()
            .SetBasePath(Path.Combine(Directory.GetCurrentDirectory(), "../SawaTech.PropertyMini.DbMigrator/"))
            .AddJsonFile("appsettings.json", optional: false);

        return builder.Build();
    }
}
