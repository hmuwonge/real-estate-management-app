�
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
} �
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
} �
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
}		 �
�D:\PROJECTS\.NET\ABP Framework\SawaTech assign\aspnet-core\src\SawaTech.PropertyMini.Domain\Settings\PropertyMiniSettingDefinitionProvider.cs
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
} �7
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
}gg �
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
} �	
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
} �
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
}		 �
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
} �
�D:\PROJECTS\.NET\ABP Framework\SawaTech assign\aspnet-core\src\SawaTech.PropertyMini.Domain\PropertyEntities\PropertyOwnerDto.cs
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
} �	
�D:\PROJECTS\.NET\ABP Framework\SawaTech assign\aspnet-core\src\SawaTech.PropertyMini.Domain\PropertyEntities\PropertyNearbyPlace.cs
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
} �

�D:\PROJECTS\.NET\ABP Framework\SawaTech assign\aspnet-core\src\SawaTech.PropertyMini.Domain\PropertyEntities\PropertyImageDto.cs
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
} �	
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
} �
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
} �	
�D:\PROJECTS\.NET\ABP Framework\SawaTech assign\aspnet-core\src\SawaTech.PropertyMini.Domain\PropertyEntities\PropertyAmenity .cs
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
} �2
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
}:: �
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
} �

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
} �
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
}@@ �
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
]G H��
�D:\PROJECTS\.NET\ABP Framework\SawaTech assign\aspnet-core\src\SawaTech.PropertyMini.Domain\OpenIddict\OpenIddictDataSeedContributor.cs
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
�� 
private
�� 
async
�� 
Task
�� $
CreateApplicationAsync
�� -
(
��- .
[
�� 	
NotNull
��	 
]
�� 
string
�� 
name
�� 
,
�� 
[
�� 	
NotNull
��	 
]
�� 
string
�� 
type
�� 
,
�� 
[
�� 	
NotNull
��	 
]
�� 
string
�� 
consentType
�� $
,
��$ %
string
�� 
displayName
�� 
,
�� 
string
�� 
?
�� 
secret
�� 
,
�� 
List
�� 
<
�� 
string
�� 
>
�� 

grantTypes
�� 
,
��  
List
�� 
<
�� 
string
�� 
>
�� 
scopes
�� 
,
�� 
string
�� 
?
�� 
	clientUri
�� 
=
�� 
null
��  
,
��  !
string
�� 
?
�� 
redirectUri
�� 
=
�� 
null
�� "
,
��" #
string
�� 
?
�� #
postLogoutRedirectUri
�� %
=
��& '
null
��( ,
,
��, -
List
�� 
<
�� 
string
�� 
>
�� 
?
�� 
permissions
�� !
=
��" #
null
��$ (
)
��( )
{
�� 
if
�� 

(
�� 
!
�� 
string
�� 
.
�� 
IsNullOrEmpty
�� !
(
��! "
secret
��" (
)
��( )
&&
��* ,
string
��- 3
.
��3 4
Equals
��4 :
(
��: ;
type
��; ?
,
��? @!
OpenIddictConstants
��A T
.
��T U
ClientTypes
��U `
.
��` a
Public
��a g
,
��g h
StringComparison
��  
.
��  !
OrdinalIgnoreCase
��! 2
)
��2 3
)
��3 4
{
�� 	
throw
�� 
new
�� 
BusinessException
�� '
(
��' (
L
��( )
[
��) *
$str
��* W
]
��W X
)
��X Y
;
��Y Z
}
�� 	
if
�� 

(
�� 
string
�� 
.
�� 
IsNullOrEmpty
��  
(
��  !
secret
��! '
)
��' (
&&
��) +
string
��, 2
.
��2 3
Equals
��3 9
(
��9 :
type
��: >
,
��> ?!
OpenIddictConstants
��@ S
.
��S T
ClientTypes
��T _
.
��_ `
Confidential
��` l
,
��l m
StringComparison
��  
.
��  !
OrdinalIgnoreCase
��! 2
)
��2 3
)
��3 4
{
�� 	
throw
�� 
new
�� 
BusinessException
�� '
(
��' (
L
��( )
[
��) *
$str
��* `
]
��` a
)
��a b
;
��b c
}
�� 	
var
�� 
client
�� 
=
�� 
await
�� .
 _openIddictApplicationRepository
�� ;
.
��; <!
FindByClientIdAsync
��< O
(
��O P
name
��P T
)
��T U
;
��U V
var
�� 
application
�� 
=
�� 
new
�� &
AbpApplicationDescriptor
�� 6
{
��7 8
ClientId
�� 
=
�� 
name
�� 
,
�� 

ClientType
�� 
=
�� 
type
�� 
,
�� 
ClientSecret
�� 
=
�� 
secret
�� !
,
��! "
ConsentType
�� 
=
�� 
consentType
�� %
,
��% &
DisplayName
�� 
=
�� 
displayName
�� %
,
��% &
	ClientUri
�� 
=
�� 
	clientUri
�� !
,
��! "
}
�� 	
;
��	 

Check
�� 
.
�� 
NotNullOrEmpty
�� 
(
�� 

grantTypes
�� '
,
��' (
nameof
��) /
(
��/ 0

grantTypes
��0 :
)
��: ;
)
��; <
;
��< =
Check
�� 
.
�� 
NotNullOrEmpty
�� 
(
�� 
scopes
�� #
,
��# $
nameof
��% +
(
��+ ,
scopes
��, 2
)
��2 3
)
��3 4
;
��4 5
if
�� 

