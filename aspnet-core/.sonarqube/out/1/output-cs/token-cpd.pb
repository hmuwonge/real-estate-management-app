ÿ

D:\PROJECTS\.NET\ABP Framework\SawaTech assign\aspnet-core\src\SawaTech.PropertyMini.Domain.Shared\PropertyMiniModuleExtensionConfigurator.cs
	namespace 	
SawaTech
 
. 
PropertyMini 
;  
public 
static 
class 3
'PropertyMiniModuleExtensionConfigurator ;
{		 
private

 
static

 
readonly

 
OneTimeRunner

 )
OneTimeRunner

* 7
=

8 9
new

: =
OneTimeRunner

> K
(

K L
)

L M
;

M N
public 

static 
void 
	Configure  
(  !
)! "
{ 
OneTimeRunner 
. 
Run 
( 
( 
) 
=> 
{ 	'
ConfigureExistingProperties '
(' (
)( )
;) *$
ConfigureExtraProperties $
($ %
)% &
;& '
} 	
)	 

;
 
} 
private 
static 
void '
ConfigureExistingProperties 3
(3 4
)4 5
{ 
}$$ 
private&& 
static&& 
void&& $
ConfigureExtraProperties&& 0
(&&0 1
)&&1 2
{'' 
}HH 
}II •
‹D:\PROJECTS\.NET\ABP Framework\SawaTech assign\aspnet-core\src\SawaTech.PropertyMini.Domain.Shared\PropertyMiniGlobalFeatureConfigurator.cs
	namespace 	
SawaTech
 
. 
PropertyMini 
;  
public 
static 
class 1
%PropertyMiniGlobalFeatureConfigurator 9
{ 
private 
static 
readonly 
OneTimeRunner )
OneTimeRunner* 7
=8 9
new: =
OneTimeRunner> K
(K L
)L M
;M N
public		 

static		 
void		 
	Configure		  
(		  !
)		! "
{

 
OneTimeRunner 
. 
Run 
( 
( 
) 
=> 
{ 	
} 	
)	 

;
 
} 
} Ô
„D:\PROJECTS\.NET\ABP Framework\SawaTech assign\aspnet-core\src\SawaTech.PropertyMini.Domain.Shared\PropertyMiniDomainSharedModule.cs
	namespace 	
SawaTech
 
. 
PropertyMini 
;  
[ 
	DependsOn 

(
 
typeof 

(
 -
!AbpAuditLoggingDomainSharedModule ,
), -
,- .
typeof 

(
 /
#AbpBackgroundJobsDomainSharedModule .
). /
,/ 0
typeof 

(
 )
AbpIdentityDomainSharedModule (
)( )
,) *
typeof 

(
 +
AbpOpenIddictDomainSharedModule *
)* +
,+ ,
typeof 

(
 5
)AbpPermissionManagementDomainSharedModule 4
)4 5
) 
] 
public 
class *
PropertyMiniDomainSharedModule +
:, -
	AbpModule. 7
{ 
public 

override 
void  
PreConfigureServices -
(- .'
ServiceConfigurationContext. I
contextJ Q
)Q R
{ 3
'PropertyMiniModuleExtensionConfigurator!! /
.!!/ 0
	Configure!!0 9
(!!9 :
)!!: ;
;!!; <
}"" 
public$$ 

override$$ 
void$$ 
ConfigureServices$$ *
($$* +'
ServiceConfigurationContext$$+ F
context$$G N
)$$N O
{%% 
	Configure&& 
<&& '
AbpVirtualFileSystemOptions&& -
>&&- .
(&&. /
options&&/ 6
=>&&7 9
{'' 	
options(( 
.(( 
FileSets(( 
.(( 
AddEmbedded(( (
<((( )*
PropertyMiniDomainSharedModule(() G
>((G H
(((H I
)((I J
;((J K
})) 	
)))	 

;))
 
	Configure++ 
<++ "
AbpLocalizationOptions++ (
>++( )
(++) *
options++* 1
=>++2 4
{,, 	
options-- 
.-- 
	Resources-- 
... 
Add.. 
<..  
PropertyMiniResource.. )
>..) *
(..* +
$str..+ /
)../ 0
.// 
AddBaseTypes// 
(// 
typeof// $
(//$ %!
AbpValidationResource//% :
)//: ;
)//; <
.00 
AddVirtualJson00 
(00  
$str00  <
)00< =
;00= >
options22 
.22 
DefaultResourceType22 '
=22( )
typeof22* 0
(220 1 
PropertyMiniResource221 E
)22E F
;22F G
}33 	
)33	 

;33
 
	Configure55 
<55 +
AbpExceptionLocalizationOptions55 1
>551 2
(552 3
options553 :
=>55; =
{66 	
options77 
.77 
MapCodeNamespace77 $
(77$ %
$str77% 3
,773 4
typeof775 ;
(77; < 
PropertyMiniResource77< P
)77P Q
)77Q R
;77R S
}88 	
)88	 

;88
 
}99 
}:: å
‚D:\PROJECTS\.NET\ABP Framework\SawaTech assign\aspnet-core\src\SawaTech.PropertyMini.Domain.Shared\PropertyMiniDomainErrorCodes.cs
	namespace 	
SawaTech
 
. 
PropertyMini 
;  
public 
static 
class (
PropertyMiniDomainErrorCodes 0
{ 
} »
D:\PROJECTS\.NET\ABP Framework\SawaTech assign\aspnet-core\src\SawaTech.PropertyMini.Domain.Shared\Properties\PropertyStatus.cs
	namespace 	
SawaTech
 
. 
PropertyMini 
.  

Properties  *
;* +
public 
enum 
PropertyStatus 
{ 
Sale 
, 	
Rent 
, 	
Invest 

} Ò
„D:\PROJECTS\.NET\ABP Framework\SawaTech assign\aspnet-core\src\SawaTech.PropertyMini.Domain.Shared\Properties\PropertyPaymentType.cs
	namespace 	
SawaTech
 
. 
PropertyMini 
.  

Properties  *
;* +
public 
enum 
PropertyPaymentType 
{ 
FullPayment 
, 
PerMonth 
, 
PerYear  
} ˜
~D:\PROJECTS\.NET\ABP Framework\SawaTech assign\aspnet-core\src\SawaTech.PropertyMini.Domain.Shared\Properties\MediaTypeEnum.cs
	namespace 	
SawaTech
 
. 
PropertyMini 
.  

Properties  *
;* +
public 
enum 
MediaTypeEnum 
{ 
Video 	
,	 

Image 	
} ˆ
…D:\PROJECTS\.NET\ABP Framework\SawaTech assign\aspnet-core\src\SawaTech.PropertyMini.Domain.Shared\MultiTenancy\MultiTenancyConsts.cs
	namespace 	
SawaTech
 
. 
PropertyMini 
.  
MultiTenancy  ,
;, -
public 
static 
class 
MultiTenancyConsts &
{ 
public		 

const		 
bool		 
	IsEnabled		 
=		  !
false		" '
;		' (
}

 é
‡D:\PROJECTS\.NET\ABP Framework\SawaTech assign\aspnet-core\src\SawaTech.PropertyMini.Domain.Shared\Localization\PropertyMiniResource.cs
	namespace 	
SawaTech
 
. 
PropertyMini 
.  
Localization  ,
;, -
[ $
LocalizationResourceName 
( 
$str (
)( )
]) *
public 
class  
PropertyMiniResource !
{ 
}		 