using System.Reflection.Emit;
using Microsoft.EntityFrameworkCore;
using SawaTech.PropertyMini.Addresses;
using SawaTech.PropertyMini.Amenities;
using SawaTech.PropertyMini.Governorates;
using SawaTech.PropertyMini.NearbyPlaces;
using SawaTech.PropertyMini.PropertyEntities;
using SawaTech.PropertyMini.Users;
using Volo.Abp.AuditLogging.EntityFrameworkCore;
using Volo.Abp.BackgroundJobs.EntityFrameworkCore;
using Volo.Abp.Data;
using Volo.Abp.DependencyInjection;
using Volo.Abp.EntityFrameworkCore;
using Volo.Abp.EntityFrameworkCore.Modeling;
using Volo.Abp.FeatureManagement.EntityFrameworkCore;
using Volo.Abp.Identity;
using Volo.Abp.Identity.EntityFrameworkCore;
using Volo.Abp.OpenIddict.EntityFrameworkCore;
using Volo.Abp.PermissionManagement.EntityFrameworkCore;
using Volo.Abp.SettingManagement.EntityFrameworkCore;
//using Volo.Abp.TenantManagement;
//using Volo.Abp.TenantManagement.EntityFrameworkCore;
using Volo.Abp.Users.EntityFrameworkCore;

namespace SawaTech.PropertyMini.EntityFrameworkCore;

