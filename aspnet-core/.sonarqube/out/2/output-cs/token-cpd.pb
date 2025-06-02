ã
uD:\PROJECTS\.NET\ABP Framework\SawaTech assign\aspnet-core\src\SawaTech.PropertyMini.Domain\Users\RefreshTokenInfo.cs
	namespace 	
SawaTech
 
. 
PropertyMini 
.  
Users  %
{ 
public 

class 
RefreshTokenInfo !
:" # 
AuditedAggregateRoot$ 8
<8 9
Guid9 =
>= >
{ 
public 
string 
? 
Token 
{ 
get "
;" #
set$ '
;' (
}) *
public		 
Guid		 
UserId		 
{		 
get		 !
;		! "
set		# &
;		& '
}		( )
}

 
} Ü
pD:\PROJECTS\.NET\ABP Framework\SawaTech assign\aspnet-core\src\SawaTech.PropertyMini.Domain\Users\AccountUser.cs
	namespace 	
SawaTech
 
. 
PropertyMini 
.  
Users  %
;% &
public

 
class

 
AccountUser

 
:

  
AuditedAggregateRoot

 .
<

. /
Guid

/ 3
>

3 4
{ 
public 

string 
Type 
{ 
get 
; 
set !
;! "
}# $
=$ %
string% +
.+ ,
Empty, 1
;1 2
public 

required 
string 
Email  
{! "
get# &
;& '
set( +
;+ ,
}- .
=. /
string/ 5
.5 6
Empty6 ;
;; <
public 

string 
UserName 
{ 
get  
;  !
set" %
;% &
}' (
=( )
string) /
./ 0
Empty0 5
;5 6
public 

string 
Password 
{ 
get  
;  !
set" %
;% &
}' (
=) *
string* 0
.0 1
Empty1 6
;6 7
public 

string 
? 
CompanyName 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 

string 
? 
CompanyEmail 
{  !
get" %
;% &
set' *
;* +
}, -
public 

string 
? 

Department 
{ 
get  #
;# $
set% (
;( )
}* +
public 

string 
? 
JobPosition 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 

string 
? 
Phone 
{ 
get 
; 
set  #
;# $
}% &
public 

string 
? 
WhatsApp 
{ 
get !
;! "
set# &
;& '
}( )
public 

string 
? 
Country 
{ 
get  
;  !
set" %
;% &
}' (
public 

string 
? 
ProfilePictureUrl $
{% &
get' *
;* +
set, /
;/ 0
}1 2
public 

ICollection 
< 
Property 
>  

Properties! +
{, -
get. 1
;1 2
set3 6
;6 7
}8 9
=: ;
[< =
]= >
;> ?
} 
public 
enum 
UserType 
{ 
Agent 	
,	 

Visitor
 
} ˚
|D:\PROJECTS\.NET\ABP Framework\SawaTech assign\aspnet-core\src\SawaTech.PropertyMini.Domain\Settings\PropertyMiniSettings.cs
	namespace 	
SawaTech
 