(
�� 
new
�� 
[
�� 
]
�� 
{
�� !
OpenIddictConstants
�� '
.
��' (

GrantTypes
��( 2
.
��2 3
AuthorizationCode
��3 D
,
��D E!
OpenIddictConstants
��F Y
.
��Y Z

GrantTypes
��Z d
.
��d e
Implicit
��e m
}
��n o
.
��o p
All
��p s
(
��s t

grantTypes
�� 
.
�� 
Contains
�� #
)
��# $
)
��$ %
{
�� 	
application
�� 
.
�� 
Permissions
�� #
.
��# $
Add
��$ '
(
��' (!
OpenIddictConstants
��( ;
.
��; <
Permissions
��< G
.
��G H
ResponseTypes
��H U
.
��U V
CodeIdToken
��V a
)
��a b
;
��b c
if
�� 
(
�� 
string
�� 
.
�� 
Equals
�� 
(
�� 
type
�� "
,
��" #!
OpenIddictConstants
��$ 7
.
��7 8
ClientTypes
��8 C
.
��C D
Public
��D J
,
��J K
StringComparison
��L \
.
��\ ]
OrdinalIgnoreCase
��] n
)
��n o
)
��o p
{
�� 
application
�� 
.
�� 
Permissions
�� '
.
��' (
Add
��( +
(
��+ ,!
OpenIddictConstants
��, ?
.
��? @
Permissions
��@ K
.
��K L
ResponseTypes
��L Y
.
��Y Z
CodeIdTokenToken
��Z j
)
��j k
;
��k l
application
�� 
.
�� 
Permissions
�� '
.
��' (
Add
��( +
(
��+ ,!
OpenIddictConstants
��, ?
.
��? @
Permissions
��@ K
.
��K L
ResponseTypes
��L Y
.
��Y Z
	CodeToken
��Z c
)
��c d
;
��d e
}
�� 
}
�� 	
if
�� 

(
�� 
!
�� 
redirectUri
�� 
.
��  
IsNullOrWhiteSpace
�� +
(
��+ ,
)
��, -
||
��. 0
!
��1 2#
postLogoutRedirectUri
��2 G
.
��G H 
IsNullOrWhiteSpace
��H Z
(
��Z [
)
��[ \
)
��\ ]
{
�� 	
application
�� 
.
�� 
Permissions
�� #
.
��# $
Add
��$ '
(
��' (!
OpenIddictConstants
��( ;
.
��; <
Permissions
��< G
.
��G H
	Endpoints
��H Q
.
��Q R

EndSession
��R \
)
��\ ]
;
��] ^
}
�� 	
var
�� 
buildInGrantTypes
�� 
=
�� 
new
��  #
[
��# $
]
��$ %
{
��& '!
OpenIddictConstants
�� 
.
��  

GrantTypes
��  *
.
��* +
Implicit
��+ 3
,
��3 4!
OpenIddictConstants
��5 H
.
��H I

GrantTypes
��I S
.
��S T
Password
��T \
,
��\ ]!
OpenIddictConstants
�� 
.
��  

GrantTypes
��  *
.
��* +
AuthorizationCode
��+ <
,
��< =!
OpenIddictConstants
��> Q
.
��Q R

GrantTypes
��R \
.
��\ ]
ClientCredentials
��] n
,
��n o!
OpenIddictConstants
�� 
.
��  