[ReplaceDbContext(typeof(IIdentityDbContext))]
//[ReplaceDbContext(typeof(ITenantManagementDbContext))]
[ConnectionStringName("Default")]
public class PropertyMiniDbContext : AbpDbContext<PropertyMiniDbContext>, IIdentityDbContext
//ITenantManagementDbContext
{
    /* Add DbSet properties for your Aggregate Roots / Entities here. */

    #region Entities from the modules

    /* Notice: We only implemented IIdentityDbContext and ITenantManagementDbContext
     * and replaced them for this DbContext. This allows you to perform JOIN
     * queries for the entities of these modules over the repositories easily. You
     * typically don't need that for other modules. But, if you need, you can
     * implement the DbContext interface of the needed module and use ReplaceDbContext
     * attribute just like IIdentityDbContext and ITenantManagementDbContext.
     *
     * More info: Replacing a DbContext of a module ensures that the related module
     * uses this DbContext on runtime. Otherwise, it will use its own DbContext class.
     */

    //Identity
    public DbSet<IdentityUser> Users { get; set; }
    public DbSet<IdentityRole> Roles { get; set; }
    public DbSet<IdentityClaimType> ClaimTypes { get; set; }
    public DbSet<OrganizationUnit> OrganizationUnits { get; set; }
    public DbSet<IdentitySecurityLog> SecurityLogs { get; set; }
    public DbSet<IdentityLinkUser> LinkUsers { get; set; }
    public DbSet<IdentityUserDelegation> UserDelegations { get; set; }
    public DbSet<IdentitySession> Sessions { get; set; }

    // Tenant Management
    //public DbSet<Tenant> Tenants { get; set; }
    //public DbSet<TenantConnectionString> TenantConnectionStrings { get; set; }

    // property
    public DbSet<Property> Properties { get; set; }
    public DbSet<AccountUser> AccountUsers { get; set; }
    public DbSet<Amenity> PropertyAmenities { get; set; }
    public DbSet<PropertyFeature> PropertyFeatures { get; set; }
    public DbSet<PropertyType> PropertyTypes { get; set; }
    public DbSet<PropertyImage> PropertyMedias { get; set; }
    public DbSet<Governorate> Governorates { get; set; }
    public DbSet<PropertyVideo> PropertyVideos { get; set; }
    public DbSet<NearbyPlace> NearbyPlaces { get; set; }

    public DbSet<RefreshTokenInfo> RefreshTokens { get; set; }
    public DbSet<PropertyNearbyPlace> PropertyNearbyPlaces { get; set; }

    #endregion

    public PropertyMiniDbContext(DbContextOptions<PropertyMiniDbContext> options)
        : base(options) { }

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        base.OnModelCreating(modelBuilder);

        /* Include modules to your migration db context */

        modelBuilder.ConfigurePermissionManagement();
        modelBuilder.ConfigureSettingManagement();
        modelBuilder.ConfigureBackgroundJobs();
        modelBuilder.ConfigureAuditLogging();
        modelBuilder.ConfigureIdentity();
        modelBuilder.ConfigureOpenIddict();
        modelBuilder.ConfigureFeatureManagement();
        //modelBuilder.ConfigureTenantManagement();

        /* Configure your own tables/entities inside here */

        modelBuilder.Entity<Property>(p =>
        {
            p.ToTable(PropertyMiniConsts.DbTablePrefix + "Properties", PropertyMiniConsts.DbSchema);
            p.ConfigureByConvention();
            p.Property(x => x.Price).HasPrecision(18, 2); // Fix for CS1061 and CS0201
            p.Property(x => x.InsurancePayment).HasPrecision(18, 2); // Fix for CS1061 and CS0201
            p.HasOne(x => x.Owner)
                .WithMany(x => x.Properties)
                .HasForeignKey(x => x.OwnerId)
                .OnDelete(DeleteBehavior.Restrict); // Fix for CS1061 and CS0201
            p.HasMany(x => x.PropertyImages)
                .WithOne(x => x.Property)
                .HasForeignKey(x => x.PropertyId)
                .OnDelete(DeleteBehavior.Restrict); // Fix for CS1061 and CS0201
            // Configure Many-to-Many with NearbyPlace via join table
            p.HasMany(x => x.PropertyNearbyPlaces)
                .WithOne(x => x.Property)
                .HasForeignKey(x => x.PropertyId)
                .OnDelete(DeleteBehavior.Restrict);
            p.HasOne(x => x.Governorate).WithMany(x => x.Property);

            p.HasOne(x => x.PropertyVideo)
                .WithOne(x => x.Property)
                .HasForeignKey<PropertyVideo>(x => x.PropertyId)
                .OnDelete(DeleteBehavior.Restrict); // Fix for CS1061 and CS0201
        });

        modelBuilder.Entity<AccountUser>(a =>
        {
            a.ToTable(
                PropertyMiniConsts.DbTablePrefix + "AccountUsers",
                PropertyMiniConsts.DbSchema
            );

            a.HasMany(x => x.Properties)
                .WithOne(x => x.Owner)
                .HasForeignKey(x => x.OwnerId)
                .OnDelete(DeleteBehavior.Restrict);
        });

        modelBuilder.Entity<Amenity>(a =>
        {
            a.ToTable(
                PropertyMiniConsts.DbTablePrefix + "PropertyAmenities",
                PropertyMiniConsts.DbSchema
            );
        });

        modelBuilder.Entity<Governorate>(a =>
        {
            a.ToTable(
                PropertyMiniConsts.DbTablePrefix + "Governorates",
                PropertyMiniConsts.DbSchema
            );
        });

        modelBuilder.Entity<NearbyPlace>(np =>
        {
            np.ToTable(
                PropertyMiniConsts.DbTablePrefix + "NearbyPlaces",
                PropertyMiniConsts.DbSchema
            );
            np.ConfigureByConvention();

            np.HasMany(x => x.PropertyNearbyPlaces)
                .WithOne(x => x.NearbyPlace)
                .HasForeignKey(x => x.NearbyPlaceId)
                .OnDelete(DeleteBehavior.Restrict);
        });
        modelBuilder.Entity<PropertyFeature>(a =>
        {
            a.ToTable(
                PropertyMiniConsts.DbTablePrefix + "PropertyFeatures",
                PropertyMiniConsts.DbSchema
            );
        });

        modelBuilder.Entity<PropertyImage>(a =>
        {
            a.ToTable(
                PropertyMiniConsts.DbTablePrefix + "PropertyVideos",
                PropertyMiniConsts.DbSchema
            );
            a.Property(x => x.Url).HasMaxLength(2000);
            //a.Property(x => x.MediaType).HasConversion<string>();
            a.HasOne(x => x.Property)
                .WithMany(x => x.PropertyImages)
                .HasForeignKey(x => x.PropertyId)
                .OnDelete(DeleteBehavior.Restrict);
        });

        modelBuilder.Entity<PropertyImage>(a =>
        {
            a.ToTable(
                PropertyMiniConsts.DbTablePrefix + "PropertyImages",
                PropertyMiniConsts.DbSchema
            );
            a.Property(x => x.Url).HasMaxLength(2000);
            a.Property(x => x.MediaType).HasConversion<string>();
            a.HasOne(x => x.Property)
                .WithMany(x => x.PropertyImages)
                .HasForeignKey(x => x.PropertyId)
                .OnDelete(DeleteBehavior.Restrict);
        });

        modelBuilder.Entity<PropertyType>(a =>
        {
            a.ToTable(
                PropertyMiniConsts.DbTablePrefix + "PropertyTypes",
                PropertyMiniConsts.DbSchema
            );
            // a.Property(x => x.Name).HasMaxLength(200);
            // a.HasMany(x => x.Properties)
            //     .WithOne(x => x.PropertyType)
            //     .HasForeignKey(x => x.Type)
            //     .OnDelete(DeleteBehavior.Restrict);
        });

        // Configure the join table explicitly (optional but recommended)
        modelBuilder.Entity<PropertyNearbyPlace>(j =>
        {
            j.ToTable(
                PropertyMiniConsts.DbTablePrefix + "PropertyNearbyPlaces",
                PropertyMiniConsts.DbSchema
            );
            j.HasKey(x => new { x.PropertyId, x.NearbyPlaceId });
        });

        modelBuilder.Entity<PropertyAmenity>(pa =>
        {
            pa.HasKey(x => new { x.PropertyId, x.AmenityId }); // Composite key

            pa.HasOne(x => x.Property)
                .WithMany(x => x.PropertyAmenities)
                .HasForeignKey(x => x.PropertyId);

            pa.HasOne(x => x.Amenity).WithMany().HasForeignKey(x => x.AmenityId);
        });

      
    }
}
