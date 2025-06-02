@echo off
@echo This cmd file creates a Data API Builder configuration based on the chosen database objects.
@echo To run the cmd, create an .env file with the following contents:
@echo dab-connection-string=your connection string
@echo ** Make sure to exclude the .env file from source control **
@echo **
dotnet tool install -g Microsoft.DataApiBuilder
dab init -c dab-config.json --database-type mssql --connection-string "@env('dab-connection-string')" --host-mode Development
@echo Adding tables
dab add "AbpAuditLogAction" --source "[dbo].[AbpAuditLogActions]" --fields.include "Id,TenantId,AuditLogId,ServiceName,MethodName,Parameters,ExecutionTime,ExecutionDuration,ExtraProperties" --permissions "anonymous:*" 
dab add "AbpAuditLog" --source "[dbo].[AbpAuditLogs]" --fields.include "Id,ApplicationName,UserId,UserName,TenantId,TenantName,ImpersonatorUserId,ImpersonatorUserName,ImpersonatorTenantId,ImpersonatorTenantName,ExecutionTime,ExecutionDuration,ClientIpAddress,ClientName,ClientId,CorrelationId,BrowserInfo,HttpMethod,Url,Exceptions,Comments,HttpStatusCode,ExtraProperties,ConcurrencyStamp" --permissions "anonymous:*" 
dab add "AbpBackgroundJob" --source "[dbo].[AbpBackgroundJobs]" --fields.include "Id,JobName,JobArgs,TryCount,CreationTime,NextTryTime,LastTryTime,IsAbandoned,Priority,ExtraProperties,ConcurrencyStamp" --permissions "anonymous:*" 
dab add "AbpClaimType" --source "[dbo].[AbpClaimTypes]" --fields.include "Id,Name,Required,IsStatic,Regex,RegexDescription,Description,ValueType,CreationTime,ExtraProperties,ConcurrencyStamp" --permissions "anonymous:*" 
dab add "AbpEntityChange" --source "[dbo].[AbpEntityChanges]" --fields.include "Id,AuditLogId,TenantId,ChangeTime,ChangeType,EntityTenantId,EntityId,EntityTypeFullName,ExtraProperties" --permissions "anonymous:*" 
dab add "AbpEntityPropertyChange" --source "[dbo].[AbpEntityPropertyChanges]" --fields.include "Id,TenantId,EntityChangeId,NewValue,OriginalValue,PropertyName,PropertyTypeFullName" --permissions "anonymous:*" 
dab add "AbpFeatureGroup" --source "[dbo].[AbpFeatureGroups]" --fields.include "Id,Name,DisplayName,ExtraProperties" --permissions "anonymous:*" 
dab add "AbpFeature" --source "[dbo].[AbpFeatures]" --fields.include "Id,GroupName,Name,ParentName,DisplayName,Description,DefaultValue,IsVisibleToClients,IsAvailableToHost,AllowedProviders,ValueType,ExtraProperties" --permissions "anonymous:*" 
dab add "AbpFeatureValue" --source "[dbo].[AbpFeatureValues]" --fields.include "Id,Name,Value,ProviderName,ProviderKey" --permissions "anonymous:*" 
dab add "AbpLinkUser" --source "[dbo].[AbpLinkUsers]" --fields.include "Id,SourceUserId,SourceTenantId,TargetUserId,TargetTenantId" --permissions "anonymous:*" 
dab add "AbpOrganizationUnitRole" --source "[dbo].[AbpOrganizationUnitRoles]" --fields.include "RoleId,OrganizationUnitId,TenantId,CreationTime,CreatorId" --permissions "anonymous:*" 
dab add "AbpOrganizationUnit" --source "[dbo].[AbpOrganizationUnits]" --fields.include "Id,TenantId,ParentId,Code,DisplayName,EntityVersion,ExtraProperties,ConcurrencyStamp,CreationTime,CreatorId,LastModificationTime,LastModifierId,IsDeleted,DeleterId,DeletionTime" --permissions "anonymous:*" 
dab add "AbpPermissionGrant" --source "[dbo].[AbpPermissionGrants]" --fields.include "Id,TenantId,Name,ProviderName,ProviderKey" --permissions "anonymous:*" 
dab add "AbpPermissionGroup" --source "[dbo].[AbpPermissionGroups]" --fields.include "Id,Name,DisplayName,ExtraProperties" --permissions "anonymous:*" 
dab add "AbpPermission" --source "[dbo].[AbpPermissions]" --fields.include "Id,GroupName,Name,ParentName,DisplayName,IsEnabled,MultiTenancySide,Providers,StateCheckers,ExtraProperties" --permissions "anonymous:*" 
dab add "AbpRoleClaim" --source "[dbo].[AbpRoleClaims]" --fields.include "Id,RoleId,TenantId,ClaimType,ClaimValue" --permissions "anonymous:*" 
dab add "AbpRole" --source "[dbo].[AbpRoles]" --fields.include "Id,TenantId,Name,NormalizedName,IsDefault,IsStatic,IsPublic,EntityVersion,CreationTime,ExtraProperties,ConcurrencyStamp" --permissions "anonymous:*" 
dab add "AbpSecurityLog" --source "[dbo].[AbpSecurityLogs]" --fields.include "Id,TenantId,ApplicationName,Identity,Action,UserId,UserName,TenantName,ClientId,CorrelationId,ClientIpAddress,BrowserInfo,CreationTime,ExtraProperties,ConcurrencyStamp" --permissions "anonymous:*" 
dab add "AbpSession" --source "[dbo].[AbpSessions]" --fields.include "Id,SessionId,Device,DeviceInfo,TenantId,UserId,ClientId,IpAddresses,SignedIn,LastAccessed,ExtraProperties" --permissions "anonymous:*" 
dab add "AbpSettingDefinition" --source "[dbo].[AbpSettingDefinitions]" --fields.include "Id,Name,DisplayName,Description,DefaultValue,IsVisibleToClients,Providers,IsInherited,IsEncrypted,ExtraProperties" --permissions "anonymous:*" 
dab add "AbpSetting" --source "[dbo].[AbpSettings]" --fields.include "Id,Name,Value,ProviderName,ProviderKey" --permissions "anonymous:*" 
dab add "AbpUserClaim" --source "[dbo].[AbpUserClaims]" --fields.include "Id,UserId,TenantId,ClaimType,ClaimValue" --permissions "anonymous:*" 
dab add "AbpUserDelegation" --source "[dbo].[AbpUserDelegations]" --fields.include "Id,TenantId,SourceUserId,TargetUserId,StartTime,EndTime" --permissions "anonymous:*" 
dab add "AbpUserLogin" --source "[dbo].[AbpUserLogins]" --fields.include "UserId,LoginProvider,TenantId,ProviderKey,ProviderDisplayName" --permissions "anonymous:*" 
dab add "AbpUserOrganizationUnit" --source "[dbo].[AbpUserOrganizationUnits]" --fields.include "UserId,OrganizationUnitId,TenantId,CreationTime,CreatorId" --permissions "anonymous:*" 
dab add "AbpUserRole" --source "[dbo].[AbpUserRoles]" --fields.include "UserId,RoleId,TenantId" --permissions "anonymous:*" 
dab add "AbpUser" --source "[dbo].[AbpUsers]" --fields.include "Id,TenantId,UserName,NormalizedUserName,Name,Surname,Email,NormalizedEmail,EmailConfirmed,PasswordHash,SecurityStamp,IsExternal,PhoneNumber,PhoneNumberConfirmed,IsActive,TwoFactorEnabled,LockoutEnd,LockoutEnabled,AccessFailedCount,ShouldChangePasswordOnNextLogin,EntityVersion,LastPasswordChangeTime,ExtraProperties,ConcurrencyStamp,CreationTime,CreatorId,LastModificationTime,LastModifierId,IsDeleted,DeleterId,DeletionTime" --permissions "anonymous:*" 
dab add "AbpUserToken" --source "[dbo].[AbpUserTokens]" --fields.include "UserId,LoginProvider,Name,TenantId,Value" --permissions "anonymous:*" 
dab add "AppAccountUser" --source "[dbo].[AppAccountUsers]" --fields.include "Id,Type,Email,UserName,Password,CompanyName,CompanyEmail,Department,JobPosition,Phone,WhatsApp,Country,ProfilePictureUrl,ExtraProperties,ConcurrencyStamp,CreationTime,CreatorId,LastModificationTime,LastModifierId" --permissions "anonymous:*" 
dab add "AppGovernorate" --source "[dbo].[AppGovernorates]" --fields.include "Id,Name,ExtraProperties,ConcurrencyStamp,CreationTime,CreatorId,LastModificationTime,LastModifierId" --permissions "anonymous:*" 
dab add "AppNearbyPlace" --source "[dbo].[AppNearbyPlaces]" --fields.include "Id,Name,ExtraProperties,ConcurrencyStamp,CreationTime,CreatorId,LastModificationTime,LastModifierId,Icon" --permissions "anonymous:*" 
dab add "AppProperty" --source "[dbo].[AppProperties]" --fields.include "Id,Title,OwnerId,GovernorateId,Description,PropertyTypeId,PaymentType,Status,Address,Price,InsurancePayment,Area,Rooms,Latitude,Longitude,FeatureId,ExtraProperties,ConcurrencyStamp,CreationTime,CreatorId,LastModificationTime,LastModifierId,MainImage" --permissions "anonymous:*" 
dab add "AppPropertyAmenity" --source "[dbo].[AppPropertyAmenities]" --fields.include "Id,Name,ExtraProperties,ConcurrencyStamp,CreationTime,CreatorId,LastModificationTime,LastModifierId,Icon" --permissions "anonymous:*" 
dab add "AppPropertyFeature" --source "[dbo].[AppPropertyFeatures]" --fields.include "PropertyId,FeatureId" --permissions "anonymous:*" 
dab add "AppPropertyImage" --source "[dbo].[AppPropertyImages]" --fields.include "Id,Url,MediaType,PropertyId,ExtraProperties,ConcurrencyStamp,CreationTime,CreatorId,LastModificationTime,LastModifierId" --permissions "anonymous:*" 
dab add "AppPropertyNearbyPlace" --source "[dbo].[AppPropertyNearbyPlaces]" --fields.include "PropertyId,NearbyPlaceId,Icon" --permissions "anonymous:*" 
dab add "AppPropertyType" --source "[dbo].[AppPropertyTypes]" --fields.include "Id,Name,ExtraProperties,ConcurrencyStamp,CreationTime,CreatorId,LastModificationTime,LastModifierId" --permissions "anonymous:*" 
dab add "Feature" --source "[dbo].[Features]" --fields.include "Id,Name,IconUrl,ExtraProperties,ConcurrencyStamp,CreationTime,CreatorId,LastModificationTime,LastModifierId" --permissions "anonymous:*" 
dab add "OpenIddictApplication" --source "[dbo].[OpenIddictApplications]" --fields.include "Id,ApplicationType,ClientId,ClientSecret,ClientType,ConsentType,DisplayName,DisplayNames,JsonWebKeySet,Permissions,PostLogoutRedirectUris,Properties,RedirectUris,Requirements,Settings,ClientUri,LogoUri,ExtraProperties,ConcurrencyStamp,CreationTime,CreatorId,LastModificationTime,LastModifierId,IsDeleted,DeleterId,DeletionTime" --permissions "anonymous:*" 
dab add "OpenIddictAuthorization" --source "[dbo].[OpenIddictAuthorizations]" --fields.include "Id,ApplicationId,CreationDate,Properties,Scopes,Status,Subject,Type,ExtraProperties,ConcurrencyStamp" --permissions "anonymous:*" 
dab add "OpenIddictScope" --source "[dbo].[OpenIddictScopes]" --fields.include "Id,Description,Descriptions,DisplayName,DisplayNames,Name,Properties,Resources,ExtraProperties,ConcurrencyStamp,CreationTime,CreatorId,LastModificationTime,LastModifierId,IsDeleted,DeleterId,DeletionTime" --permissions "anonymous:*" 
dab add "OpenIddictToken" --source "[dbo].[OpenIddictTokens]" --fields.include "Id,ApplicationId,AuthorizationId,CreationDate,ExpirationDate,Payload,Properties,RedemptionDate,ReferenceId,Status,Subject,Type,ExtraProperties,ConcurrencyStamp" --permissions "anonymous:*" 
dab add "PropertyAmenity" --source "[dbo].[PropertyAmenity]" --fields.include "PropertyId,AmenityId,Id,ExtraProperties,ConcurrencyStamp,CreationTime,CreatorId,LastModificationTime,LastModifierId,Quantity" --permissions "anonymous:*" 
dab add "PropertyVideo" --source "[dbo].[PropertyVideos]" --fields.include "Url,PropertyId,Id,ExtraProperties,ConcurrencyStamp,CreationTime,CreatorId,LastModificationTime,LastModifierId" --permissions "anonymous:*" 
dab add "RefreshToken" --source "[dbo].[RefreshTokens]" --fields.include "Id,Token,UserId,ExtraProperties,ConcurrencyStamp,CreationTime,CreatorId,LastModificationTime,LastModifierId" --permissions "anonymous:*" 
@echo Adding views and tables without primary key
@echo Adding relationships
dab update AbpAuditLogAction --relationship AbpAuditLog --target.entity AbpAuditLog --cardinality one
dab update AbpAuditLog --relationship AbpAuditLogAction --target.entity AbpAuditLogAction --cardinality many
dab update AbpEntityChange --relationship AbpAuditLog --target.entity AbpAuditLog --cardinality one
dab update AbpAuditLog --relationship AbpEntityChange --target.entity AbpEntityChange --cardinality many
dab update AbpEntityPropertyChange --relationship AbpEntityChange --target.entity AbpEntityChange --cardinality one
dab update AbpEntityChange --relationship AbpEntityPropertyChange --target.entity AbpEntityPropertyChange --cardinality many
dab update AbpOrganizationUnitRole --relationship AbpOrganizationUnit --target.entity AbpOrganizationUnit --cardinality one
dab update AbpOrganizationUnit --relationship AbpOrganizationUnitRole --target.entity AbpOrganizationUnitRole --cardinality many
dab update AbpOrganizationUnitRole --relationship AbpRole --target.entity AbpRole --cardinality one
dab update AbpRole --relationship AbpOrganizationUnitRole --target.entity AbpOrganizationUnitRole --cardinality many
dab update AbpOrganizationUnit --relationship AbpOrganizationUnit --target.entity AbpOrganizationUnit --cardinality one
dab update AbpOrganizationUnit --relationship AbpOrganizationUnit --target.entity AbpOrganizationUnit --cardinality many
dab update AbpRoleClaim --relationship AbpRole --target.entity AbpRole --cardinality one
dab update AbpRole --relationship AbpRoleClaim --target.entity AbpRoleClaim --cardinality many
dab update AbpUserClaim --relationship AbpUser --target.entity AbpUser --cardinality one
dab update AbpUser --relationship AbpUserClaim --target.entity AbpUserClaim --cardinality many
dab update AbpUserLogin --relationship AbpUser --target.entity AbpUser --cardinality one
dab update AbpUser --relationship AbpUserLogin --target.entity AbpUserLogin --cardinality many
dab update AbpUserOrganizationUnit --relationship AbpOrganizationUnit --target.entity AbpOrganizationUnit --cardinality one
dab update AbpOrganizationUnit --relationship AbpUserOrganizationUnit --target.entity AbpUserOrganizationUnit --cardinality many
dab update AbpUserOrganizationUnit --relationship AbpUser --target.entity AbpUser --cardinality one
dab update AbpUser --relationship AbpUserOrganizationUnit --target.entity AbpUserOrganizationUnit --cardinality many
dab update AbpUserRole --relationship AbpRole --target.entity AbpRole --cardinality one
dab update AbpRole --relationship AbpUserRole --target.entity AbpUserRole --cardinality many
dab update AbpUserRole --relationship AbpUser --target.entity AbpUser --cardinality one
dab update AbpUser --relationship AbpUserRole --target.entity AbpUserRole --cardinality many
dab update AbpUserToken --relationship AbpUser --target.entity AbpUser --cardinality one
dab update AbpUser --relationship AbpUserToken --target.entity AbpUserToken --cardinality many
dab update AppProperty --relationship AppAccountUser --target.entity AppAccountUser --cardinality one
dab update AppAccountUser --relationship AppProperty --target.entity AppProperty --cardinality many
dab update AppProperty --relationship AppGovernorate --target.entity AppGovernorate --cardinality one
dab update AppGovernorate --relationship AppProperty --target.entity AppProperty --cardinality many
dab update AppProperty --relationship AppPropertyType --target.entity AppPropertyType --cardinality one
dab update AppPropertyType --relationship AppProperty --target.entity AppProperty --cardinality many
dab update AppProperty --relationship Feature --target.entity Feature --cardinality one
dab update Feature --relationship AppProperty --target.entity AppProperty --cardinality many
dab update AppPropertyFeature --relationship AppProperty --target.entity AppProperty --cardinality one
dab update AppProperty --relationship AppPropertyFeature --target.entity AppPropertyFeature --cardinality many
dab update AppPropertyFeature --relationship Feature --target.entity Feature --cardinality one
dab update Feature --relationship AppPropertyFeature --target.entity AppPropertyFeature --cardinality many
dab update AppPropertyImage --relationship AppProperty --target.entity AppProperty --cardinality one
dab update AppProperty --relationship AppPropertyImage --target.entity AppPropertyImage --cardinality many
dab update AppPropertyNearbyPlace --relationship AppNearbyPlace --target.entity AppNearbyPlace --cardinality one
dab update AppNearbyPlace --relationship AppPropertyNearbyPlace --target.entity AppPropertyNearbyPlace --cardinality many
dab update AppPropertyNearbyPlace --relationship AppProperty --target.entity AppProperty --cardinality one
dab update AppProperty --relationship AppPropertyNearbyPlace --target.entity AppPropertyNearbyPlace --cardinality many
dab update OpenIddictAuthorization --relationship OpenIddictApplication --target.entity OpenIddictApplication --cardinality one
dab update OpenIddictApplication --relationship OpenIddictAuthorization --target.entity OpenIddictAuthorization --cardinality many
dab update OpenIddictToken --relationship OpenIddictApplication --target.entity OpenIddictApplication --cardinality one
dab update OpenIddictApplication --relationship OpenIddictToken --target.entity OpenIddictToken --cardinality many
dab update OpenIddictToken --relationship OpenIddictAuthorization --target.entity OpenIddictAuthorization --cardinality one
dab update OpenIddictAuthorization --relationship OpenIddictToken --target.entity OpenIddictToken --cardinality many
dab update PropertyAmenity --relationship AppProperty --target.entity AppProperty --cardinality one
dab update AppProperty --relationship PropertyAmenity --target.entity PropertyAmenity --cardinality many
dab update PropertyAmenity --relationship AppPropertyAmenity --target.entity AppPropertyAmenity --cardinality one
dab update AppPropertyAmenity --relationship PropertyAmenity --target.entity PropertyAmenity --cardinality many
dab update PropertyVideo --relationship AppProperty --target.entity AppProperty --cardinality one
dab update AppProperty --relationship PropertyVideo --target.entity PropertyVideo --cardinality many
@echo Adding stored procedures
dab add "SpFilterProperty" --source "[dbo].[sp_FilterProperties]" --source.type "stored-procedure" --permissions "anonymous:execute" --rest.methods "get" --graphql.operation "query" 
@echo **
@echo ** run 'dab validate' to validate your configuration **
@echo ** run 'dab start' to start the development API host **