. 
PropertyMini 
.  
Settings  (
;( )
public 
static 
class  
PropertyMiniSettings (
{ 
private 
const 
string 
Prefix 
=  !
$str" 0
;0 1
}		 à
çD:\PROJECTS\.NET\ABP Framework\SawaTech assign\aspnet-core\src\SawaTech.PropertyMini.Domain\Settings\PropertyMiniSettingDefinitionProvider.cs
	namespace 	
SawaTech
 
. 
PropertyMini 
.  
Settings  (
;( )
public 
class 1
%PropertyMiniSettingDefinitionProvider 2
:3 4%
SettingDefinitionProvider5 N
{ 
public 

override 
void 
Define 
(  %
ISettingDefinitionContext  9
context: A
)A B
{ 
} 
} ∏7
wD:\PROJECTS\.NET\ABP Framework\SawaTech assign\aspnet-core\src\SawaTech.PropertyMini.Domain\PropertyMiniDomainModule.cs
	namespace 	
SawaTech
 
. 
PropertyMini 
;  
[ 
	DependsOn 

(
 
typeof 

(
 *
PropertyMiniDomainSharedModule )
)) *
,* +
typeof 

(
 )
AbpBackgroundJobsDomainModule (
)( )
,) *
typeof 

(
 ,
 AbpFeatureManagementDomainModule +
)+ ,
,, -
typeof 

(
 #
AbpIdentityDomainModule "
)" #
,# $
typeof 

(
 6
*AbpAspNetCoreAuthenticationJwtBearerModule 5
)5 6
,6 7
typeof 

(
 
AbpEmailingModule 
) 
) 
] 
public 
class $
PropertyMiniDomainModule %
:& '
	AbpModule( 1
{ 
public 

override 
void 
ConfigureServices *
(* +'
ServiceConfigurationContext+ F
contextG N
)N O
{ 
	Configure   
<   "
AbpLocalizationOptions   (
>  ( )
(  ) *
options  * 1
=>  2 4
{!! 	
options"" 
."" 
	Languages"" 
."" 
Add"" !
(""! "
new""" %
LanguageInfo""& 2
(""2 3
$str""3 7
,""7 8
$str""9 =
,""= >
$str""? H
)""H I
)""I J
;""J K
options## 
.## 
	Languages## 
.## 
Add## !
(##! "
new##" %
LanguageInfo##& 2
(##2 3
$str##3 7
,##7 8
$str##9 =
,##= >
$str##? H
)##H I
)##I J
;##J K
options$$ 
.$$ 
	Languages$$ 
.$$ 
Add$$ !
($$! "
new$$" %
LanguageInfo$$& 2
($$2 3
$str$$3 7
,$$7 8
$str$$9 =
,$$= >
$str$$? H
)$$H I
)$$I J
;$$J K
options%% 
.%% 
	Languages%% 
.%% 
Add%% !
(%%! "
new%%" %
LanguageInfo%%& 2
(%%2 3
$str%%3 :
,%%: ;
$str%%< C
,%%C D
$str%%E S
)%%S T
)%%T U
;%%U V
options&& 
.&& 
	Languages&& 
.&& 
Add&& !
(&&! "
new&&" %
LanguageInfo&&& 2
(&&2 3
$str&&3 7
,&&7 8
$str&&9 =
,&&= >
$str&&? G
)&&G H
)&&H I
;&&I J
options'' 
.'' 
	Languages'' 
.'' 
Add'' !
(''! "
new''" %
LanguageInfo''& 2
(''2 3
$str''3 7
,''7 8
$str''9 =
,''= >
$str''? I
)''I J
)''J K
;''K L
options(( 
.(( 
	Languages(( 
.(( 
Add(( !
(((! "
new((" %
LanguageInfo((& 2
(((2 3
$str((3 7
,((7 8
$str((9 =
,((= >
$str((? H
)((H I
)((I J
;((J K
options)) 
.)) 
	Languages)) 
.)) 
Add)) !
())! "
new))" %
LanguageInfo))& 2
())2 3
$str))3 7
,))7 8
$str))9 =
,))= >
$str))? I
)))I J
)))J K
;))K L
options** 
.** 
	Languages** 
.** 
Add** !
(**! "
new**" %
LanguageInfo**& 2
(**2 3
$str**3 7
,**7 8
$str**9 =
,**= >
$str**? F
)**F G
)**G H
;**H I
options++ 
.++ 
	Languages++ 
.++ 
Add++ !
(++! "
new++" %
LanguageInfo++& 2
(++2 3
$str++3 7
,++7 8
$str++9 =
,++= >
$str++? I
)++I J
)++J K
;++K L
options,, 
.,, 
	Languages,, 
.,, 
Add,, !
(,,! "
new,," %
LanguageInfo,,& 2
(,,2 3
$str,,3 :
,,,: ;
$str,,< C
,,,C D
$str,,E P
),,P Q
),,Q R
;,,R S
options-- 
.-- 
	Languages-- 
.-- 
Add-- !
(--! "
new--" %
LanguageInfo--& 2
(--2 3
$str--3 7
,--7 8
$str--9 =
,--= >
$str--? H
)--H I
)--I J
;--J K
options.. 
... 
	Languages.. 
... 
Add.. !
(..! "
new.." %
LanguageInfo..& 2
(..2 3
$str..3 7
,..7 8
$str..9 =
,..= >
$str..? G
)..G H
)..H I
;..I J
options// 
.// 
	Languages// 
.// 
Add// !
(//! "
new//" %
LanguageInfo//& 2
(//2 3
$str//3 7
,//7 8
$str//9 =
,//= >
$str//? G
)//G H
)//H I
;//I J
options00 
.00 
	Languages00 
.00 
Add00 !
(00! "
new00" %
LanguageInfo00& 2
(002 3
$str003 <
,00< =
$str00> G
,00G H
$str00I O
)00O P
)00P Q
;00Q R
options11 
.11 
	Languages11 
.11 
Add11 !
(11! "
new11" %
LanguageInfo11& 2
(112 3
$str113 <
,11< =
$str11> G
,11G H
$str11I O
)11O P
)11P Q
;11Q R
options22 
.22 
	Languages22 
.22 
Add22 !
(22! "
new22" %
LanguageInfo22& 2
(222 3
$str223 :
,22: ;
$str22< C
,22C D
$str22E N
)22N O
)22O P
;22P Q
options33 
.33 
	Languages33 
.33 
Add33 !
(33! "
new33" %
LanguageInfo33& 2
(332 3
$str333 7
,337 8
$str339 =
,33= >
$str33? H
)33H I
)33I J
;33J K
}44 	
)44	 

;44
 
contextdd 
.dd 
Servicesdd 
.dd 
Replacedd  
(dd  !
ServiceDescriptordd! 2
.dd2 3
	Singletondd3 <
<dd< =
IEmailSenderdd= I
,ddI J
NullEmailSenderddK Z
>ddZ [
(dd[ \
)dd\ ]
)dd] ^
;dd^ _
}ff 
}gg –
qD:\PROJECTS\.NET\ABP Framework\SawaTech assign\aspnet-core\src\SawaTech.PropertyMini.Domain\PropertyMiniConsts.cs
	namespace 	
SawaTech
 
. 
PropertyMini 
;  
public 
static 
class 
PropertyMiniConsts &
{ 
public 

const 
string 
DbTablePrefix %
=& '
$str( -
;- .
public 

const 
string 
DbSchema  
=! "
null# '
;' (
} ≈	
}D:\PROJECTS\.NET\ABP Framework\SawaTech assign\aspnet-core\src\SawaTech.PropertyMini.Domain\PropertyEntities\PropertyVideo.cs
	namespace

 	
SawaTech


 
.

 
PropertyMini

 
.

  
PublicProperties

  0
{ 
public 

class 
PropertyVideo 
:   
AuditedAggregateRoot! 5
<5 6
Guid6 :
>: ;
{ 
[ 	
Key	 
, 

ForeignKey 
( 
$str #
)# $
]$ %
public 
string 
Url 
{ 
get 
;  
set! $
;$ %
}& '
=( )
string* 0
.0 1
Empty1 6
;6 7
public 
Guid 

PropertyId 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
Property 
Property  
{! "
get# &
;& '
set( +
;+ ,
}- .
=/ 0
null1 5
!5 6
;6 7
} 
} Ì
D:\PROJECTS\.NET\ABP Framework\SawaTech assign\aspnet-core\src\SawaTech.PropertyMini.Domain\PropertyEntities\PropertyTypeDto.cs
	namespace 	
SawaTech
 
. 
PropertyMini 
.  
PublicProperties  0
;0 1
public 
class 
PropertyTypeDto 
{ 
public 

Guid 
Id 
{ 
get 
; 
set 
; 
}  
public 

string 
Name 
{ 
get 
; 
set !
;! "
}# $
=% &
string' -
.- .
Empty. 3
;3 4
}		 ≈
|D:\PROJECTS\.NET\ABP Framework\SawaTech assign\aspnet-core\src\SawaTech.PropertyMini.Domain\PropertyEntities\PropertyType.cs
	namespace 	
SawaTech
 
. 
PropertyMini 
.  
PublicProperties  0
{ 
public		 

class		 
PropertyType		 
:		  
AuditedAggregateRoot		 2
<		2 3
Guid		3 7
>		7 8
{

 
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
=) *
string+ 1
.1 2
Empty2 7
;7 8
} 
} ÿ
ÄD:\PROJECTS\.NET\ABP Framework\SawaTech assign\aspnet-core\src\SawaTech.PropertyMini.Domain\PropertyEntities\PropertyOwnerDto.cs
	namespace 	
SawaTech
 
. 
PropertyMini 
.  
PublicProperties  0
{ 
public 

class 
PropertyOwnerDto !
{		 
public

 
Guid

 
Id

 
{

 
get

 
;

 
set

 !
;

! "
}

# $
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
=) *
string+ 1
.1 2
Empty2 7
;7 8
public 
string 
Email 
{ 
get !
;! "
set# &
;& '
}( )
=) *
string+ 1
.1 2
Empty2 7
;7 8
public 
string 
PhoneNumber !
{" #
get$ '
;' (
set) ,
;, -
}. /
=/ 0
string1 7
.7 8
Empty8 =
;= >
public 
string 
ProfileImageUrl %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
=3 4
string5 ;
.; <
Empty< A
;A B
} 
} Ç	
ÉD:\PROJECTS\.NET\ABP Framework\SawaTech assign\aspnet-core\src\SawaTech.PropertyMini.Domain\PropertyEntities\PropertyNearbyPlace.cs
	namespace 	
SawaTech
 
. 
PropertyMini 
.  
PublicProperties  0
{ 
public		 

class		 
PropertyNearbyPlace		 $
{

 
public 
Guid 

PropertyId 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
Property 
Property  
{! "
get# &
;& '
set( +
;+ ,
}- .
=. /
null0 4
!4 5
;5 6
public 
Guid 
NearbyPlaceId !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
NearbyPlace 
NearbyPlace &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
=4 5
null6 :
!: ;
;; <
} 
} °

ÄD:\PROJECTS\.NET\ABP Framework\SawaTech assign\aspnet-core\src\SawaTech.PropertyMini.Domain\PropertyEntities\PropertyImageDto.cs
	namespace 	
SawaTech
 
. 
PropertyMini 
.  
PublicProperties  0
{ 
public 

class 
PropertyImageDto !
{		 
public

 
Guid

 
Id

 
{

 
get

 
;

 
set

 !
;

! "
}

# $
public 
string 
Url 
{ 
get 
;  
set! $
;$ %
}& '
=' (
string) /
./ 0
Empty0 5
;5 6
public 
bool 
IsMain 
{ 
get  
;  !
set" %
;% &
}' (
public 
int 
	SortOrder 
{ 
get "
;" #
set$ '
;' (
}) *
public 
string 
FullUrl 
{ 
get  #
;# $
set% (
;( )
}* +
=, -
string. 4
.4 5
Empty5 :
;: ;
} 
} ±	
}D:\PROJECTS\.NET\ABP Framework\SawaTech assign\aspnet-core\src\SawaTech.PropertyMini.Domain\PropertyEntities\PropertyImage.cs
	namespace 	
SawaTech
 
. 
PropertyMini 
.  
PublicProperties  0
;0 1
public 
class 
PropertyImage 
:  
AuditedAggregateRoot 1
<1 2
Guid2 6
>6 7
{ 
public		 

string		 
Url		 
{		 
get		 
;		 
set		  
;		  !
}		" #
=		$ %
string		& ,
.		, -
Empty		- 2
;		2 3
public

 

MediaTypeEnum

 
?

 
	MediaType

 #
{

$ %
get

& )
;

) *
set

+ .
;

. /
}

0 1
public 

Guid 

PropertyId 
{ 
get  
;  !
set" %
;% &
}' (
public 

Property 
? 
Property 
{ 
get  #
;# $
set% (
;( )
}* +
} ‹
D:\PROJECTS\.NET\ABP Framework\SawaTech assign\aspnet-core\src\SawaTech.PropertyMini.Domain\PropertyEntities\PropertyFeature.cs
	namespace 	
SawaTech
 
. 
PropertyMini 
.  
PublicProperties  0
;0 1
public 
class 
PropertyFeature 
{ 
public 

Guid 

PropertyId 
{ 
get  
;  !
set" %
;% &
}' (
public		 

Property		 
Property		 
{		 
get		 "
;		" #
set		$ '
;		' (
}		) *
=		+ ,
null		- 1
!		1 2
;		2 3
public 

Guid 
	FeatureId 
{ 
get 
;  
set! $
;$ %
}& '
public 

Feature 
Feature 
{ 
get  
;  !
set" %
;% &
}' (
=) *
null+ /
!/ 0
;0 1
} ˙	
ÄD:\PROJECTS\.NET\ABP Framework\SawaTech assign\aspnet-core\src\SawaTech.PropertyMini.Domain\PropertyEntities\PropertyAmenity .cs
	namespace 	
SawaTech
 
. 
PropertyMini 
.  
PublicProperties  0
{		 
public

 

class

 
PropertyAmenity

  
:

  ! 
AuditedAggregateRoot

" 6
<

6 7
Guid

7 ;
>

; <
{ 
public 
Guid 

PropertyId 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
Guid 
	AmenityId 
{ 
get  #
;# $
set% (
;( )
}* +
public 
virtual 
Property 
Property  (
{) *
get+ .
;. /
set0 3
;3 4
}5 6
=7 8
null9 =
!= >
;> ?
public 
virtual 
Amenity 
Amenity &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
=5 6
null7 ;
!; <
;< =
} 
} ﬂ2
xD:\PROJECTS\.NET\ABP Framework\SawaTech assign\aspnet-core\src\SawaTech.PropertyMini.Domain\PropertyEntities\Property.cs
	namespace 	
SawaTech
 
. 
PropertyMini 
.  
PublicProperties  0
;0 1
public 
class 
Property 
:  
AuditedAggregateRoot ,
<, -
Guid- 1
>1 2
{ 
public 

string 
Title 
{ 
get 
; 
set "
;" #
}$ %
=& '
string( .
.. /
Empty/ 4
;4 5
public 

Guid 
OwnerId 
{ 
get 
; 
set "
;" #
}$ %
public 

Guid 
GovernorateId 
{ 
get  #
;# $
set% (
;( )
}* +
public 

AccountUser 
Owner 
{ 
get "
;" #
}# $
=% &
null' +
!+ ,
;, -
public 

string 
? 
Description 
{  
get! $
;$ %
set& )
;) *
}+ ,
=- .
string/ 5
.5 6
Empty6 ;
;; <
public 

Guid 
PropertyTypeId 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 

PropertyType 
? 
PropertyType %
{& '
get( +
;+ ,
}- .
=/ 0
null1 5
!5 6
;6 7
public 

string 
? 
PaymentType 
{  
get! $
;$ %
set& )
;) *
}+ ,
=- .
string/ 5
.5 6
Empty6 ;
;; <
public 

string 
Status 
{ 
get 
; 
set  #
;# $
}% &
=' (
string) /
./ 0
Empty0 5
;5 6
public 

string 
Address 
{ 
get 
;  
set! $
;$ %
}& '
=( )
string* 0
.0 1
Empty1 6
;6 7
public 

string 
	MainImage 
{ 
get !
;! "
set# &
;& '
}( )
=* +
string, 2
.2 3
Empty3 8
;8 9
public 

decimal 
Price 
{ 
get 
; 
set  #
;# $
}% &
public   

decimal   
InsurancePayment   #
{  $ %
get  & )
;  ) *
set  + .
;  . /
}  0 1
public!! 

float!! 
Area!! 
{!! 
get!! 
;!! 
set!!  
;!!  !
}!!" #
public"" 

int"" 
Rooms"" 
{"" 
get"" 
;"" 
set"" 
;""  
}""! "
public## 

double## 
Latitude## 
{## 
get##  
;##  !
set##" %
;##% &
}##' (
public$$ 

double$$ 
	Longitude$$ 
{$$ 
get$$ !
;$$! "
set$$# &
;$$& '
}$$( )
[&& 

JsonIgnore&& 
]&& 
public'' 

virtual'' 
ICollection'' 
<'' 
PropertyAmenity'' .
>''. /
PropertyAmenities''0 A
{''B C
get''D G
;''G H
set''I L
;''L M
}''N O
=''P Q
[''R S
]''S T
;''T U
[)) 

JsonIgnore)) 
])) 
public** 

virtual** 
ICollection** 
<** 
PropertyFeature** .
>**. /
PropertyFeatures**0 @
{**A B
get**C F
;**F G
set**H K
;**K L
}**M N
=**O P
[**Q R
]**R S
;**S T
[,, 
	NotMapped,, 
],, 
public-- 

List-- 
<-- 
Amenity-- 
>-- 
?-- 
	Amenities-- #
=>--$ &
PropertyAmenities--' 8
?--8 9
.--9 :
Select--: @
(--@ A
static--A G
pa--H J
=>--K M
pa--N P
.--P Q
Amenity--Q X
)--X Y
.--Y Z
ToList--Z `
(--` a
)--a b
;--b c
[// 
	NotMapped// 
]// 
public00 

List00 
<00 
Feature00 
>00 
?00 
Features00 "
=>00# %
PropertyFeatures00& 6
?006 7
.007 8
Select008 >
(00> ?
pa00? A
=>00B D
pa00E G
.00G H
Feature00H O
)00O P
.00P Q
ToList00Q W
(00W X
)00X Y
;00Y Z
[22 

JsonIgnore22 
]22 
public33 

List33 
<33 
PropertyImage33 
>33 
PropertyImages33 -
{33. /
get330 3
;333 4
}335 6
=337 8
[339 :
]33: ;
;33; <
[55 

JsonIgnore55 
]55 
public66 

PropertyVideo66 
?66 
PropertyVideo66 '
{66( )
get66* -
;66- .
set66/ 2
;662 3
}664 5
public88 

virtual88 
ICollection88 
<88 
PropertyNearbyPlace88 2
>882 3 
PropertyNearbyPlaces884 H
{88I J
get88K N
;88N O
set88P S
;88S T
}88U V
=88W X
null88Y ]
!88] ^
;88^ _
public99 

Governorate99 
Governorate99 "
{99# $
get99% (
;99( )
set99* -
;99- .
}99/ 0
=991 2
null993 7
!997 8
;998 9
}:: Ø
{D:\PROJECTS\.NET\ABP Framework\SawaTech assign\aspnet-core\src\SawaTech.PropertyMini.Domain\PropertyEntities\LocationDto.cs
	namespace 	
SawaTech
 
. 
PropertyMini 
.  
PublicProperties  0
{ 
public 

class 
LocationDto 
{		 
public

 
double

 
Latitude

 
{

  
get

! $
;

$ %
set

& )
;

) *
}

+ ,
public 
double 
	Longitude 
{  !
get" %
;% &
set' *
;* +
}, -
} 
} É

wD:\PROJECTS\.NET\ABP Framework\SawaTech assign\aspnet-core\src\SawaTech.PropertyMini.Domain\PropertyEntities\Feature.cs
	namespace 	
SawaTech
 
. 
PropertyMini 
.  
PublicProperties  0
;0 1
public 
class 
Feature 
:  
AuditedAggregateRoot *
<* +
Guid+ /
>/ 0
{ 
public		 

string		 
Name		 
{		 
get		 
;		 
set		 !
;		! "
}		# $
=		% &
string		' -
.		- .
Empty		. 3
;		3 4
public

 

string

 
IconUrl

 
{

 
get

 
;

  
set

! $
;

$ %
}

& '
=

( )
string

* 0
.

0 1
Empty

1 6
;

6 7
public 

ICollection 
< 
Property  
>  !

Properties" ,
{ 
get 	
;	 

set 
; 
} 
= 
new 
List 
< 
Property %
>% &
(& '
)' (
;( )
} ∫
D:\PROJECTS\.NET\ABP Framework\SawaTech assign\aspnet-core\src\SawaTech.PropertyMini.Domain\PropertyAppDataSeederContributor.cs
	namespace

 	
SawaTech


 
.

 
PropertyMini

 
{ 
public 

class ,
 PropertyAppDataSeederContributor 1
:2 3 
IDataSeedContributor4 H
{ 
private 
readonly 
IRepository $
<$ %
Feature% ,
,, -
Guid. 2
>2 3&
_propertyFeatureRepository4 N
;N O
public ,
 PropertyAppDataSeederContributor /
(/ 0
IRepository0 ;
<; <
Feature< C
,C D
GuidD H
>H I

repositoryJ T
)T U
{ 	&
_propertyFeatureRepository &
=' (

repository) 3
;3 4
} 	
public 
async 
Task 
	SeedAsync #
(# $
DataSeedContext$ 3
context4 ;
); <
{ 	
if 
( 
await &
_propertyFeatureRepository 0
.0 1
GetCountAsync1 >
(> ?
)? @
<=A C
$numD E
)E F
{ 
await &
_propertyFeatureRepository 0
.0 1
InsertAsync1 <
(< =
new 
Feature 
{ 
Name 
= 
$str (
,( )
IconUrl 
=  !
$str" )
} 
, 
autoSave 
: 
true "
)   
;   
await"" &
_propertyFeatureRepository"" 0
.""0 1
InsertAsync""1 <
(""< =
new## 
Feature##  
{$$ 
Name%% 
=%% 
$str%%  (
,%%( )
IconUrl&&  
=&&! "
$str&&# *
}'' 
,'' 
autoSave(( 
:(( 
true(( #
))) 
;)) 
await++ &
_propertyFeatureRepository++ 0
.++0 1
InsertAsync++1 <
(++< =
new,, 
Feature,, 
{-- 
Name.. 
=.. 
$str.. *
,..* +
IconUrl// 
=//  
$str//! (
}00 
,00 
autoSave11 
:11 
true11 !
)22 
;22 
await44 &
_propertyFeatureRepository44 0
.440 1
InsertAsync441 <
(44< =
new55 
Feature55 
{66 
Name77 
=77 
$str77 &
,77& '
IconUrl88 
=88  
$str88! (
}99 
,99 
autoSave:: 
::: 
true:: !
);; 
;;; 
}== 
}>> 	
}?? 
}@@ ¨
vD:\PROJECTS\.NET\ABP Framework\SawaTech assign\aspnet-core\src\SawaTech.PropertyMini.Domain\Properties\AssemblyInfo.cs
[ 
assembly 	
:	 
'
InternalsVisibleToAttribute
 %
(% &
$str& J
)J K
]K L
[ 
assembly 	
:	 
'
InternalsVisibleToAttribute
 %
(% &
$str& F
)F G
]G H°¶
áD:\PROJECTS\.NET\ABP Framework\SawaTech assign\aspnet-core\src\SawaTech.PropertyMini.Domain\OpenIddict\OpenIddictDataSeedContributor.cs
	namespace 	
SawaTech
 
. 
PropertyMini 
.  

OpenIddict  *
;* +
public 
class )
OpenIddictDataSeedContributor *
:+ , 
IDataSeedContributor- A
,A B 
ITransientDependencyC W
{ 
private 
readonly 
IConfiguration #
_configuration$ 2
;2 3
private 
readonly ,
 IOpenIddictApplicationRepository 5,
 _openIddictApplicationRepository6 V
;V W
private 
readonly "
IAbpApplicationManager +
_applicationManager, ?
;? @
private 
readonly &
IOpenIddictScopeRepository /&
_openIddictScopeRepository0 J
;J K
private 
readonly #
IOpenIddictScopeManager ,
_scopeManager- :
;: ;
private 
readonly !
IPermissionDataSeeder *!
_permissionDataSeeder+ @
;@ A
private   
readonly   
IStringLocalizer   %
<  % &
OpenIddictResponse  & 8
>  8 9
L  : ;
;  ; <
public"" 
)
OpenIddictDataSeedContributor"" (
(""( )
IConfiguration## 
configuration## $
,##$ %,
 IOpenIddictApplicationRepository$$ (+
openIddictApplicationRepository$$) H
,$$H I"
IAbpApplicationManager%% 
applicationManager%% 1
,%%1 2&
IOpenIddictScopeRepository&& "%
openIddictScopeRepository&&# <
,&&< =#
IOpenIddictScopeManager'' 
scopeManager''  ,
,'', -!
IPermissionDataSeeder((  
permissionDataSeeder(( 2
,((2 3
IStringLocalizer)) 
<)) 
OpenIddictResponse)) +
>))+ ,
l))- .
)))/ 0
{** 
_configuration++ 
=++ 
configuration++ &
;++& ',
 _openIddictApplicationRepository,, (
=,,) *+
openIddictApplicationRepository,,+ J
;,,J K
_applicationManager-- 
=-- 
applicationManager-- 0
;--0 1&
_openIddictScopeRepository.. "
=..# $%
openIddictScopeRepository..% >
;..> ?
_scopeManager// 
=// 
scopeManager// $
;//$ %!
_permissionDataSeeder00 
=00  
permissionDataSeeder00  4
;004 5
L11 	
=11
 
l11 
;11 
}22 
[44 

UnitOfWork44 
]44 
public55 

virtual55 
async55 
Task55 
	SeedAsync55 '
(55' (
DataSeedContext55( 7
context558 ?
)55? @
{66 
await77 
CreateScopesAsync77 
(77  
)77  !
;77! "
await88 #
CreateApplicationsAsync88 %
(88% &
)88& '
;88' (
}99 
private;; 
async;; 
Task;; 
CreateScopesAsync;; (
(;;( )
);;) *
{<< 
if== 

(== 
await== &
_openIddictScopeRepository== ,
.==, -
FindByNameAsync==- <
(==< =
$str=== K
)==K L
====M O
null==P T
)==T U
{>> 	
await?? 
_scopeManager?? 
.??  
CreateAsync??  +
(??+ ,
new??, /%
OpenIddictScopeDescriptor??0 I
{??J K
Name@@ 
=@@ 
$str@@ %
,@@% &
DisplayName@@' 2
=@@3 4
$str@@5 G
,@@G H
	Resources@@I R
=@@S T
{@@U V
$str@@W e
}@@f g
}AA 
)AA 
;AA 
}BB 	
}CC 
privateEE 
asyncEE 
TaskEE #
CreateApplicationsAsyncEE .
(EE. /
)EE/ 0
{FF 
varGG 
commonScopesGG 
=GG 
newGG 
ListGG #
<GG# $
stringGG$ *
>GG* +
{GG, -
OpenIddictConstantsHH 
.HH  
PermissionsHH  +
.HH+ ,
ScopesHH, 2
.HH2 3
AddressHH3 :
,HH: ;
OpenIddictConstantsII 
.II  
PermissionsII  +
.II+ ,
ScopesII, 2
.II2 3
EmailII3 8
,II8 9
OpenIddictConstantsJJ 
.JJ  
PermissionsJJ  +
.JJ+ ,
ScopesJJ, 2
.JJ2 3
PhoneJJ3 8
,JJ8 9
OpenIddictConstantsKK 
.KK  
PermissionsKK  +
.KK+ ,
ScopesKK, 2
.KK2 3
ProfileKK3 :
,KK: ;
OpenIddictConstantsLL 
.LL  
PermissionsLL  +
.LL+ ,
ScopesLL, 2
.LL2 3
RolesLL3 8
,LL8 9
$strMM 
}NN 	
;NN	 

varPP  
configurationSectionPP  
=PP! "
_configurationPP# 1
.PP1 2

GetSectionPP2 <
(PP< =
$strPP= V
)PPV W
;PPW X
varTT %
consoleAndAngularClientIdTT %
=TT& ' 
configurationSectionTT( <
[TT< =
$strTT= X
]TTX Y
;TTY Z
ifUU 

(UU 
!UU %
consoleAndAngularClientIdUU &
.UU& '
IsNullOrWhiteSpaceUU' 9
(UU9 :
)UU: ;
)UU; <
{VV 	
varWW *
consoleAndAngularClientRootUrlWW .
=WW/ 0 
configurationSectionWW1 E
[WWE F
$strWWF `
]WW` a
?WWa b
.WWb c
TrimEndWWc j
(WWj k
$charWWk n
)WWn o
;WWo p
awaitXX "
CreateApplicationAsyncXX (
(XX( )
nameYY 
:YY %
consoleAndAngularClientIdYY /
!YY/ 0
,YY0 1
typeZZ 
:ZZ 
OpenIddictConstantsZZ )
.ZZ) *
ClientTypesZZ* 5
.ZZ5 6
PublicZZ6 <
,ZZ< =
consentType[[ 
:[[ 
OpenIddictConstants[[ 0
.[[0 1
ConsentTypes[[1 =
.[[= >
Implicit[[> F
,[[F G
displayName\\ 
:\\ 
$str\\ A
,\\A B
secret]] 
:]] 
null]] 
,]] 

grantTypes^^ 
:^^ 
new^^ 
List^^  $
<^^$ %
string^^% +
>^^+ ,
{^^- .
OpenIddictConstants__ '
.__' (

GrantTypes__( 2
.__2 3
AuthorizationCode__3 D
,__D E
OpenIddictConstants`` '
.``' (

GrantTypes``( 2
.``2 3
Password``3 ;
,``; <
OpenIddictConstantsaa '
.aa' (

GrantTypesaa( 2
.aa2 3
ClientCredentialsaa3 D
,aaD E
OpenIddictConstantsbb '
.bb' (

GrantTypesbb( 2
.bb2 3
RefreshTokenbb3 ?
}cc 
,cc 
scopesdd 
:dd 
commonScopesdd $
,dd$ %
redirectUriee 
:ee *
consoleAndAngularClientRootUrlee ;
,ee; <
	clientUriff 
:ff *
consoleAndAngularClientRootUrlff 9
,ff9 :!
postLogoutRedirectUrigg %
:gg% &*
consoleAndAngularClientRootUrlgg' E
)hh 
;hh 
}ii 	
varoo 
swaggerClientIdoo 
=oo  
configurationSectionoo 2
[oo2 3
$stroo3 R
]ooR S
;ooS T
ifpp 

(pp 
!pp 
swaggerClientIdpp 
.pp 
IsNullOrWhiteSpacepp /
(pp/ 0
)pp0 1
)pp1 2
{qq 	
varrr 
swaggerRootUrlrr 
=rr   
configurationSectionrr! 5
[rr5 6
$strrr6 T
]rrT U
?rrU V
.rrV W
TrimEndrrW ^
(rr^ _
$charrr_ b
)rrb c
;rrc d
awaittt "
CreateApplicationAsynctt (
(tt( )
nameuu 
:uu 
swaggerClientIduu %
!uu% &
,uu& '
typevv 
:vv 
OpenIddictConstantsvv )
.vv) *
ClientTypesvv* 5
.vv5 6
Publicvv6 <
,vv< =
consentTypeww 
:ww 
OpenIddictConstantsww 0
.ww0 1
ConsentTypesww1 =
.ww= >
Implicitww> F
,wwF G
displayNamexx 
:xx 
$strxx 2
,xx2 3
secretyy 
:yy 
nullyy 
,yy 

grantTypeszz 
:zz 
newzz 
Listzz  $
<zz$ %
stringzz% +
>zz+ ,
{zz- .
OpenIddictConstantszz/ B
.zzB C

GrantTypeszzC M
.zzM N
AuthorizationCodezzN _
,zz_ `
}zza b
,zzb c
scopes{{ 
:{{ 
commonScopes{{ $
,{{$ %
redirectUri|| 
:|| 
$"|| 
{||  
swaggerRootUrl||  .
}||. /
$str||/ L
"||L M
,||M N
	clientUri}} 
:}} 
swaggerRootUrl}} )
)~~ 
;~~ 
} 	
}
ÄÄ 
private
ÇÇ 
async
ÇÇ 
Task
ÇÇ $
CreateApplicationAsync
ÇÇ -
(
ÇÇ- .
[
ÉÉ 	
NotNull
ÉÉ	 
]
ÉÉ 
string
ÉÉ 
name
ÉÉ 
,
ÉÉ 
[
ÑÑ 	
NotNull
ÑÑ	 
]
ÑÑ 
string
ÑÑ 
type
ÑÑ 
,
ÑÑ 
[
ÖÖ 	
NotNull
ÖÖ	 
]
ÖÖ 
string
ÖÖ 
consentType
ÖÖ $
,
ÖÖ$ %
string
ÜÜ 
displayName
ÜÜ 
,
ÜÜ 
string
áá 
?
áá 
secret
áá 
,
áá 
List
àà 
<
àà 
string
àà 
>
àà 

grantTypes
àà 
,
àà  
List
ââ 
<
ââ 
string
ââ 
>
ââ 
scopes
ââ 
,
ââ 
string
ää 
?
ää 
	clientUri
ää 
=
ää 
null
ää  
,
ää  !
string
ãã 
?
ãã 
redirectUri
ãã 
=
ãã 
null
ãã "
,
ãã" #
string
åå 
?
åå #
postLogoutRedirectUri
åå %
=
åå& '
null
åå( ,
,
åå, -
List
çç 
<
çç 
string
çç 
>
çç 
?
çç 
permissions
çç !
=
çç" #
null
çç$ (
)
çç( )
{
éé 
if
èè 

(
èè 
!
èè 
string
èè 
.
èè 
IsNullOrEmpty
èè !
(
èè! "
secret
èè" (
)
èè( )
&&
èè* ,
string
èè- 3
.
èè3 4
Equals
èè4 :
(
èè: ;
type
èè; ?
,
èè? @!
OpenIddictConstants
èèA T
.
èèT U
ClientTypes
èèU `
.
èè` a
Public
èèa g
,
èèg h
StringComparison
êê  
.
êê  !
OrdinalIgnoreCase
êê! 2
)
êê2 3
)
êê3 4
{
ëë 	
throw
íí 
new
íí 
BusinessException
íí '
(
íí' (
L
íí( )
[
íí) *
$str
íí* W
]
ííW X
)
ííX Y
;
ííY Z
}
ìì 	
if
ïï 

(
ïï 
string
ïï 
.
ïï 
IsNullOrEmpty
ïï  
(
ïï  !
secret
ïï! '
)
ïï' (
&&
ïï) +
string
ïï, 2
.
ïï2 3
Equals
ïï3 9
(
ïï9 :
type
ïï: >
,
ïï> ?!
OpenIddictConstants
ïï@ S
.
ïïS T
ClientTypes
ïïT _
.
ïï_ `
Confidential
ïï` l
,
ïïl m
StringComparison
ññ  
.
ññ  !
OrdinalIgnoreCase
ññ! 2
)
ññ2 3
)
ññ3 4
{
óó 	
throw
òò 
new
òò 
BusinessException
òò '
(
òò' (
L
òò( )
[
òò) *
$str
òò* `
]
òò` a
)
òòa b
;
òòb c
}
ôô 	
var
õõ 
client
õõ 
=
õõ 
await
õõ .
 _openIddictApplicationRepository
õõ ;
.
õõ; <!
FindByClientIdAsync
õõ< O
(
õõO P
name
õõP T
)
õõT U
;
õõU V
var
ùù 
application
ùù 
=
ùù 
new
ùù &
AbpApplicationDescriptor
ùù 6
{
ùù7 8
ClientId
ûû 
=
ûû 
name
ûû 
,
ûû 

ClientType
üü 
=
üü 
type
üü 
,
üü 
ClientSecret
†† 
=
†† 
secret
†† !
,
††! "
ConsentType
°° 
=
°° 
consentType
°° %
,
°°% &
DisplayName
¢¢ 
=
¢¢ 
displayName
¢¢ %
,
¢¢% &
	ClientUri
££ 
=
££ 
	clientUri
££ !
,
££! "
}
§§ 	
;
§§	 

Check
¶¶ 
.
¶¶ 
NotNullOrEmpty
¶¶ 
(
¶¶ 

grantTypes
¶¶ '
,
¶¶' (
nameof
¶¶) /
(
¶¶/ 0

grantTypes
¶¶0 :
)
¶¶: ;
)
¶¶; <
;
¶¶< =
Check
ßß 
.
ßß 
NotNullOrEmpty
ßß 
(
ßß 
scopes
ßß #
,
ßß# $
nameof
ßß% +
(
ßß+ ,
scopes
ßß, 2
)
ßß2 3
)
ßß3 4
;
ßß4 5
if
©© 

(
©© 
new
©© 
[
©© 
]
©© 
{
©© !
OpenIddictConstants
©© '
.
©©' (

GrantTypes
©©( 2
.
©©2 3
AuthorizationCode
©©3 D
,
©©D E!
OpenIddictConstants
©©F Y
.
©©Y Z

GrantTypes
©©Z d
.
©©d e
Implicit
©©e m
}
©©n o
.
©©o p
All
©©p s
(
©©s t

grantTypes
™™ 
.
™™ 
Contains
™™ #
)
™™# $
)
™™$ %
{
´´ 	
application
¨¨ 
.
¨¨ 
Permissions
¨¨ #
.
¨¨# $
Add
¨¨$ '
(
¨¨' (!
OpenIddictConstants
¨¨( ;
.
¨¨; <
Permissions
¨¨< G
.
¨¨G H
ResponseTypes
¨¨H U
.
¨¨U V
CodeIdToken
¨¨V a
)
¨¨a b
;
¨¨b c
if
ÆÆ 
(
ÆÆ 
string
ÆÆ 
.
ÆÆ 
Equals
ÆÆ 
(
ÆÆ 
type
ÆÆ "
,
ÆÆ" #!
OpenIddictConstants
ÆÆ$ 7
.
ÆÆ7 8
ClientTypes
ÆÆ8 C
.
ÆÆC D
Public
ÆÆD J
,
ÆÆJ K
StringComparison
ÆÆL \
.
ÆÆ\ ]
OrdinalIgnoreCase
ÆÆ] n
)
ÆÆn o
)
ÆÆo p
{
ØØ 
application
∞∞ 
.
∞∞ 
Permissions
∞∞ '
.
∞∞' (
Add
∞∞( +
(
∞∞+ ,!
OpenIddictConstants
∞∞, ?
.
∞∞? @
Permissions
∞∞@ K
.
∞∞K L
ResponseTypes
∞∞L Y
.
∞∞Y Z
CodeIdTokenToken
∞∞Z j
)
∞∞j k
;
∞∞k l
application
±± 
.
±± 
Permissions
±± '
.
±±' (
Add
±±( +
(
±±+ ,!
OpenIddictConstants
±±, ?
.
±±? @
Permissions
±±@ K
.
±±K L
ResponseTypes
±±L Y
.
±±Y Z
	CodeToken
±±Z c
)
±±c d
;
±±d e
}
≤≤ 
}
≥≥ 	
if
µµ 

(
µµ 
!
µµ 
redirectUri
µµ 
.
µµ  
IsNullOrWhiteSpace
µµ +
(
µµ+ ,
)
µµ, -
||
µµ. 0
!
µµ1 2#
postLogoutRedirectUri
µµ2 G
.
µµG H 
IsNullOrWhiteSpace
µµH Z
(
µµZ [
)
µµ[ \
)
µµ\ ]
{
∂∂ 	
application
∑∑ 
.
∑∑ 
Permissions
∑∑ #
.
∑∑# $
Add
∑∑$ '
(
∑∑' (!
OpenIddictConstants
∑∑( ;
.
∑∑; <
Permissions
∑∑< G
.
∑∑G H
	Endpoints
∑∑H Q
.
∑∑Q R

EndSession
∑∑R \
)
∑∑\ ]
;
∑∑] ^
}
∏∏ 	
var
∫∫ 
buildInGrantTypes
∫∫ 
=
∫∫ 
new
∫∫  #
[
∫∫# $
]
∫∫$ %
{
∫∫& '!
OpenIddictConstants
ªª 
.
ªª  

GrantTypes
ªª  *
.
ªª* +
Implicit
ªª+ 3
,
ªª3 4!
OpenIddictConstants
ªª5 H
.
ªªH I

GrantTypes
ªªI S
.
ªªS T
Password
ªªT \
,
ªª\ ]!
OpenIddictConstants
ºº 
.
ºº  

GrantTypes
ºº  *
.
ºº* +
AuthorizationCode
ºº+ <
,
ºº< =!
OpenIddictConstants
ºº> Q
.
ººQ R

GrantTypes
ººR \
.
ºº\ ]
ClientCredentials
ºº] n
,
ººn o!
OpenIddictConstants
ΩΩ 
.
ΩΩ  

GrantTypes
ΩΩ  *
.
ΩΩ* +

DeviceCode
ΩΩ+ 5
,
ΩΩ5 6!
OpenIddictConstants
ΩΩ7 J
.
ΩΩJ K

GrantTypes
ΩΩK U
.
ΩΩU V
RefreshToken
ΩΩV b
}
ææ 	
;
ææ	 

foreach
¿¿ 
(
¿¿ 
var
¿¿ 
	grantType
¿¿ 
in
¿¿ !

grantTypes
¿¿" ,
)
¿¿, -
{
¡¡ 	
if
¬¬ 
(
¬¬ 
	grantType
¬¬ 
==
¬¬ !
OpenIddictConstants
¬¬ 0
.
¬¬0 1

GrantTypes
¬¬1 ;
.
¬¬; <
AuthorizationCode
¬¬< M
)
¬¬M N
{
√√ 
application
ƒƒ 
.
ƒƒ 
Permissions
ƒƒ '
.
ƒƒ' (
Add
ƒƒ( +
(
ƒƒ+ ,!
OpenIddictConstants
ƒƒ, ?
.
ƒƒ? @
Permissions
ƒƒ@ K
.
ƒƒK L

GrantTypes
ƒƒL V
.
ƒƒV W
AuthorizationCode
ƒƒW h
)
ƒƒh i
;
ƒƒi j
application
≈≈ 
.
≈≈ 
Permissions
≈≈ '
.
≈≈' (
Add
≈≈( +
(
≈≈+ ,!
OpenIddictConstants
≈≈, ?
.
≈≈? @
Permissions
≈≈@ K
.
≈≈K L
ResponseTypes
≈≈L Y
.
≈≈Y Z
Code
≈≈Z ^
)
≈≈^ _
;
≈≈_ `
}
∆∆ 
if
»» 
(
»» 
	grantType
»» 
==
»» !
OpenIddictConstants
»» 0
.
»»0 1

GrantTypes
»»1 ;
.
»»; <
AuthorizationCode
»»< M
||
»»N P
	grantType
…… 
==
…… !
OpenIddictConstants
…… 0
.
……0 1

GrantTypes
……1 ;
.
……; <
Implicit
……< D
)
……D E
{
   
application
ÀÀ 
.
ÀÀ 
Permissions
ÀÀ '
.
ÀÀ' (
Add
ÀÀ( +
(
ÀÀ+ ,!
OpenIddictConstants
ÀÀ, ?
.
ÀÀ? @
Permissions
ÀÀ@ K
.
ÀÀK L
	Endpoints
ÀÀL U
.
ÀÀU V
Authorization
ÀÀV c
)
ÀÀc d
;
ÀÀd e
}
ÃÃ 
if
ŒŒ 
(
ŒŒ 
	grantType
ŒŒ 
==
ŒŒ !
OpenIddictConstants
ŒŒ 0
.
ŒŒ0 1

GrantTypes
ŒŒ1 ;
.
ŒŒ; <
AuthorizationCode
ŒŒ< M
||
ŒŒN P
	grantType
œœ 
==
œœ !
OpenIddictConstants
œœ 0
.
œœ0 1

GrantTypes
œœ1 ;
.
œœ; <
ClientCredentials
œœ< M
||
œœN P
	grantType
–– 
==
–– !
OpenIddictConstants
–– 0
.
––0 1

GrantTypes
––1 ;
.
––; <
Password
––< D
||
––E G
	grantType
—— 
==
—— !
OpenIddictConstants
—— 0
.
——0 1

GrantTypes
——1 ;
.
——; <
RefreshToken
——< H
||
——I K
	grantType
““ 
==
““ !
OpenIddictConstants
““ 0
.
““0 1

GrantTypes
““1 ;
.
““; <

DeviceCode
““< F
)
““F G
{
”” 
application
‘‘ 
.
‘‘ 
Permissions
‘‘ '
.
‘‘' (
Add
‘‘( +
(
‘‘+ ,!
OpenIddictConstants
‘‘, ?
.
‘‘? @
Permissions
‘‘@ K
.
‘‘K L
	Endpoints
‘‘L U
.
‘‘U V
Token
‘‘V [
)
‘‘[ \
;
‘‘\ ]
application
’’ 
.
’’ 
Permissions
’’ '
.
’’' (
Add
’’( +
(
’’+ ,!
OpenIddictConstants
’’, ?
.
’’? @
Permissions
’’@ K
.
’’K L
	Endpoints
’’L U
.
’’U V

Revocation
’’V `
)
’’` a
;
’’a b
application
÷÷ 
.
÷÷ 
Permissions
÷÷ '
.
÷÷' (
Add
÷÷( +
(
÷÷+ ,!
OpenIddictConstants
÷÷, ?
.
÷÷? @
Permissions
÷÷@ K
.
÷÷K L
	Endpoints
÷÷L U
.
÷÷U V
Introspection
÷÷V c
)
÷÷c d
;
÷÷d e
}
◊◊ 
if
ŸŸ 
(
ŸŸ 
	grantType
ŸŸ 
==
ŸŸ !
OpenIddictConstants
ŸŸ 0
.
ŸŸ0 1

GrantTypes
ŸŸ1 ;
.
ŸŸ; <
ClientCredentials
ŸŸ< M
)
ŸŸM N
{
⁄⁄ 
application
€€ 
.
€€ 
Permissions
€€ '
.
€€' (
Add
€€( +
(
€€+ ,!
OpenIddictConstants
€€, ?
.
€€? @
Permissions
€€@ K
.
€€K L

GrantTypes
€€L V
.
€€V W
ClientCredentials
€€W h
)
€€h i
;
€€i j
}
‹‹ 
if
ﬁﬁ 
(
ﬁﬁ 
	grantType
ﬁﬁ 
==
ﬁﬁ !
OpenIddictConstants
ﬁﬁ 0
.
ﬁﬁ0 1

GrantTypes
ﬁﬁ1 ;
.
ﬁﬁ; <
Implicit
ﬁﬁ< D
)
ﬁﬁD E
{
ﬂﬂ 
application
‡‡ 
.
‡‡ 
Permissions
‡‡ '
.
‡‡' (
Add
‡‡( +
(
‡‡+ ,!
OpenIddictConstants
‡‡, ?
.
‡‡? @
Permissions
‡‡@ K
.
‡‡K L

GrantTypes
‡‡L V
.
‡‡V W
Implicit
‡‡W _
)
‡‡_ `
;
‡‡` a
}
·· 
if
„„ 
(
„„ 
	grantType
„„ 
==
„„ !
OpenIddictConstants
„„ 0
.
„„0 1

GrantTypes
„„1 ;
.
„„; <
Password
„„< D
)
„„D E
{
‰‰ 
application
ÂÂ 
.
ÂÂ 
Permissions
ÂÂ '
.
ÂÂ' (
Add
ÂÂ( +
(
ÂÂ+ ,!
OpenIddictConstants
ÂÂ, ?
.
ÂÂ? @
Permissions
ÂÂ@ K
.
ÂÂK L

GrantTypes
ÂÂL V
.
ÂÂV W
Password
ÂÂW _
)
ÂÂ_ `
;
ÂÂ` a
}
ÊÊ 
if
ËË 
(
ËË 
	grantType
ËË 
==
ËË !
OpenIddictConstants
ËË 0
.
ËË0 1

GrantTypes
ËË1 ;
.
ËË; <
RefreshToken
ËË< H
)
ËËH I
{
ÈÈ 
application
ÍÍ 
.
ÍÍ 
Permissions
ÍÍ '
.
ÍÍ' (
Add
ÍÍ( +
(
ÍÍ+ ,!
OpenIddictConstants
ÍÍ, ?
.
ÍÍ? @
Permissions
ÍÍ@ K
.
ÍÍK L

GrantTypes
ÍÍL V
.
ÍÍV W
RefreshToken
ÍÍW c
)
ÍÍc d
;
ÍÍd e
}
ÎÎ 
if
ÌÌ 
(
ÌÌ 
	grantType
ÌÌ 
==
ÌÌ !
OpenIddictConstants
ÌÌ 0
.
ÌÌ0 1

GrantTypes
ÌÌ1 ;
.
ÌÌ; <

DeviceCode
ÌÌ< F
)
ÌÌF G
{
ÓÓ 
application
ÔÔ 
.
ÔÔ 
Permissions
ÔÔ '
.
ÔÔ' (
Add
ÔÔ( +
(
ÔÔ+ ,!
OpenIddictConstants
ÔÔ, ?
.
ÔÔ? @
Permissions
ÔÔ@ K
.
ÔÔK L

GrantTypes
ÔÔL V
.
ÔÔV W

DeviceCode
ÔÔW a
)
ÔÔa b
;
ÔÔb c
application
 
.
 
Permissions
 '
.
' (
Add
( +
(
+ ,!
OpenIddictConstants
, ?
.
? @
Permissions
@ K
.
K L
	Endpoints
L U
.
U V!
DeviceAuthorization
V i
)
i j
;
j k
}
ÒÒ 
if
ÛÛ 
(
ÛÛ 
	grantType
ÛÛ 
==
ÛÛ !
OpenIddictConstants
ÛÛ 0
.
ÛÛ0 1

GrantTypes
ÛÛ1 ;
.
ÛÛ; <
Implicit
ÛÛ< D
)
ÛÛD E
{
ÙÙ 
application
ıı 
.
ıı 
Permissions
ıı '
.
ıı' (
Add
ıı( +
(
ıı+ ,!
OpenIddictConstants
ıı, ?
.
ıı? @
Permissions
ıı@ K
.
ııK L
ResponseTypes
ııL Y
.
ııY Z
IdToken
ııZ a
)
ııa b
;
ııb c
if
ˆˆ 
(
ˆˆ 
string
ˆˆ 
.
ˆˆ 
Equals
ˆˆ !
(
ˆˆ! "
type
ˆˆ" &
,
ˆˆ& '!
OpenIddictConstants
ˆˆ( ;
.
ˆˆ; <
ClientTypes
ˆˆ< G
.
ˆˆG H
Public
ˆˆH N
,
ˆˆN O
StringComparison
ˆˆP `
.
ˆˆ` a
OrdinalIgnoreCase
ˆˆa r
)
ˆˆr s
)
ˆˆs t
{
˜˜ 
application
¯¯ 
.
¯¯  
Permissions
¯¯  +
.
¯¯+ ,
Add
¯¯, /
(
¯¯/ 0!
OpenIddictConstants
¯¯0 C
.
¯¯C D
Permissions
¯¯D O
.
¯¯O P
ResponseTypes
¯¯P ]
.
¯¯] ^
IdTokenToken
¯¯^ j
)
¯¯j k
;
¯¯k l
application
˘˘ 
.
˘˘  
Permissions
˘˘  +
.
˘˘+ ,
Add
˘˘, /
(
˘˘/ 0!
OpenIddictConstants
˘˘0 C
.
˘˘C D
Permissions
˘˘D O
.
˘˘O P
ResponseTypes
˘˘P ]
.
˘˘] ^
Token
˘˘^ c
)
˘˘c d
;
˘˘d e
}
˙˙ 
}
˚˚ 
if
˝˝ 
(
˝˝ 
!
˝˝ 
buildInGrantTypes
˝˝ "
.
˝˝" #
Contains
˝˝# +
(
˝˝+ ,
	grantType
˝˝, 5
)
˝˝5 6
)
˝˝6 7
{
˛˛ 
application
ˇˇ 
.
ˇˇ 
Permissions
ˇˇ '
.
ˇˇ' (
Add
ˇˇ( +
(
ˇˇ+ ,!
OpenIddictConstants
ˇˇ, ?
.
ˇˇ? @
Permissions
ˇˇ@ K
.
ˇˇK L
Prefixes
ˇˇL T
.
ˇˇT U
	GrantType
ˇˇU ^
+
ˇˇ_ `
	grantType
ˇˇa j
)
ˇˇj k
;
ˇˇk l
}
ÄÄ 
}
ÅÅ 	
var
ÉÉ 
buildInScopes
ÉÉ 
=
ÉÉ 
new
ÉÉ 
[
ÉÉ  
]
ÉÉ  !
{
ÉÉ" #!
OpenIddictConstants
ÑÑ 
.
ÑÑ  
Permissions
ÑÑ  +
.
ÑÑ+ ,
Scopes
ÑÑ, 2
.
ÑÑ2 3
Address
ÑÑ3 :
,
ÑÑ: ;!
OpenIddictConstants
ÑÑ< O
.
ÑÑO P
Permissions
ÑÑP [
.
ÑÑ[ \
Scopes
ÑÑ\ b
.
ÑÑb c
Email
ÑÑc h
,
ÑÑh i!
OpenIddictConstants
ÖÖ 
.
ÖÖ  
Permissions
ÖÖ  +
.
ÖÖ+ ,
Scopes
ÖÖ, 2
.
ÖÖ2 3
Phone
ÖÖ3 8
,
ÖÖ8 9!
OpenIddictConstants
ÖÖ: M
.
ÖÖM N
Permissions
ÖÖN Y
.
ÖÖY Z
Scopes
ÖÖZ `
.
ÖÖ` a
Profile
ÖÖa h
,
ÖÖh i!
OpenIddictConstants
ÜÜ 
.
ÜÜ  
Permissions
ÜÜ  +
.
ÜÜ+ ,
Scopes
ÜÜ, 2
.
ÜÜ2 3
Roles
ÜÜ3 8
}
áá 	
;
áá	 

foreach
ââ 
(
ââ 
var
ââ 
scope
ââ 
in
ââ 
scopes
ââ $
)
ââ$ %
{
ää 	
if
ãã 
(
ãã 
buildInScopes
ãã 
.
ãã 
Contains
ãã &
(
ãã& '
scope
ãã' ,
)
ãã, -
)
ãã- .
{
åå 
application
çç 
.
çç 
Permissions
çç '
.
çç' (
Add
çç( +
(
çç+ ,
scope
çç, 1
)
çç1 2
;
çç2 3
}
éé 
else
èè 
{
êê 
application
ëë 
.
ëë 
Permissions
ëë '
.
ëë' (
Add
ëë( +
(
ëë+ ,!
OpenIddictConstants
ëë, ?
.
ëë? @
Permissions
ëë@ K
.
ëëK L
Prefixes
ëëL T
.
ëëT U
Scope
ëëU Z
+
ëë[ \
scope
ëë] b
)
ëëb c
;
ëëc d
}
íí 
}
ìì 	
if
ïï 

(
ïï 
redirectUri
ïï 
!=
ïï 
null
ïï 
)
ïï  
{
ññ 	
if
óó 
(
óó 
!
óó 
redirectUri
óó 
.
óó 
IsNullOrEmpty
óó *
(
óó* +
)
óó+ ,
)
óó, -
{
òò 
if
ôô 
(
ôô 
!
ôô 
Uri
ôô 
.
ôô 
	TryCreate
ôô "
(
ôô" #
redirectUri
ôô# .
,
ôô. /
UriKind
ôô0 7
.
ôô7 8
Absolute
ôô8 @
,
ôô@ A
out
ôôB E
var
ôôF I
uri
ôôJ M
)
ôôM N
||
ôôO Q
!
ôôR S
uri
ôôS V
.
ôôV W(
IsWellFormedOriginalString
ôôW q
(
ôôq r
)
ôôr s
)
ôôs t
{
öö 
throw
õõ 
new
õõ 
BusinessException
õõ /
(
õõ/ 0
L
õõ0 1
[
õõ1 2
$str
õõ2 F
,
õõF G
redirectUri
õõH S
]
õõS T
)
õõT U
;
õõU V
}
úú 
if
ûû 
(
ûû 
application
ûû 
.
ûû  
RedirectUris
ûû  ,
.
ûû, -
All
ûû- 0
(
ûû0 1
x
ûû1 2
=>
ûû3 5
x
ûû6 7
!=
ûû8 :
uri
ûû; >
)
ûû> ?
)
ûû? @
{
üü 
application
†† 
.
††  
RedirectUris
††  ,
.
††, -
Add
††- 0
(
††0 1
uri
††1 4
)
††4 5
;
††5 6
}
°° 
}
¢¢ 
}
££ 	
if
•• 

(
•• #
postLogoutRedirectUri
•• !
!=
••" $
null
••% )
)
••) *
{
¶¶ 	
if
ßß 
(
ßß 
!
ßß #
postLogoutRedirectUri
ßß &
.
ßß& '
IsNullOrEmpty
ßß' 4
(
ßß4 5
)
ßß5 6
)
ßß6 7
{
®® 
if
©© 
(
©© 
!
©© 
Uri
©© 
.
©© 
	TryCreate
©© "
(
©©" ##
postLogoutRedirectUri
©©# 8
,
©©8 9
UriKind
©©: A
.
©©A B
Absolute
©©B J
,
©©J K
out
©©L O
var
©©P S
uri
©©T W
)
©©W X
||
©©Y [
!
™™ 
uri
™™ 
.
™™ (
IsWellFormedOriginalString
™™ 3
(
™™3 4
)
™™4 5
)
™™5 6
{
´´ 
throw
¨¨ 
new
¨¨ 
BusinessException
¨¨ /
(
¨¨/ 0
L
¨¨0 1
[
¨¨1 2
$str
¨¨2 P
,
¨¨P Q#
postLogoutRedirectUri
¨¨R g
]
¨¨g h
)
¨¨h i
;
¨¨i j
}
≠≠ 
if
ØØ 
(
ØØ 
application
ØØ 
.
ØØ  $
PostLogoutRedirectUris
ØØ  6
.
ØØ6 7
All
ØØ7 :
(
ØØ: ;
x
ØØ; <
=>
ØØ= ?
x
ØØ@ A
!=
ØØB D
uri
ØØE H
)
ØØH I
)
ØØI J
{
∞∞ 
application
±± 
.
±±  $
PostLogoutRedirectUris
±±  6
.
±±6 7
Add
±±7 :
(
±±: ;
uri
±±; >
)
±±> ?
;
±±? @
}
≤≤ 
}
≥≥ 
}
¥¥ 	
if
∂∂ 

(
∂∂ 
permissions
∂∂ 
!=
∂∂ 
null
∂∂ 
)
∂∂  
{
∑∑ 	
await
∏∏ #
_permissionDataSeeder
∏∏ '
.
∏∏' (
	SeedAsync
∏∏( 1
(
∏∏1 2+
ClientPermissionValueProvider
ππ -
.
ππ- .
ProviderName
ππ. :
,
ππ: ;
name
∫∫ 
,
∫∫ 
permissions
ªª 
,
ªª 
null
ºº 
)
ΩΩ 
;
ΩΩ 
}
ææ 	
if
¿¿ 

(
¿¿ 
client
¿¿ 
==
¿¿ 
null
¿¿ 
)
¿¿ 
{
¡¡ 	
await
¬¬ !
_applicationManager
¬¬ %
.
¬¬% &
CreateAsync
¬¬& 1
(
¬¬1 2
application
¬¬2 =
)
¬¬= >
;
¬¬> ?
return
√√ 
;
√√ 
}
ƒƒ 	
if
∆∆ 

(
∆∆ 
!
∆∆ !
HasSameRedirectUris
∆∆  
(
∆∆  !
client
∆∆! '
,
∆∆' (
application
∆∆) 4
)
∆∆4 5
)
∆∆5 6
{
«« 	
client
»» 
.
»» 
RedirectUris
»» 
=
»»  !
JsonSerializer
»»" 0
.
»»0 1
	Serialize
»»1 :
(
»»: ;
application
»»; F
.
»»F G
RedirectUris
»»G S
.
»»S T
Select
»»T Z
(
»»Z [
q
»»[ \
=>
»»] _
q
»»` a
.
»»a b
ToString
»»b j
(
»»j k
)
»»k l
.
»»l m
TrimEnd
»»m t
(
»»t u
$char
»»u x
)
»»x y
)
»»y z
)
»»z {
;
»»{ |
client
…… 
.
…… $
PostLogoutRedirectUris
…… )
=
……* +
JsonSerializer
……, :
.
……: ;
	Serialize
……; D
(
……D E
application
……E P
.
……P Q$
PostLogoutRedirectUris
……Q g
.
……g h
Select
……h n
(
……n o
q
……o p
=>
……q s
q
……t u
.
……u v
ToString
……v ~
(
……~ 
)…… Ä
.……Ä Å
TrimEnd……Å à
(……à â
$char……â å
)……å ç
)……ç é
)……é è
;……è ê
await
ÀÀ !
_applicationManager
ÀÀ %
.
ÀÀ% &
UpdateAsync
ÀÀ& 1
(
ÀÀ1 2
client
ÀÀ2 8
.
ÀÀ8 9
ToModel
ÀÀ9 @
(
ÀÀ@ A
)
ÀÀA B
)
ÀÀB C
;
ÀÀC D
}
ÃÃ 	
if
ŒŒ 

(
ŒŒ 
!
ŒŒ 
HasSameScopes
ŒŒ 
(
ŒŒ 
client
ŒŒ !
,
ŒŒ! "
application
ŒŒ# .
)
ŒŒ. /
)
ŒŒ/ 0
{
œœ 	
client
–– 
.
–– 
Permissions
–– 
=
––  
JsonSerializer
––! /
.
––/ 0
	Serialize
––0 9
(
––9 :
application
––: E
.
––E F
Permissions
––F Q
.
––Q R
Select
––R X
(
––X Y
q
––Y Z
=>
––[ ]
q
––^ _
.
––_ `
ToString
––` h
(
––h i
)
––i j
)
––j k
)
––k l
;
––l m
await
—— !
_applicationManager
—— %
.
——% &
UpdateAsync
——& 1
(
——1 2
client
——2 8
.
——8 9
ToModel
——9 @
(
——@ A
)
——A B
)
——B C
;
——C D
}
““ 	
}
”” 
private
’’ 
bool
’’ !
HasSameRedirectUris
’’ $
(
’’$ %#
OpenIddictApplication
’’% :
existingClient
’’; I
,
’’I J&
AbpApplicationDescriptor
’’K c
application
’’d o
)
’’o p
{
÷÷ 
return
◊◊ 
existingClient
◊◊ 
.
◊◊ 
RedirectUris
◊◊ *
==
◊◊+ -
JsonSerializer
◊◊. <
.
◊◊< =
	Serialize
◊◊= F
(
◊◊F G
application
◊◊G R
.
◊◊R S
RedirectUris
◊◊S _
.
◊◊_ `
Select
◊◊` f
(
◊◊f g
q
◊◊g h
=>
◊◊i k
q
◊◊l m
.
◊◊m n
ToString
◊◊n v
(
◊◊v w
)
◊◊w x
.
◊◊x y
TrimEnd◊◊y Ä
(◊◊Ä Å
$char◊◊Å Ñ
)◊◊Ñ Ö
)◊◊Ö Ü
)◊◊Ü á
;◊◊á à
}
ÿÿ 
private
⁄⁄ 
bool
⁄⁄ 
HasSameScopes
⁄⁄ 
(
⁄⁄ #
OpenIddictApplication
⁄⁄ 4
existingClient
⁄⁄5 C
,
⁄⁄C D&
AbpApplicationDescriptor
⁄⁄E ]
application
⁄⁄^ i
)
⁄⁄i j
{
€€ 
return
‹‹ 
existingClient
‹‹ 
.
‹‹ 
Permissions
‹‹ )
==
‹‹* ,
JsonSerializer
‹‹- ;
.
‹‹; <
	Serialize
‹‹< E
(
‹‹E F
application
‹‹F Q
.
‹‹Q R
Permissions
‹‹R ]
.
‹‹] ^
Select
‹‹^ d
(
‹‹d e
q
‹‹e f
=>
‹‹g i
q
‹‹j k
.
‹‹k l
ToString
‹‹l t
(
‹‹t u
)
‹‹u v
.
‹‹v w
TrimEnd
‹‹w ~
(
‹‹~ 
$char‹‹ Ç
)‹‹Ç É
)‹‹É Ñ
)‹‹Ñ Ö
;‹‹Ö Ü
}
›› 
}ﬁﬁ ¯
wD:\PROJECTS\.NET\ABP Framework\SawaTech assign\aspnet-core\src\SawaTech.PropertyMini.Domain\NearbyPlaces\NearbyPlace.cs
	namespace 	
SawaTech
 
. 
PropertyMini 
.  
NearbyPlaces  ,
{		 
public

 

class

 
NearbyPlace

 
:

  
AuditedAggregateRoot

 3
<

3 4
Guid

4 8
>

8 9
{ 
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
=) *
string+ 1
.1 2
Empty2 7
;7 8
public 
virtual 
ICollection "
<" #
PropertyNearbyPlace# 6
>6 7 
PropertyNearbyPlaces8 L
{M N
getO R
;R S
setT W
;W X
}Y Z
=[ \
[] ^
]^ _
;_ `
} 
} ‹
qD:\PROJECTS\.NET\ABP Framework\SawaTech assign\aspnet-core\src\SawaTech.PropertyMini.Domain\Helpers\JwtSection.cs
	namespace 	
SawaTech
 
. 
PropertyMini 
.  
Helpers  '
{ 
public		 

class		 

JwtSection		 
{

 
public 
string 
? 
Key 
{ 
get  
;  !
set" %
;% &
}' (
public 
string 
? 
Issuer 
{ 
get  #
;# $
set% (
;( )
}* +
public 
string 
? 
Audience 
{  !
get" %
;% &
set' *
;* +
}, -
} 
} é
wD:\PROJECTS\.NET\ABP Framework\SawaTech assign\aspnet-core\src\SawaTech.PropertyMini.Domain\Governorates\Governorate.cs
	namespace 	
SawaTech
 
. 
PropertyMini 
.  
Governorates  ,
{		 
public

 

class

 
Governorate

 
:

  
AuditedAggregateRoot

 3
<

3 4
Guid

4 8
>

8 9
{ 
public 
required 
string 
Name #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
ICollection 
< 
Property #
># $
Property% -
{. /
get0 3
;3 4
set5 8
;8 9
}: ;
=< =
[> ?
]? @
;@ A
} 
} ∆`
ÇD:\PROJECTS\.NET\ABP Framework\SawaTech assign\aspnet-core\src\SawaTech.PropertyMini.Domain\Data\PropertyMiniDbMigrationService.cs
	namespace 	
SawaTech
 
. 
PropertyMini 
.  
Data  $
;$ %
public 
class *
PropertyMiniDbMigrationService +
:, - 
ITransientDependency. B
{ 
public 

ILogger 
< *
PropertyMiniDbMigrationService 1
>1 2
Logger3 9
{: ;
get< ?
;? @
setA D
;D E
}F G
private 
readonly 
IDataSeeder  
_dataSeeder! ,
;, -
private 
readonly 
IEnumerable  
<  !)
IPropertyMiniDbSchemaMigrator! >
>> ?
_dbSchemaMigrators@ R
;R S
public 
*
PropertyMiniDbMigrationService )
() *
IDataSeeder 

dataSeeder 
, 
IEnumerable 
< )
IPropertyMiniDbSchemaMigrator 1
>1 2
dbSchemaMigrators3 D
,D E
ICurrentTenant 
currentTenant $
)$ %
{   
_dataSeeder!! 
=!! 

dataSeeder!!  
;!!  !
_dbSchemaMigrators"" 
="" 
dbSchemaMigrators"" .
;"". /
Logger&& 
=&& 

NullLogger&& 
<&& *
PropertyMiniDbMigrationService&& :
>&&: ;
.&&; <
Instance&&< D
;&&D E
}'' 
public)) 

async)) 
Task)) 
MigrateAsync)) "
())" #
)))# $
{** 
var++ !
initialMigrationAdded++ !
=++" #)
AddInitialMigrationIfNotExist++$ A
(++A B
)++B C
;++C D
if-- 

(-- !
initialMigrationAdded-- !
)--! "
{.. 	
return// 
;// 
}00 	
Logger22 
.22 
LogInformation22 
(22 
$str22 >
)22> ?
;22? @
await44 &
MigrateDatabaseSchemaAsync44 (
(44( )
)44) *
;44* +
await55 
SeedDataAsync55 
(55 
)55 
;55 
Logger77 
.77 
LogInformation77 
(77 
$"77  
$str77  P
"77P Q
)77Q R
;77R S
var;; #
migratedDatabaseSchemas;; #
=;;$ %
new;;& )
HashSet;;* 1
<;;1 2
string;;2 8
>;;8 9
(;;9 :
);;: ;
;;;; <
LoggerTT 
.TT 
LogInformationTT 
(TT 
$strTT O
)TTO P
;TTP Q
LoggerUU 
.UU 
LogInformationUU 
(UU 
$strUU B
)UUB C
;UUC D
}VV 
privateXX 
asyncXX 
TaskXX &
MigrateDatabaseSchemaAsyncXX 1
(XX1 2
)XX2 3
{YY 
foreach]] 
(]] 
var]] 
migrator]] 
in]]  
_dbSchemaMigrators]]! 3
)]]3 4
{^^ 	
await__ 
migrator__ 
.__ 
MigrateAsync__ '
(__' (
)__( )
;__) *
}`` 	
}aa 
privatecc 
asynccc 
Taskcc 
SeedDataAsynccc $
(cc$ %
)cc% &
{dd 
awaitgg 
_dataSeedergg 
.gg 
	SeedAsyncgg #
(gg# $
newgg$ '
DataSeedContextgg( 7
(gg7 8
)gg8 9
.hh 
WithPropertyhh 
(hh '
IdentityDataSeedContributorhh 5
.hh5 6"
AdminEmailPropertyNamehh6 L
,hhL M'
IdentityDataSeedContributorhhN i
.hhi j#
AdminEmailDefaultValue	hhj Ä
)
hhÄ Å
.ii 
WithPropertyii 
(ii '
IdentityDataSeedContributorii 5
.ii5 6%
AdminPasswordPropertyNameii6 O
,iiO P'
IdentityDataSeedContributoriiQ l
.iil m&
AdminPasswordDefaultValue	iim Ü
)
iiÜ á
)jj 	
;jj	 

}kk 
privatemm 
boolmm )
AddInitialMigrationIfNotExistmm .
(mm. /
)mm/ 0
{nn 
tryoo 
{pp 	
ifqq 
(qq 
!qq %
DbMigrationsProjectExistsqq *
(qq* +
)qq+ ,
)qq, -
{rr 
returnss 
falsess 
;ss 
}tt 
}uu 	
catchvv 
(vv 
	Exceptionvv 
)vv 
{ww 	
returnxx 
falsexx 
;xx 
}yy 	
try{{ 
{|| 	
if}} 
(}} 
!}} "
MigrationsFolderExists}} '
(}}' (
)}}( )
)}}) *
{~~ 
AddInitialMigration #
(# $
)$ %
;% &
return
ÄÄ 
true
ÄÄ 
;
ÄÄ 
}
ÅÅ 
else
ÇÇ 
{
ÉÉ 
return
ÑÑ 
false
ÑÑ 
;
ÑÑ 
}
ÖÖ 
}
ÜÜ 	
catch
áá 
(
áá 
	Exception
áá 
e
áá 
)
áá 
{
àà 	
Logger
ââ 
.
ââ 

LogWarning
ââ 
(
ââ 
$str
ââ O
+
ââP Q
e
ââR S
.
ââS T
Message
ââT [
)
ââ[ \
;
ââ\ ]
return
ää 
false
ää 
;
ää 
}
ãã 	
}
åå 
private
éé 
bool
éé '
DbMigrationsProjectExists
éé *
(
éé* +
)
éé+ ,
{
èè 
var
êê '
dbMigrationsProjectFolder
êê %
=
êê& '5
'GetEntityFrameworkCoreProjectFolderPath
êê( O
(
êêO P
)
êêP Q
;
êêQ R
return
íí '
dbMigrationsProjectFolder
íí (
!=
íí) +
null
íí, 0
;
íí0 1
}
ìì 
private
ïï 
bool
ïï $
MigrationsFolderExists
ïï '
(
ïï' (
)
ïï( )
{
ññ 
var
óó '
dbMigrationsProjectFolder
óó %
=
óó& '5
'GetEntityFrameworkCoreProjectFolderPath
óó( O
(
óóO P
)
óóP Q
;
óóQ R
return
òò '
dbMigrationsProjectFolder
òò (
!=
òò) +
null
òò, 0
&&
òò1 3
	Directory
òò4 =
.
òò= >
Exists
òò> D
(
òòD E
Path
òòE I
.
òòI J
Combine
òòJ Q
(
òòQ R'
dbMigrationsProjectFolder
òòR k
,
òòk l
$str
òòm y
)
òòy z
)
òòz {
;
òò{ |
}
ôô 
private
õõ 
void
õõ !
AddInitialMigration
õõ $
(
õõ$ %
)
õõ% &
{
úú 
Logger
ùù 
.
ùù 
LogInformation
ùù 
(
ùù 
$str
ùù =
)
ùù= >
;
ùù> ?
string
üü 
argumentPrefix
üü 
;
üü 
string
†† 
fileName
†† 
;
†† 
if
¢¢ 

(
¢¢  
RuntimeInformation
¢¢ 
.
¢¢ 
IsOSPlatform
¢¢ +
(
¢¢+ ,

OSPlatform
¢¢, 6
.
¢¢6 7
OSX
¢¢7 :
)
¢¢: ;
||
¢¢< > 
RuntimeInformation
¢¢? Q
.
¢¢Q R
IsOSPlatform
¢¢R ^
(
¢¢^ _

OSPlatform
¢¢_ i
.
¢¢i j
Linux
¢¢j o
)
¢¢o p
)
¢¢p q
{
££ 	
argumentPrefix
§§ 
=
§§ 
$str
§§ !
;
§§! "
fileName
•• 
=
•• 
$str
•• "
;
••" #
}
¶¶ 	
else
ßß 
{
®® 	
argumentPrefix
©© 
=
©© 
$str
©© !
;
©©! "
fileName
™™ 
=
™™ 
$str
™™  
;
™™  !
}
´´ 	
var
≠≠ 
procStartInfo
≠≠ 
=
≠≠ 
new
≠≠ 
ProcessStartInfo
≠≠  0
(
≠≠0 1
fileName
≠≠1 9
,
≠≠9 :
$"
ÆÆ 
{
ÆÆ 
argumentPrefix
ÆÆ 
}
ÆÆ 
$str
ÆÆ I
{
ÆÆI J5
'GetEntityFrameworkCoreProjectFolderPath
ÆÆJ q
(
ÆÆq r
)
ÆÆr s
}
ÆÆs t
$str
ÆÆt x
"
ÆÆx y
)
ØØ 	
;
ØØ	 

try
±± 
{
≤≤ 	
Process
≥≥ 
.
≥≥ 
Start
≥≥ 
(
≥≥ 
procStartInfo
≥≥ '
)
≥≥' (
;
≥≥( )
}
¥¥ 	
catch
µµ 
(
µµ 
	Exception
µµ 
)
µµ 
{
∂∂ 	
throw
∑∑ 
new
∑∑ 
	Exception
∑∑ 
(
∑∑  
$str
∑∑  9
)
∑∑9 :
;
∑∑: ;
}
∏∏ 	
}
ππ 
private
ªª 
string
ªª 
?
ªª 5
'GetEntityFrameworkCoreProjectFolderPath
ªª ;
(
ªª; <
)
ªª< =
{
ºº 
var
ΩΩ 
slnDirectoryPath
ΩΩ 
=
ΩΩ &
GetSolutionDirectoryPath
ΩΩ 7
(
ΩΩ7 8
)
ΩΩ8 9
;
ΩΩ9 :
if
øø 

(
øø 
slnDirectoryPath
øø 
==
øø 
null
øø  $
)
øø$ %
{
¿¿ 	
throw
¡¡ 
new
¡¡ 
	Exception
¡¡ 
(
¡¡  
$str
¡¡  <
)
¡¡< =
;
¡¡= >
}
¬¬ 	
var
ƒƒ 
srcDirectoryPath
ƒƒ 
=
ƒƒ 
Path
ƒƒ #
.
ƒƒ# $
Combine
ƒƒ$ +
(
ƒƒ+ ,
slnDirectoryPath
ƒƒ, <
,
ƒƒ< =
$str
ƒƒ> C
)
ƒƒC D
;
ƒƒD E
return
∆∆ 
	Directory
∆∆ 
.
∆∆ 
GetDirectories
∆∆ '
(
∆∆' (
srcDirectoryPath
∆∆( 8
)
∆∆8 9
.
«« 
FirstOrDefault
«« 
(
«« 
d
«« 
=>
««  
d
««! "
.
««" #
EndsWith
««# +
(
««+ ,
$str
««, B
)
««B C
)
««C D
;
««D E
}
»» 
private
   
string
   
?
   &
GetSolutionDirectoryPath
   ,
(
  , -
)
  - .
{
ÀÀ 
var
ÃÃ 
currentDirectory
ÃÃ 
=
ÃÃ 
new
ÃÃ "
DirectoryInfo
ÃÃ# 0
(
ÃÃ0 1
	Directory
ÃÃ1 :
.
ÃÃ: ;!
GetCurrentDirectory
ÃÃ; N
(
ÃÃN O
)
ÃÃO P
)
ÃÃP Q
;
ÃÃQ R
while
ŒŒ 
(
ŒŒ 
currentDirectory
ŒŒ 
!=
ŒŒ  "
null
ŒŒ# '
&&
ŒŒ( *
	Directory
ŒŒ+ 4
.
ŒŒ4 5
	GetParent
ŒŒ5 >
(
ŒŒ> ?
currentDirectory
ŒŒ? O
.
ŒŒO P
FullName
ŒŒP X
)
ŒŒX Y
!=
ŒŒZ \
null
ŒŒ] a
)
ŒŒa b
{
œœ 	
currentDirectory
–– 
=
–– 
	Directory
–– (
.
––( )
	GetParent
––) 2
(
––2 3
currentDirectory
––3 C
.
––C D
FullName
––D L
)
––L M
;
––M N
if
““ 
(
““ 
currentDirectory
““  
!=
““! #
null
““$ (
&&
““) +
	Directory
““, 5
.
““5 6
GetFiles
““6 >
(
““> ?
currentDirectory
““? O
.
““O P
FullName
““P X
)
““X Y
.
““Y Z
FirstOrDefault
““Z h
(
““h i
f
““i j
=>
““k m
f
““n o
.
““o p
EndsWith
““p x
(
““x y
$str
““y 
)““ Ä
)““Ä Å
!=““Ç Ñ
null““Ö â
)““â ä
{
”” 
return
‘‘ 
currentDirectory
‘‘ '
.
‘‘' (
FullName
‘‘( 0
;
‘‘0 1
}
’’ 
}
÷÷ 	
return
ÿÿ 
null
ÿÿ 
;
ÿÿ 
}
ŸŸ 
}⁄⁄ æ
ÑD:\PROJECTS\.NET\ABP Framework\SawaTech assign\aspnet-core\src\SawaTech.PropertyMini.Domain\Data\NullPropertyMiniDbSchemaMigrator.cs
	namespace 	
SawaTech
 
. 
PropertyMini 
.  
Data  $
;$ %
public		 
class		 ,
 NullPropertyMiniDbSchemaMigrator		 -
:		. /)
IPropertyMiniDbSchemaMigrator		0 M
,		M N 
ITransientDependency		O c
{

 
public 

Task 
MigrateAsync 
( 
) 
{ 
return 
Task 
. 
CompletedTask !
;! "
} 
} œ
ÅD:\PROJECTS\.NET\ABP Framework\SawaTech assign\aspnet-core\src\SawaTech.PropertyMini.Domain\Data\IPropertyMiniDbSchemaMigrator.cs
	namespace 	
SawaTech
 
. 
PropertyMini 
.  
Data  $
;$ %
public 
	interface )
IPropertyMiniDbSchemaMigrator .
{ 
Task 
MigrateAsync	 
( 
) 
; 
} ú
pD:\PROJECTS\.NET\ABP Framework\SawaTech assign\aspnet-core\src\SawaTech.PropertyMini.Domain\Amenities\Amenity.cs
	namespace 	
SawaTech
 
. 
PropertyMini 
.  
	Amenities  )
;) *
public 
class 
Amenity 
:  
AuditedAggregateRoot +
<+ ,
Guid, 0
>0 1
{ 
public 

string 
Name 
{ 
get 
; 
set !
;! "
}# $
=% &
string' -
.- .
Empty. 3
;3 4
}		 Å	
pD:\PROJECTS\.NET\ABP Framework\SawaTech assign\aspnet-core\src\SawaTech.PropertyMini.Domain\Addresses\Address.cs
	namespace 	
SawaTech
 
. 
PropertyMini 
.  
	Addresses  )
;) *
public 
class 
Address 
:  
AuditedAggregateRoot +
<+ ,
Guid, 0
>0 1
{ 
public 

string 
Governorate 
{ 
get  #
;# $
set% (
;( )
}* +
=, -
string. 4
.4 5
Empty5 :
;: ;
public		 

string		 
District		 
{		 
get		  
;		  !
set		" %
;		% &
}		' (
=		) *
string		+ 1
.		1 2
Empty		2 7
;		7 8
public

 

string

 
Street

 
{

 
get

 
;

 
set

  #
;

# $
}

% &
=

' (
string

) /
.

/ 0
Empty

0 5
;

5 6
} 