
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.DependencyInjection.Extensions;
using Volo.Abp.AspNetCore.Authentication.JwtBearer;
using Volo.Abp.BackgroundJobs;
using Volo.Abp.Emailing;
//using Volo.Abp.FeatureManagement;
using Volo.Abp.Identity;
using Volo.Abp.Localization;
using Volo.Abp.Modularity;

namespace SawaTech.PropertyMini;

[DependsOn(
    typeof(PropertyMiniDomainSharedModule),
    //typeof(AbpAuditLoggingDomainModule),
    typeof(AbpBackgroundJobsDomainModule),
    //typeof(AbpFeatureManagementDomainModule),
    typeof(AbpIdentityDomainModule)
    //typeof(AbpOpenIddictDomainModule),
    //typeof(AbpPermissionManagementDomainOpenIddictModule),
    //typeof(AbpPermissionManagementDomainIdentityModule),
    //typeof(AbpSettingManagementDomainModule),
    //typeof(AbpTenantManagementDomainModule),
    // typeof(AbpAspNetCoreAuthenticationJwtBearerModule),
    // typeof(AbpEmailingModule)
)]
public class PropertyMiniDomainModule : AbpModule
{
    public override void ConfigureServices(ServiceConfigurationContext context)
    {
        Configure<AbpLocalizationOptions>(options =>
        {
            options.Languages.Add(new LanguageInfo("ar", "ar", "العربية"));
            options.Languages.Add(new LanguageInfo("cs", "cs", "Čeština"));
            options.Languages.Add(new LanguageInfo("en", "en", "English"));
            options.Languages.Add(new LanguageInfo("en-GB", "en-GB", "English (UK)"));
            options.Languages.Add(new LanguageInfo("hu", "hu", "Magyar"));
            options.Languages.Add(new LanguageInfo("hr", "hr", "Croatian"));
            options.Languages.Add(new LanguageInfo("fi", "fi", "Finnish"));
            options.Languages.Add(new LanguageInfo("fr", "fr", "Français"));
            options.Languages.Add(new LanguageInfo("hi", "hi", "Hindi"));
            options.Languages.Add(new LanguageInfo("it", "it", "Italiano"));
            options.Languages.Add(new LanguageInfo("pt-BR", "pt-BR", "Português"));
            options.Languages.Add(new LanguageInfo("ru", "ru", "Русский"));
            options.Languages.Add(new LanguageInfo("sk", "sk", "Slovak"));
            options.Languages.Add(new LanguageInfo("tr", "tr", "Türkçe"));
            options.Languages.Add(new LanguageInfo("zh-Hans", "zh-Hans", "简体中文"));
            options.Languages.Add(new LanguageInfo("zh-Hant", "zh-Hant", "繁體中文"));
            options.Languages.Add(new LanguageInfo("de-DE", "de-DE", "Deutsch"));
            options.Languages.Add(new LanguageInfo("es", "es", "Español"));
        });

        //Configure<AbpMultiTenancyOptions>(options =>
        //{
        //    options.IsEnabled = false; //MultiTenancyConsts.IsEnabled;
        //});



        // Configure<IdentityOptions>(op =>
        // {
        //     op.User.Configure = (user) =>
        //     {
        //         user.EntityType = typeof(AccountUser);
        //     };
        // });

        // Configure<AbpIdentityOptions>(options =>
        // {
        //     options.ConfigureIdentity = identity =>
        //     {
        //         identity.UserType = typeof(AccountUser); // Your custom user class
        //         identity.RoleType = typeof(IdentityRole); // Default role class
        //     };
        // });

        //var configuration = context.Services.GetConfiguration();

        //context.Services.AddAuthentication(JwtBearerDefaults.AuthenticationScheme)
        //    .AddJwtBearer(options =>
        //    {
        //        options.Authority = configuration["AuthServer:Authority"];
        //        options.RequireHttpsMetadata = false;
        //        options.Audience = configuration["AuthServer:Audience"];
        //    });

        //Configure<AbpBlobStoringOptions>(options =>
        //{
        //    options.Containers.Configure<PropertyGallaryContainer>(container =>
        //    {
        //        container.UseFileSystem(fileSystem =>
        //        {
        //            fileSystem.BasePath = Path.Combine(Directory.GetCurrentDirectory(), "property-images");
        //        });
        //    });
        //});

#if DEBUG
        context.Services.Replace(ServiceDescriptor.Singleton<IEmailSender, NullEmailSender>());
#endif
    }
}