GrantTypes
��  *
.
��* +

DeviceCode
��+ 5
,
��5 6!
OpenIddictConstants
��7 J
.
��J K

GrantTypes
��K U
.
��U V
RefreshToken
��V b
}
�� 	
;
��	 

foreach
�� 
(
�� 
var
�� 
	grantType
�� 
in
�� !

grantTypes
��" ,
)
��, -
{
�� 	
if
�� 
(
�� 
	grantType
�� 
==
�� !
OpenIddictConstants
�� 0
.
��0 1

GrantTypes
��1 ;
.
��; <
AuthorizationCode
��< M
)
��M N
{
�� 
application
�� 
.
�� 
Permissions
�� '
.
��' (
Add
��( +
(
��+ ,!
OpenIddictConstants
��, ?
.
��? @
Permissions
��@ K
.
��K L

GrantTypes
��L V
.
��V W
AuthorizationCode
��W h
)
��h i
;
��i j
application
�� 
.
�� 
Permissions
�� '
.
��' (
Add
��( +
(
��+ ,!
OpenIddictConstants
��, ?
.
��? @
Permissions
��@ K
.
��K L
ResponseTypes
��L Y
.
��Y Z
Code
��Z ^
)
��^ _
;
��_ `
}
�� 
if
�� 
(
�� 
	grantType
�� 
==
�� !
OpenIddictConstants
�� 0
.
��0 1

GrantTypes
��1 ;
.
��; <
AuthorizationCode
��< M
||
��N P
	grantType
�� 
==
�� !
OpenIddictConstants
�� 0
.
��0 1

GrantTypes
��1 ;
.
��; <
Implicit
��< D
)
��D E
{
�� 
application
�� 
.
�� 
Permissions
�� '
.
��' (
Add
��( +
(
��+ ,!
OpenIddictConstants
��, ?
.
��? @
Permissions
��@ K
.
��K L
	Endpoints
��L U
.
��U V
Authorization
��V c
)
��c d
;
��d e
}
�� 
if
�� 
(
�� 
	grantType
�� 
==
�� !
OpenIddictConstants
�� 0
.
��0 1

GrantTypes
��1 ;
.
��; <
AuthorizationCode
��< M
||
��N P
	grantType
�� 
==
�� !
OpenIddictConstants
�� 0
.
��0 1

GrantTypes
��1 ;
.
��; <
ClientCredentials
��< M
||
��N P
	grantType
�� 
==
�� !
OpenIddictConstants
�� 0
.
��0 1

GrantTypes
��1 ;
.
��; <
Password
��< D
||
��E G
	grantType
�� 
==
�� !
OpenIddictConstants
�� 0
.
��0 1

GrantTypes
��1 ;
.
��; <
RefreshToken
��< H
||
��I K
	grantType
�� 
==
�� !
OpenIddictConstants
�� 0
.
��0 1

GrantTypes
��1 ;
.
��; <

DeviceCode
��< F
)
��F G
{
�� 
application
�� 
.
�� 
Permissions
�� '
.
��' (
Add
��( +
(
��+ ,!
OpenIddictConstants
��, ?
.
��? @
Permissions
��@ K
.
��K L
	Endpoints
��L U
.
��U V
Token
��V [
)
��[ \
;
��\ ]
application
�� 
.
�� 
Permissions
�� '
.
��' (
Add
��( +
(
��+ ,!
OpenIddictConstants
��, ?
.
��? @
Permissions
��@ K
.
��K L
	Endpoints
��L U
.
��U V

Revocation
��V `
)
��` a
;
��a b
application
�� 
.
�� 
Permissions
�� '
.
��' (
Add
��( +
(
��+ ,!
OpenIddictConstants
��, ?
.
��? @
Permissions
��@ K
.
��K L
	Endpoints
��L U
.
��U V
Introspection
��V c
)
��c d
;
��d e
}
�� 
if
�� 
(
�� 
	grantType
�� 
==
�� !
OpenIddictConstants
�� 0
.
��0 1

GrantTypes
��1 ;
.
��; <
ClientCredentials
��< M
)
��M N
{
�� 
application
�� 
.
�� 
Permissions
�� '
.
��' (
Add
��( +
(
��+ ,!
OpenIddictConstants
��, ?
.
��? @
Permissions
��@ K
.
��K L

GrantTypes
��L V
.
��V W
ClientCredentials
��W h
)
��h i
;
��i j
}
�� 
if
�� 
(
�� 
	grantType
�� 
==
�� !
OpenIddictConstants
�� 0
.
��0 1

GrantTypes
��1 ;
.
��; <
Implicit
��< D
)
��D E
{
�� 
application
�� 
.
�� 
Permissions
�� '
.
��' (
Add
��( +
(
��+ ,!
OpenIddictConstants
��, ?
.
��? @
Permissions
��@ K
.
��K L

GrantTypes
��L V
.
��V W
Implicit
��W _
)
��_ `
;
��` a
}
�� 
if
�� 
(
�� 
	grantType
�� 
==
�� !
OpenIddictConstants
�� 0
.
��0 1

GrantTypes
��1 ;
.
��; <
Password
��< D
)
��D E
{
�� 
application
�� 
.
�� 
Permissions
�� '
.
��' (
Add
��( +
(
��+ ,!
OpenIddictConstants
��, ?
.
��? @
Permissions
��@ K
.
��K L

GrantTypes
��L V
.
��V W
Password
��W _
)
��_ `
;
��` a
}
�� 
if
�� 
(
�� 
	grantType
�� 
==
�� !
OpenIddictConstants
�� 0
.
��0 1

GrantTypes
��1 ;
.
��; <
RefreshToken
��< H
)
��H I
{
�� 
application
�� 
.
�� 
Permissions
�� '
.
��' (
Add
��( +
(
��+ ,!
OpenIddictConstants
��, ?
.
��? @
Permissions
��@ K
.
��K L

GrantTypes
��L V
.
��V W
RefreshToken
��W c
)
��c d
;
��d e
}
�� 
if
�� 
(
�� 
	grantType
�� 
==
�� !
OpenIddictConstants
�� 0
.
��0 1

GrantTypes
��1 ;
.
��; <

DeviceCode
��< F
)
��F G
{
�� 
application
�� 
.
�� 
Permissions
�� '
.
��' (
Add
��( +
(
��+ ,!
OpenIddictConstants
��, ?
.
��? @
Permissions
��@ K
.
��K L

GrantTypes
��L V
.
��V W

DeviceCode
��W a
)
��a b
;
��b c
application
�� 
.
�� 
Permissions
�� '
.
��' (
Add
��( +
(
��+ ,!
OpenIddictConstants
��, ?
.
��? @
Permissions
��@ K
.
��K L
	Endpoints
��L U
.
��U V!
DeviceAuthorization
��V i
)
��i j
;
��j k
}
�� 
if
�� 
(
�� 
	grantType
�� 
==
�� !
OpenIddictConstants
�� 0
.
��0 1

GrantTypes
��1 ;
.
��; <
Implicit
��< D
)
��D E
{
�� 
application
�� 
.
�� 
Permissions
�� '
.
��' (
Add
��( +
(
��+ ,!
OpenIddictConstants
��, ?
.
��? @
Permissions
��@ K
.
��K L
ResponseTypes
��L Y
.
��Y Z
IdToken
��Z a
)
��a b
;
��b c
if
�� 
(
�� 
string
�� 
.
�� 
Equals
�� !
(
��! "
type
��" &
,
��& '!
OpenIddictConstants
��( ;
.
��; <
ClientTypes
��< G
.
��G H
Public
��H N
,
��N O
StringComparison
��P `
.
��` a
OrdinalIgnoreCase
��a r
)
��r s
)
��s t
{
�� 
application
�� 
.
��  
Permissions
��  +
.
��+ ,
Add
��, /
(
��/ 0!
OpenIddictConstants
��0 C
.
��C D
Permissions
��D O
.
��O P
ResponseTypes
��P ]
.
��] ^
IdTokenToken
��^ j
)
��j k
;
��k l
application
�� 
.
��  
Permissions
��  +
.
��+ ,
Add
��, /
(
��/ 0!
OpenIddictConstants
��0 C
.
��C D
Permissions
��D O
.
��O P
ResponseTypes
��P ]
.
��] ^
Token
��^ c
)
��c d
;
��d e
}
�� 
}
�� 
if
�� 
(
�� 
!
�� 
buildInGrantTypes
�� "
.
��" #
Contains
��# +
(
��+ ,
	grantType
��, 5
)
��5 6
)
��6 7
{
�� 
application
�� 
.
�� 
Permissions
�� '
.
��' (
Add
��( +
(
��+ ,!
OpenIddictConstants
��, ?
.
��? @
Permissions
��@ K
.
��K L
Prefixes
��L T
.
��T U
	GrantType
��U ^
+
��_ `
	grantType
��a j
)
��j k
;
��k l
}
�� 
}
�� 	
var
�� 
buildInScopes
�� 
=
�� 
new
�� 
[
��  
]
��  !
{
��" #!
OpenIddictConstants
�� 
.
��  
Permissions
��  +
.
��+ ,
Scopes
��, 2
.
��2 3
Address
��3 :
,
��: ;!
OpenIddictConstants
��< O
.
��O P
Permissions
��P [
.
��[ \
Scopes
��\ b
.
��b c
Email
��c h
,
��h i!
OpenIddictConstants
�� 
.
��  
Permissions
��  +
.
��+ ,
Scopes
��, 2
.
��2 3
Phone
��3 8
,
��8 9!
OpenIddictConstants
��: M
.
��M N
Permissions
��N Y
.
��Y Z
Scopes
��Z `
.
��` a
Profile
��a h
,
��h i!
OpenIddictConstants
�� 
.
��  
Permissions
��  +
.
��+ ,
Scopes
��, 2
.
��2 3
Roles
��3 8
}
�� 	
;
��	 

foreach
�� 
(
�� 
var
�� 
scope
�� 
in
�� 
scopes
�� $
)
��$ %
{
�� 	
if
�� 
(
�� 
buildInScopes
�� 
.
�� 
Contains
�� &
(
��& '
scope
��' ,
)
��, -
)
��- .
{
�� 
application
�� 
.
�� 
Permissions
�� '
.
��' (
Add
��( +
(
��+ ,
scope
��, 1
)
��1 2
;
��2 3
}
�� 
else
�� 
{
�� 
application
�� 
.
�� 
Permissions
�� '
.
��' (
Add
��( +
(
��+ ,!
OpenIddictConstants
��, ?
.
��? @
Permissions
��@ K
.
��K L
Prefixes
��L T
.
��T U
Scope
��U Z
+
��[ \
scope
��] b
)
��b c
;
��c d
}
�� 
}
�� 	
if
�� 

(
�� 
redirectUri
�� 
!=
�� 
null
�� 
)
��  
{
�� 	
if
�� 
(
�� 
!
�� 
redirectUri
�� 
.
�� 
IsNullOrEmpty
�� *
(
��* +
)
��+ ,
)
��, -
{
�� 
if
�� 
(
�� 
!
�� 
Uri
�� 
.
�� 
	TryCreate
�� "
(
��" #
redirectUri
��# .
,
��. /
UriKind
��0 7
.
��7 8
Absolute
��8 @
,
��@ A
out
��B E
var
��F I
uri
��J M
)
��M N
||
��O Q
!
��R S
uri
��S V
.
��V W(
IsWellFormedOriginalString
��W q
(
��q r
)
��r s
)
��s t
{
�� 
throw
�� 
new
�� 
BusinessException
�� /
(
��/ 0
L
��0 1
[
��1 2
$str
��2 F
,
��F G
redirectUri
��H S
]
��S T
)
��T U
;
��U V
}
�� 
if
�� 
(
�� 
application
�� 
.
��  
RedirectUris
��  ,
.
��, -
All
��- 0
(
��0 1
x
��1 2
=>
��3 5
x
��6 7
!=
��8 :
uri
��; >
)
��> ?
)
��? @
{
�� 
application
�� 
.
��  
RedirectUris
��  ,
.
��, -
Add
��- 0
(
��0 1
uri
��1 4
)
��4 5
;
��5 6
}
�� 
}
�� 
}
�� 	
if
�� 

(
�� #
postLogoutRedirectUri
�� !
!=
��" $
null
��% )
)
��) *
{
�� 	
if
�� 
(
�� 
!
�� #
postLogoutRedirectUri
�� &
.
��& '
IsNullOrEmpty
��' 4
(
��4 5
)
��5 6
)
��6 7
{
�� 
if
�� 
(
�� 
!
�� 
Uri
�� 
.
�� 
	TryCreate
�� "
(
��" ##
postLogoutRedirectUri
��# 8
,
��8 9
UriKind
��: A
.
��A B
Absolute
��B J
,
��J K
out
��L O
var
��P S
uri
��T W
)
��W X
||
��Y [
!
�� 
uri
�� 
.
�� (
IsWellFormedOriginalString
�� 3
(
��3 4
)
��4 5
)
��5 6
{
�� 
throw
�� 
new
�� 
BusinessException
�� /
(
��/ 0
L
��0 1
[
��1 2
$str
��2 P
,
��P Q#
postLogoutRedirectUri
��R g
]
��g h
)
��h i
;
��i j
}
�� 
if
�� 
(
�� 
application
�� 
.
��  $
PostLogoutRedirectUris
��  6
.
��6 7
All
��7 :
(
��: ;
x
��; <
=>
��= ?
x
��@ A
!=
��B D
uri
��E H
)
��H I
)
��I J
{
�� 
application
�� 
.
��  $
PostLogoutRedirectUris
��  6
.
��6 7
Add
��7 :
(
��: ;
uri
��; >
)
��> ?
;
��? @
}
�� 
}
�� 
}
�� 	
if
�� 

(
�� 
permissions
�� 
!=
�� 
null
�� 
)
��  
{
�� 	
await
�� #
_permissionDataSeeder
�� '
.
��' (
	SeedAsync
��( 1
(
��1 2+
ClientPermissionValueProvider
�� -
.
��- .
ProviderName
��. :
,
��: ;
name
�� 
,
�� 
permissions
�� 
,
�� 
null
�� 
)
�� 
;
�� 
}
�� 	
if
�� 

(
�� 
client
�� 
==
�� 
null
�� 
)
�� 
{
�� 	
await
�� !
_applicationManager
�� %
.
��% &
CreateAsync
��& 1
(
��1 2
application
��2 =
)
��= >
;
��> ?
return
�� 
;
�� 
}
�� 	
if
�� 

(
�� 
!
�� !
HasSameRedirectUris
��  
(
��  !
client
��! '
,
��' (
application
��) 4
)
��4 5
)
��5 6
{
�� 	
client
�� 
.
�� 
RedirectUris
�� 
=
��  !
JsonSerializer
��" 0
.
��0 1
	Serialize
��1 :
(
��: ;
application
��; F
.
��F G
RedirectUris
��G S
.
��S T
Select
��T Z
(
��Z [
q
��[ \
=>
��] _
q
��` a
.
��a b
ToString
��b j
(
��j k
)
��k l
.
��l m
TrimEnd
��m t
(
��t u
$char
��u x
)
��x y
)
��y z
)
��z {
;
��{ |
client
�� 
.
�� $
PostLogoutRedirectUris
�� )
=
��* +
JsonSerializer
��, :
.
��: ;
	Serialize
��; D
(
��D E
application
��E P
.
��P Q$
PostLogoutRedirectUris
��Q g
.
��g h
Select
��h n
(
��n o
q
��o p
=>
��q s
q
��t u
.
��u v
ToString
��v ~
(
��~ 
)�� �
.��� �
TrimEnd��� �
(��� �
$char��� �
)��� �
)��� �
)��� �
;��� �
await
�� !
_applicationManager
�� %
.
��% &
UpdateAsync
��& 1
(
��1 2
client
��2 8
.
��8 9
ToModel
��9 @
(
��@ A
)
��A B
)
��B C
;
��C D
}
�� 	
if
�� 

(
�� 
!
�� 
HasSameScopes
�� 
(
�� 
client
�� !
,
��! "
application
��# .
)
��. /
)
��/ 0
{
�� 	
client
�� 
.
�� 
Permissions
�� 
=
��  
JsonSerializer
��! /
.
��/ 0
	Serialize
��0 9
(
��9 :
application
��: E
.
��E F
Permissions
��F Q
.
��Q R
Select
��R X
(
��X Y
q
��Y Z
=>
��[ ]
q
��^ _
.
��_ `
ToString
��` h
(
��h i
)
��i j
)
��j k
)
��k l
;
��l m
await
�� !
_applicationManager
�� %
.
��% &
UpdateAsync
��& 1
(
��1 2
client
��2 8
.
��8 9
ToModel
��9 @
(
��@ A
)
��A B
)
��B C
;
��C D
}
�� 	
}
�� 
private
�� 
bool
�� !
HasSameRedirectUris
�� $
(
��$ %#
OpenIddictApplication
��% :
existingClient
��; I
,
��I J&
AbpApplicationDescriptor
��K c
application
��d o
)
��o p
{
�� 
return
�� 
existingClient
�� 
.
�� 
RedirectUris
�� *
==
��+ -
JsonSerializer
��. <
.
��< =
	Serialize
��= F
(
��F G
application
��G R
.
��R S
RedirectUris
��S _
.
��_ `
Select
��` f
(
��f g
q
��g h
=>
��i k
q
��l m
.
��m n
ToString
��n v
(
��v w
)
��w x
.
��x y
TrimEnd��y �
(��� �
$char��� �
)��� �
)��� �
)��� �
;��� �
}
�� 
private
�� 
bool
�� 
HasSameScopes
�� 
(
�� #
OpenIddictApplication
�� 4
existingClient
��5 C
,
��C D&
AbpApplicationDescriptor
��E ]
application
��^ i
)
��i j
{
�� 
return
�� 
existingClient
�� 
.
�� 
Permissions
�� )
==
��* ,
JsonSerializer
��- ;
.
��; <
	Serialize
��< E
(
��E F
application
��F Q
.
��Q R
Permissions
��R ]
.
��] ^
Select
��^ d
(
��d e
q
��e f
=>
��g i
q
��j k
.
��k l
ToString
��l t
(
��t u
)
��u v
.
��v w
TrimEnd
��w ~
(
��~ 
$char�� �
)��� �
)��� �
)��� �
;��� �
}
�� 
}�� �
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
} �
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
} �
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
} �`
�D:\PROJECTS\.NET\ABP Framework\SawaTech assign\aspnet-core\src\SawaTech.PropertyMini.Domain\Data\PropertyMiniDbMigrationService.cs
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
AdminEmailDefaultValue	hhj �
)
hh� �
.ii 
WithPropertyii 
(ii '
IdentityDataSeedContributorii 5
.ii5 6%
AdminPasswordPropertyNameii6 O
,iiO P'
IdentityDataSeedContributoriiQ l
.iil m&
AdminPasswordDefaultValue	iim �
)
ii� �
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
�� 
true
�� 
;
�� 
}
�� 
else
�� 
{
�� 
return
�� 
false
�� 
;
�� 
}
�� 
}
�� 	
catch
�� 
(
�� 
	Exception
�� 
e
�� 
)
�� 
{
�� 	
Logger
�� 
.
�� 

LogWarning
�� 
(
�� 
$str
�� O
+
��P Q
e
��R S
.
��S T
Message
��T [
)
��[ \
;
��\ ]
return
�� 
false
�� 
;
�� 
}
�� 	
}
�� 
private
�� 
bool
�� '
DbMigrationsProjectExists
�� *
(
��* +
)
��+ ,
{
�� 
var
�� '
dbMigrationsProjectFolder
�� %
=
��& '5
'GetEntityFrameworkCoreProjectFolderPath
��( O
(
��O P
)
��P Q
;
��Q R
return
�� '
dbMigrationsProjectFolder
�� (
!=
��) +
null
��, 0
;
��0 1
}
�� 
private
�� 
bool
�� $
MigrationsFolderExists
�� '
(
��' (
)
��( )
{
�� 
var
�� '
dbMigrationsProjectFolder
�� %
=
��& '5
'GetEntityFrameworkCoreProjectFolderPath
��( O
(
��O P
)
��P Q
;
��Q R
return
�� '
dbMigrationsProjectFolder
�� (
!=
��) +
null
��, 0
&&
��1 3
	Directory
��4 =
.
��= >
Exists
��> D
(
��D E
Path
��E I
.
��I J
Combine
��J Q
(
��Q R'
dbMigrationsProjectFolder
��R k
,
��k l
$str
��m y
)
��y z
)
��z {
;
��{ |
}
�� 
private
�� 
void
�� !
AddInitialMigration
�� $
(
��$ %
)
��% &
{
�� 
Logger
�� 
.
�� 
LogInformation
�� 
(
�� 
$str
�� =
)
��= >
;
��> ?
string
�� 
argumentPrefix
�� 
;
�� 
string
�� 
fileName
�� 
;
�� 
if
�� 

(
��  
RuntimeInformation
�� 
.
�� 
IsOSPlatform
�� +
(
��+ ,

OSPlatform
��, 6
.
��6 7
OSX
��7 :
)
��: ;
||
��< > 
RuntimeInformation
��? Q
.
��Q R
IsOSPlatform
��R ^
(
��^ _

OSPlatform
��_ i
.
��i j
Linux
��j o
)
��o p
)
��p q
{
�� 	
argumentPrefix
�� 
=
�� 
$str
�� !
;
��! "
fileName
�� 
=
�� 
$str
�� "
;
��" #
}
�� 	
else
�� 
{
�� 	
argumentPrefix
�� 
=
�� 
$str
�� !
;
��! "
fileName
�� 
=
�� 
$str
��  
;
��  !
}
�� 	
var
�� 
procStartInfo
�� 
=
�� 
new
�� 
ProcessStartInfo
��  0
(
��0 1
fileName
��1 9
,
��9 :
$"
�� 
{
�� 
argumentPrefix
�� 
}
�� 
$str
�� I
{
��I J5
'GetEntityFrameworkCoreProjectFolderPath
��J q
(
��q r
)
��r s
}
��s t
$str
��t x
"
��x y
)
�� 	
;
��	 

try
�� 
{
�� 	
Process
�� 
.
�� 
Start
�� 
(
�� 
procStartInfo
�� '
)
��' (
;
��( )
}
�� 	
catch
�� 
(
�� 
	Exception
�� 
)
�� 
{
�� 	
throw
�� 
new
�� 
	Exception
�� 
(
��  
$str
��  9
)
��9 :
;
��: ;
}
�� 	
}
�� 
private
�� 
string
�� 
?
�� 5
'GetEntityFrameworkCoreProjectFolderPath
�� ;
(
��; <
)
��< =
{
�� 
var
�� 
slnDirectoryPath
�� 
=
�� &
GetSolutionDirectoryPath
�� 7
(
��7 8
)
��8 9
;
��9 :
if
�� 

(
�� 
slnDirectoryPath
�� 
==
�� 
null
��  $
)
��$ %
{
�� 	
throw
�� 
new
�� 
	Exception
�� 
(
��  
$str
��  <
)
��< =
;
��= >
}
�� 	
var
�� 
srcDirectoryPath
�� 
=
�� 
Path
�� #
.
��# $
Combine
��$ +
(
��+ ,
slnDirectoryPath
��, <
,
��< =
$str
��> C
)
��C D
;
��D E
return
�� 
	Directory
�� 
.
�� 
GetDirectories
�� '
(
��' (
srcDirectoryPath
��( 8
)
��8 9
.
�� 
FirstOrDefault
�� 
(
�� 
d
�� 
=>
��  
d
��! "
.
��" #
EndsWith
��# +
(
��+ ,
$str
��, B
)
��B C
)
��C D
;
��D E
}
�� 
private
�� 
string
�� 
?
�� &
GetSolutionDirectoryPath
�� ,
(
��, -
)
��- .
{
�� 
var
�� 
currentDirectory
�� 
=
�� 
new
�� "
DirectoryInfo
��# 0
(
��0 1
	Directory
��1 :
.
��: ;!
GetCurrentDirectory
��; N
(
��N O
)
��O P
)
��P Q
;
��Q R
while
�� 
(
�� 
currentDirectory
�� 
!=
��  "
null
��# '
&&
��( *
	Directory
��+ 4
.
��4 5
	GetParent
��5 >
(
��> ?
currentDirectory
��? O
.
��O P
FullName
��P X
)
��X Y
!=
��Z \
null
��] a
)
��a b
{
�� 	
currentDirectory
�� 
=
�� 
	Directory
�� (
.
��( )
	GetParent
��) 2
(
��2 3
currentDirectory
��3 C
.
��C D
FullName
��D L
)
��L M
;
��M N
if
�� 
(
�� 
currentDirectory
��  
!=
��! #
null
��$ (
&&
��) +
	Directory
��, 5
.
��5 6
GetFiles
��6 >
(
��> ?
currentDirectory
��? O
.
��O P
FullName
��P X
)
��X Y
.
��Y Z
FirstOrDefault
��Z h
(
��h i
f
��i j
=>
��k m
f
��n o
.
��o p
EndsWith
��p x
(
��x y
$str
��y 
)�� �
)��� �
!=��� �
null��� �
)��� �
{
�� 
return
�� 
currentDirectory
�� '
.
��' (
FullName
��( 0
;
��0 1
}
�� 
}
�� 	
return
�� 
null
�� 
;
�� 
}
�� 
}�� �
�D:\PROJECTS\.NET\ABP Framework\SawaTech assign\aspnet-core\src\SawaTech.PropertyMini.Domain\Data\NullPropertyMiniDbSchemaMigrator.cs
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
} �
�D:\PROJECTS\.NET\ABP Framework\SawaTech assign\aspnet-core\src\SawaTech.PropertyMini.Domain\Data\IPropertyMiniDbSchemaMigrator.cs
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
} �
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
}		 �	
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