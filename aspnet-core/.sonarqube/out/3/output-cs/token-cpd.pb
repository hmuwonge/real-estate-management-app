‡
äD:\PROJECTS\.NET\ABP Framework\SawaTech assign\aspnet-core\src\SawaTech.PropertyMini.Application.Contracts\UserProfile\UpdateAccountDto.cs
	namespace		 	
SawaTech		
 
.		 
PropertyMini		 
.		  
UserProfile		  +
{

 
public 

class 
UpdateAccountDto !
{ 
public 
Guid 
Id 
{ 
get 
; 
set !
;! "
}# $
[ 	
DataType	 
( 
DataType 
. 
EmailAddress '
)' (
]( )
[ 	
EmailAddress	 
] 
public 
string 
Email 
{ 
get !
;! "
set# &
;& '
}( )
=* +
string, 2
.2 3
Empty3 8
;8 9
[ 	
DataType	 
( 
DataType 
. 
Password #
)# $
]$ %
public 
string 
Password 
{  
get! $
;$ %
set& )
;) *
}+ ,
=- .
String/ 5
.5 6
Empty6 ;
;; <
[ 	
	MaxLength	 
( 
$num 
) 
, 
	MinLength "
(" #
$num# $
)$ %
]% &
public 
string 
? 
UserName 
{  !
get" %
;% &
set' *
;* +
}, -
=. /
null0 4
!4 5
;5 6
public 
string 
? 
PhoneNumber "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
string 
? 
WhatsApp 
{  !
get" %
;% &
set' *
;* +
}, -
public 
string 
? 
Country 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
	IFormFile 
? 
ProfilePicture (
{) *
get+ .
;. /
set0 3
;3 4
}5 6
public 
string 
? 
CompanyName "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
string 
? 
CompanyMail "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
string 
? 

Department !
{" #
get$ '
;' (
set) ,
;, -
}. /
public   
string   
?   
JobPosition   "
{  # $
get  % (
;  ( )
set  * -
;  - .
}  / 0
}!! 
}"" ¨
âD:\PROJECTS\.NET\ABP Framework\SawaTech assign\aspnet-core\src\SawaTech.PropertyMini.Application.Contracts\UserAccount\RefreshTokenDto.cs
	namespace 	
SawaTech
 
. 
PropertyMini 
.  
UserAccount  +
{ 
public		 

class		 
RefreshTokenDto		  
{

 
public 
string 
? 
Token 
{ 
get "
;" #
set$ '
;' (
}) *
} 
} û
ÇD:\PROJECTS\.NET\ABP Framework\SawaTech assign\aspnet-core\src\SawaTech.PropertyMini.Application.Contracts\UserAccount\LoginDto.cs
	namespace 	
SawaTech
 
. 
PropertyMini 
.  
UserAccount  +
{ 
public		 

class		 
LoginDto		 
:		 
AccountBase		 %
{

 
} 
} ¢
êD:\PROJECTS\.NET\ABP Framework\SawaTech assign\aspnet-core\src\SawaTech.PropertyMini.Application.Contracts\UserAccount\IUserAccountAppService.cs
	namespace 	
SawaTech
 
. 
PropertyMini 
.  
UserAccount  +
{ 
public 

	interface "
IUserAccountAppService +
:+ ,
IApplicationService- @
{ 
Task 
< 
GeneralResponse 
> 
RegisterAsync +
(+ ,
[, -
FromForm- 5
]5 6"
CreateUpdateAccountDto7 M
?M N
userO S
)T U
;U V
Task 
< 
GeneralResponse 
> 
UpdateAsync )
() *
[* +
FromForm+ 3
]3 4
UpdateAccountDto5 E
?E F
dtoG J
)K L
;L M
Task 
< 
LoginResponse 
> 

LoginAsync &
(& '
LoginDto' /
?/ 0
user1 5
)5 6
;6 7
Task 
< 
LoginResponse 
> 
RefreshTokenAsync -
(- .
RefreshTokenDto. =
user> B
)B C
;C D
Task 
< 
GeneralResponse 
> 
GetUserProfile ,
(, -
Guid- 1
userId2 8
)8 9
;9 :
} 
} ˚
ÜD:\PROJECTS\.NET\ABP Framework\SawaTech assign\aspnet-core\src\SawaTech.PropertyMini.Application.Contracts\UserAccount\IUserAccount.cs
	namespace 	
SawaTech
 
. 
PropertyMini 
.  
UserAccount  +
{ 
public 

	interface 
IUserAccount !
:! "
IApplicationService" 5
{ 
Task		 
<		 
GeneralResponse		 
>		 
RegisterAsync		 +
(		+ ,"
CreateUpdateAccountDto		, B
user		C G
)		G H
;		H I
Task

 
<

 
LoginResponse

 
>

 

LoginAsync

 &
(

& '
LoginDto

' /
user

0 4
)

4 5
;

5 6
Task 
< 
LoginResponse 
> 
RefreshTokenAsync -
(- .
RefreshTokenDto. =
user> B
)B C
;C D
} 
} ë
êD:\PROJECTS\.NET\ABP Framework\SawaTech assign\aspnet-core\src\SawaTech.PropertyMini.Application.Contracts\UserAccount\CreateUpdateAccountDto.cs
	namespace 	
SawaTech
 
. 
PropertyMini 
.  
UserAccount  +
{ 
public 

class "
CreateUpdateAccountDto '
:' (
AccountBase) 4
{ 
public		 
Guid		 
Id		 
{		 
get		 
;		 
set		 !
;		! "
}		# $
[

 	
Required

	 
]

 
[ 	
	MaxLength	 
( 
$num 
) 
] 
[ 	
	MinLength	 
( 
$num 
) 
] 
public 
string 
UserName 
{  
get! $
;$ %
set& )
;) *
}+ ,
=- .
null/ 3
!3 4
;4 5
public 
string 
UserType 
{  
get! $
;$ %
set& )
;) *
}+ ,
=- .
string/ 5
.5 6
Empty6 ;
;; <
[ 	
DataType	 
( 
DataType 
. 
Password #
)# $
]$ %
[ 	
Compare	 
( 
nameof 
( 
Password  
)  !
)! "
]" #
[ 	
Required	 
] 
public 
string 
? 
ConfirmPassword &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
public   
string   
?   
PhoneNumber   "
{  # $
get  % (
;  ( )
set  * -
;  - .
}  / 0
public!! 
string!! 
?!! 
WhatsApp!! 
{!!  !
get!!" %
;!!% &
set!!' *
;!!* +
}!!, -
public"" 
string"" 
?"" 
Country"" 
{""  
get""! $
;""$ %
set""& )
;"") *
}""+ ,
public## 
	IFormFile## 
?## 
ProfilePicture## (
{##) *
get##+ .
;##. /
set##0 3
;##3 4
}##5 6
public$$ 
string$$ 
?$$ 
CompanyName$$ "
{$$# $
get$$% (
;$$( )
set$$* -
;$$- .
}$$/ 0
public%% 
string%% 
?%% 
CompanyMail%% "
{%%# $
get%%% (
;%%( )
set%%* -
;%%- .
}%%/ 0
public&& 
string&& 
?&& 

Department&& !
{&&" #
get&&$ '
;&&' (
set&&) ,
;&&, -
}&&. /
public'' 
string'' 
?'' 
JobPosition'' "
{''# $
get''% (
;''( )
set''* -
;''- .
}''/ 0
})) 
}** ó

ÖD:\PROJECTS\.NET\ABP Framework\SawaTech assign\aspnet-core\src\SawaTech.PropertyMini.Application.Contracts\UserAccount\AccountBase.cs
	namespace 	
SawaTech
 
. 
PropertyMini 
.  
UserAccount  +
{		 
public

 

class

 
AccountBase

 
{ 
[ 	
DataType	 
( 
DataType 
. 
EmailAddress '
)' (
]( )
[ 	
EmailAddress	 
] 
[ 	
Required	 
] 
public 
string 
Email 
{ 
get !
;! "
set# &
;& '
}( )
=* +
string, 2
.2 3
Empty3 8
;8 9
[ 	
DataType	 
( 
DataType 
. 
Password #
)# $
]$ %
[ 	
Required	 
] 
public 
string 
Password 
{  
get! $
;$ %
set& )
;) *
}+ ,
=- .
String/ 5
.5 6
Empty6 ;
;; <
} 
} ›
éD:\PROJECTS\.NET\ABP Framework\SawaTech assign\aspnet-core\src\SawaTech.PropertyMini.Application.Contracts\PublicProperties\PropertyListDto.cs
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
class 
PropertyListDto  
{ 
public 
Guid 
Id 
{ 
get 
; 
set !
;! "
}# $
public 
string 
Title 
{ 
get !
;! "
set# &
;& '
}( )
=* +
string, 2
.2 3
Empty3 8
;8 9
public 
decimal 
Price 
{ 
get "
;" #
set$ '
;' (
}) *
public 
float 
Area 
{ 
get 
;  
set! $
;$ %
}& '
public 
int 
Rooms 
{ 
get 
; 
set  #
;# $
}% &
public 
string 
	MainImage 
{  !
get" %
;% &
set' *
;* +
}, -
=. /
string/ 5
.5 6
Empty6 ;
;; <
public 
PropertyOwnerDto 
Owner  %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
=3 4
null5 9
!9 :
;: ;
public  
GovernorateDetailDto #
Governorate$ /
{0 1
get2 5
;5 6
set7 :
;: ;
}< =
== >
null? C
!C D
;D E
public 
PropertyType 
PropertyType (
{) *
get+ .
;. /
set0 3
;3 4
}5 6
=6 7
null8 <
!< =
;= >
public 
List 
< 
Amenity 
> 
	Amenities &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
=5 6
[7 8
]8 9
;9 :
public 
List 
< 
NearbyPlaceDto "
>" # 
PropertyNearbyPlaces$ 8
{9 :
get; >
;> ?
set@ C
;C D
}E F
=G H
nullI M
!M N
;N O
public 
List 
< 
PropertyImageDto $
>$ %
PropertyImages& 4
{5 6
get7 :
;: ;
set< ?
;? @
}A B
=C D
[E F
]F G
;G H
public 
DateTime 
CreationTime $
{% &
get' *
;* +
set, /
;/ 0
}1 2
} 
} û
òD:\PROJECTS\.NET\ABP Framework\SawaTech assign\aspnet-core\src\SawaTech.PropertyMini.Application.Contracts\PublicProperties\IPublicPropertyAppService.cs
	namespace 	
SawaTech
 
. 
PropertyMini 
.  
PublicProperties  0
;0 1
public

 
	interface

 %
IPublicPropertyAppService

 *
{ 
Task 
< 	
GeneralResponse	 
> &
GetPublicPropertyListAsync 4
(4 5
)5 6
;6 7
Task 
< 	
GeneralResponse	 
> +
GetExploreHomePropertyListAsync 9
(9 :
): ;
;; <
Task 
< 	
GeneralResponse	 
> "
GetPublicPropertyAsync 0
(0 1
Guid1 5
id6 8
)8 9
;9 :
} ˇ
éD:\PROJECTS\.NET\ABP Framework\SawaTech assign\aspnet-core\src\SawaTech.PropertyMini.Application.Contracts\PublicProperties\ExploreHomesDto.cs
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
ExploreHomesDto

  
{ 
public 
Guid 
Id 
{ 
get 
; 
set !
;! "
}# $
public 
string 
	MainImage 
{  !
get" %
;% &
set' *
;* +
}, -
=. /
string0 6
.6 7
Empty7 <
;< =
public  
GovernorateDetailDto #
Governorate$ /
{0 1
get2 5
;5 6
set7 :
;: ;
}< =
=> ?
null@ D
!D E
;E F
} 
} “
ãD:\PROJECTS\.NET\ABP Framework\SawaTech assign\aspnet-core\src\SawaTech.PropertyMini.Application.Contracts\PropertyTypes\PropertyTypeDto.cs
	namespace 	
SawaTech
 
. 
PropertyMini 
.  
PropertyTypes  -
{ 
public 

class 
PropertyTypeDto  
{ 
public 
Guid 
? 
Id 
{ 
get 
; 
set "
;" #
}$ %
public		 
string		 
?		 
Name		 
{		 
get		 !
;		! "
set		# &
;		& '
}		( )
}

 
} ã
ìD:\PROJECTS\.NET\ABP Framework\SawaTech assign\aspnet-core\src\SawaTech.PropertyMini.Application.Contracts\PropertyTypes\IPropertyTypeAppService.cs
	namespace 	
SawaTech
 
. 
PropertyMini 
.  
PropertyTypes  -
{ 
public		 

	interface		 #
IPropertyTypeAppService		 ,
:		- .
IApplicationService		/ B
{

 
Task 
< 
List 
< 
PropertyTypeDto !
>! "
>" #
GetListAsync$ 0
(0 1
)1 2
;2 3
Task 
< 
PropertyTypeDto 
> 
GetAsync &
(& '
Guid' +
id, .
). /
;/ 0
Task 
< 
PropertyTypeDto 
> 
CreateAsync )
() *'
CreateUpdatePropertyTypeDto* E
inputF K
)K L
;L M
Task 
< 
PropertyTypeDto 
> 
UpdateAsync )
() *
Guid* .
id/ 1
,1 2'
CreateUpdatePropertyTypeDto3 N
inputO T
)T U
;U V
Task 
DeleteAsync 
( 
Guid 
id  
)  !
;! "
} 
} Æ
óD:\PROJECTS\.NET\ABP Framework\SawaTech assign\aspnet-core\src\SawaTech.PropertyMini.Application.Contracts\PropertyTypes\CreateUpdatePropertyTypeDto.cs
	namespace		 	
SawaTech		
 
.		 
PropertyMini		 
.		  
PropertyTypes		  -
{

 
public 

class '
CreateUpdatePropertyTypeDto ,
{ 
[ 	
Required	 
] 
public 
string 
Name 
{ 
get !
;! "
set# &
;& '
}( )
=* +
default, 3
!3 4
;4 5
} 
} Ö
áD:\PROJECTS\.NET\ABP Framework\SawaTech assign\aspnet-core\src\SawaTech.PropertyMini.Application.Contracts\PropertyMiniDtoExtensions.cs
	namespace 	
SawaTech
 
. 
PropertyMini 
;  
public 
static 
class %
PropertyMiniDtoExtensions -
{ 
private		 
static		 
readonly		 
OneTimeRunner		 )
OneTimeRunner		* 7
=		8 9
new		: =
OneTimeRunner		> K
(		K L
)		L M
;		M N
public 

static 
void 
	Configure  
(  !
)! "
{ 
OneTimeRunner 
. 
Run 
( 
( 
) 
=> 
{ 	
} 	
)	 

;
 
} 
} ›
îD:\PROJECTS\.NET\ABP Framework\SawaTech assign\aspnet-core\src\SawaTech.PropertyMini.Application.Contracts\PropertyMiniApplicationContractsModule.cs
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
;

  
[ 
	DependsOn 

(
 
typeof 

(
 *
PropertyMiniDomainSharedModule )
)) *
,* +
typeof 

(
 0
$AbpAccountApplicationContractsModule /
)/ 0
,0 1
typeof 

(
 :
.AbpFeatureManagementApplicationContractsModule 9
)9 :
,: ;
typeof 

(
 1
%AbpIdentityApplicationContractsModule 0
)0 1
,1 2
typeof 

(
 =
1AbpPermissionManagementApplicationContractsModule <
)< =
,= >
typeof 

(
 $
AbpObjectExtendingModule #
)# $
) 
] 
public 
class 2
&PropertyMiniApplicationContractsModule 3
:4 5
	AbpModule6 ?
{ 
public 

override 
void  
PreConfigureServices -
(- .'
ServiceConfigurationContext. I
contextJ Q
)Q R
{ %
PropertyMiniDtoExtensions !
.! "
	Configure" +
(+ ,
), -
;- .
} 
} î
ëD:\PROJECTS\.NET\ABP Framework\SawaTech assign\aspnet-core\src\SawaTech.PropertyMini.Application.Contracts\PropertyFeatures\PropertyFeatureDto.cs
	namespace 	
SawaTech
 
. 
PropertyMini 
.  
PropertyFeatures  0
{ 
public 

class 
PropertyFeatureDto #
{ 
public 
Guid 
Id 
{ 
get 
; 
set !
;! "
}# $
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
=) *
string+ 1
.1 2
Empty2 7
;7 8
}		 
}

 ´
ôD:\PROJECTS\.NET\ABP Framework\SawaTech assign\aspnet-core\src\SawaTech.PropertyMini.Application.Contracts\PropertyFeatures\IPropertyFeatureAppService.cs
	namespace 	
SawaTech
 
. 
PropertyMini 
.  
PropertyFeatures  0
{ 
public		 

	interface		 &
IPropertyFeatureAppService		 /
:		0 1
IApplicationService		2 E
{

 
Task 
< 
List 
< 
PropertyFeatureDto $
>$ %
>% &
GetListAsync' 3
(3 4
)4 5
;5 6
Task 
< 
PropertyFeatureDto 
>  
GetAsync! )
() *
Guid* .
id/ 1
)1 2
;2 3
Task 
< 
PropertyFeatureDto 
>  
CreateAsync! ,
(, -+
CreateUpdatePropertyFeaturesDto- L
inputM R
)R S
;S T
Task 
< 
PropertyFeatureDto 
>  
UpdateAsync! ,
(, -
Guid- 1
id2 4
,4 5+
CreateUpdatePropertyFeaturesDto6 U
inputV [
)[ \
;\ ]
Task 
DeleteAsync 
( 
Guid 
id  
)  !
;! "
} 
} ¿
ùD:\PROJECTS\.NET\ABP Framework\SawaTech assign\aspnet-core\src\SawaTech.PropertyMini.Application.Contracts\PropertyFeatures\CreateUpdatePropertyFeatureDto.cs
	namespace 	
SawaTech
 
. 
PropertyMini 
.  
PropertyFeatures  0
{		 
public

 

class

 +
CreateUpdatePropertyFeaturesDto

 0
{ 
[ 	
Required	 
] 
public 
required 
string 
Name #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
required 
string 
IconUrl &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
} 
} ˝
òD:\PROJECTS\.NET\ABP Framework\SawaTech assign\aspnet-core\src\SawaTech.PropertyMini.Application.Contracts\PropertyAmenities\SinglePropertyAmenityDto.cs
	namespace 	
SawaTech
 
. 
PropertyMini 
.  
PropertyAmenities  1
;1 2
public 
class $
SinglePropertyAmenityDto %
{ 
public 

string 
Name 
{ 
get 
; 
set !
;! "
}# $
=% &
string' -
.- .
Empty. 3
;3 4
} é
òD:\PROJECTS\.NET\ABP Framework\SawaTech assign\aspnet-core\src\SawaTech.PropertyMini.Application.Contracts\PropertyAmenities\PropertyAmenityDetailDto.cs
	namespace 	
SawaTech
 
. 
PropertyMini 
.  
PropertyAmenities  1
{ 
public		 

class		 $
PropertyAmenityDetailDto		 )
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
} 
} Î

íD:\PROJECTS\.NET\ABP Framework\SawaTech assign\aspnet-core\src\SawaTech.PropertyMini.Application.Contracts\PropertyAmenities\IAmenityAppService.cs
	namespace 	
SawaTech
 
. 
PropertyMini 
.  
PropertyAmenities  1
{ 
public 

	interface 
IAmenityAppService '
:( )
IApplicationService* =
{		 
Task

 
<

 
List

 
<

 

AmenityDto

 
>

 
>

 
GetListAsync

 +
(

+ ,
)

, -
;

- .
Task 
< 

AmenityDto 
> 
GetAsync !
(! "
Guid" &
id' )
)) *
;* +
Task 
< 

AmenityDto 
> 
CreateAsync $
($ %"
CreateUpdateAmenityDto% ;
input< A
)A B
;B C
Task 
< 

AmenityDto 
> 
UpdateAsync $
($ %
Guid% )
id* ,
,, -"
CreateUpdateAmenityDto. D
inputE J
)J K
;K L
Task 
DeleteAsync 
( 
Guid 
id  
)  !
;! "
} 
} ¨
ñD:\PROJECTS\.NET\ABP Framework\SawaTech assign\aspnet-core\src\SawaTech.PropertyMini.Application.Contracts\PropertyAmenities\CreateUpdateAmenityDto.cs
	namespace 	
SawaTech
 
. 
PropertyMini 
.  
PropertyAmenities  1
{		 
public

 

class

 "
CreateUpdateAmenityDto

 '
{ 
[ 	
Required	 
] 
public 
string 
Name 
{ 
get !
;! "
set# &
;& '
}( )
=* +
default, 3
!3 4
;4 5
} 
} œ
äD:\PROJECTS\.NET\ABP Framework\SawaTech assign\aspnet-core\src\SawaTech.PropertyMini.Application.Contracts\PropertyAmenities\AmenityDto.cs
	namespace 	
SawaTech
 
. 
PropertyMini 
.  
PropertyAmenities  1
{		 
public

 

class

 

AmenityDto

 
:

 
AuditedEntityDto

 .
<

. /
Guid

/ 3
>

3 4
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
;7 8
} 
} ≠
èD:\PROJECTS\.NET\ABP Framework\SawaTech assign\aspnet-core\src\SawaTech.PropertyMini.Application.Contracts\Properties\PropertyGovernorateDto.cs
	namespace 	
SawaTech
 
. 
PropertyMini 
.  

Properties  *
;* +
public 
class "
PropertyGovernorateDto #
{ 
public 

required 
string 
Name  
{! "
get# &
;& '
set( +
;+ ,
}- .
} ≠
äD:\PROJECTS\.NET\ABP Framework\SawaTech assign\aspnet-core\src\SawaTech.PropertyMini.Application.Contracts\Properties\PropertyFilterDto.cs
	namespace 	
SawaTech
 
. 
PropertyMini 
.  

Properties  *
{		 
public

 

class

 
PropertyFilterDto

 "
{ 
public 
Guid 
? 
GovernorateId "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
string 
? 
AddressKeyword %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
public 
decimal 
? 
MinPrice  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
decimal 
? 
MaxPrice  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
float 
? 
MinArea 
{ 
get "
;" #
set$ '
;' (
}) *
public 
float 
? 
MaxArea 
{ 
get  #
;# $
set% (
;( )
}* +
public 
string 
? 
Location 
{  !
get" %
;% &
set' *
;* +
}, -
public 
int 
? 
Rooms 
{ 
get 
;  
set! $
;$ %
}& '
public 
Guid 
? 
Type 
{ 
get 
;  
set! $
;$ %
}& '
public 
string 
? 
Status 
{ 
get  #
;# $
set% (
;( )
}* +
} 
} ¯
ÑD:\PROJECTS\.NET\ABP Framework\SawaTech assign\aspnet-core\src\SawaTech.PropertyMini.Application.Contracts\Properties\PropertyDto.cs
	namespace 	
SawaTech
 
. 
PropertyMini 
.  

Properties  *
;* +
public 
class 
PropertyDto 
: 
AuditedEntityDto +
<+ ,
Guid, 0
>0 1
{ 
public.. 

required.. 
string.. 
Title..  
{..! "
get..# &
;..& '
set..( +
;..+ ,
}..- .
public// 

required// 
string// 
Description// &
{//' (
get//) ,
;//, -
set//. 1
;//1 2
}//3 4
public22 

Guid22 
OwnerId22 
{22 
get22 
;22 
set22 "
;22" #
}22$ %
public33 

Guid33 
GovernorateId33 
{33 
get33  #
;33# $
set33% (
;33( )
}33* +
public77 

virtual77 
AccountUser77 
Owner77 $
{77% &
get77' *
;77* +
set77, /
;77/ 0
}771 2
=773 4
null775 9
!779 :
;77: ;
public88 

virtual88 
PropertyType88 
PropertyType88  ,
{88- .
get88/ 2
;882 3
set884 7
;887 8
}889 :
=88; <
null88= A
!88A B
;88B C
public;; 

List;; 
<;; 
PropertyFeatureDto;; "
>;;" #
Features;;$ ,
{;;- .
get;;/ 2
;;;2 3
set;;4 7
;;;7 8
};;9 :
=;;; <
null;;= A
!;;A B
;;;B C
public<< 

List<< 
<<< 
Amenity<< 
><< 
	Amenities<< "
{<<# $
get<<% (
;<<( )
set<<* -
;<<- .
}<</ 0
=<<1 2
null<<3 7
!<<7 8
;<<8 9
public== 

List== 
<== 
string== 
>== 
Images== 
{==  
get==! $
;==$ %
set==& )
;==) *
}==+ ,
===- .
[==/ 0
]==0 1
;==1 2
public@@ 

decimal@@ 
Price@@ 
{@@ 
get@@ 
;@@ 
set@@  #
;@@# $
}@@% &
publicAA 

floatAA 
AreaAA 
{AA 
getAA 
;AA 
setAA  
;AA  !
}AA" #
publicBB 

intBB 
RoomsBB 
{BB 
getBB 
;BB 
setBB 
;BB  
}BB! "
publicCC 

doubleCC 
LatitudeCC 
{CC 
getCC  
;CC  !
setCC" %
;CC% &
}CC' (
publicDD 

doubleDD 
	LongitudeDD 
{DD 
getDD !
;DD! "
setDD# &
;DD& '
}DD( )
}EE Ú
äD:\PROJECTS\.NET\ABP Framework\SawaTech assign\aspnet-core\src\SawaTech.PropertyMini.Application.Contracts\Properties\PropertyDetailDto.cs
	namespace 	
SawaTech
 
. 
PropertyMini 
.  

Properties  *
{ 
public		 

class		 
PropertyDetailDto		 "
:		# $
PropertyListDto		% 4
{

 
public 
string 
Description !
{" #
get$ '
;' (
set) ,
;, -
}. /
=0 1
string2 8
.8 9
Empty9 >
;> ?
public 
string 
Address 
{ 
get  #
;# $
set% (
;( )
}* +
=+ ,
string- 3
.3 4
Empty4 9
;9 :
public 
decimal 
InsurancePayment '
{( )
get* -
;- .
set/ 2
;2 3
}4 5
public 
string 
Status 
{ 
get "
;" #
set$ '
;' (
}) *
=* +
string, 2
.2 3
Empty3 8
;8 9
public 
new 
PropertyTypeDto "
PropertyType# /
{0 1
get2 5
;5 6
set7 :
;: ;
}< =
== >
null? C
!C D
;D E
public 
string 
PaymentType !
{" #
get$ '
;' (
set) ,
;, -
}. /
=/ 0
string1 7
.7 8
Empty8 =
;= >
public 
List 
< 
PropertyImageDto $
>$ %
Images& ,
{- .
get/ 2
;2 3
set4 7
;7 8
}9 :
=: ;
null< @
!@ A
;A B
public 
List 
< 
PropertyFeatureDto &
>& '
Features( 0
{1 2
get3 6
;6 7
set8 ;
;; <
}= >
=> ?
null@ D
!D E
;E F
public 
List 
< $
SinglePropertyAmenityDto ,
>, -
	Amenities. 7
{8 9
get: =
;= >
set? B
;B C
}D E
=F G
nullH L
!L M
;M N
public 
List 
< 
NearbyPlaceDto "
>" #
NearbyPlaces$ 0
{1 2
get3 6
;6 7
set8 ;
;; <
}= >
=> ?
null@ D
!D E
;E F
} 
} ó
íD:\PROJECTS\.NET\ABP Framework\SawaTech assign\aspnet-core\src\SawaTech.PropertyMini.Application.Contracts\Properties\IPublicPropertyAppService.cs
	namespace 	
SawaTech
 
. 
PropertyMini 
.  

Properties  *
;* +
public 
	interface &
IProductPropertyAppService +
:+ ,
IApplicationService- @
{ 
Task		 
<		 	
ListResultDto			 
<		 
PropertyDto		 "
>		" #
>		# $
GetListAsync		% 1
(		1 2
PropertyFilterDto		2 C
?		C D
	filterDto		E N
=		O P
null		P T
,		T U
string

 
?

 
sortBy

 
=

 
null

 
,

 
bool

 !
sortDescending

" 0
=

0 1
false

1 6
,

6 7
int

7 :
?

: ;

maxResults

< F
=

F G
$num

G I
)

I J
;

J K
} Ü
åD:\PROJECTS\.NET\ABP Framework\SawaTech assign\aspnet-core\src\SawaTech.PropertyMini.Application.Contracts\Properties\IPropertyAppService.cs
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
  

Properties

  *
;

* +
public 
	interface 
IPropertyAppService $
:$ %
IApplicationService& 9
{ 
Task 
< 	
ListResultDto	 
< 
PropertyDto "
>" #
># $
GetListAsync% 1
(1 2
PropertyFilterDto2 C
?C D
	filterDtoE N
=O P
nullP T
,T U
stringV \
?\ ]
sortBy^ d
=d e
nulle i
,i j
boolk o
sortDescendingp ~
=~ 
false	 Ñ
,
Ñ Ö
int
Ö à
?
à â

maxResults
ä î
=
î ï
$num
ï ó
)
ó ò
;
ò ô
Task 
< 	
PropertyDto	 
> 
GetAsync 
( 
Guid #
id$ &
)& '
;' (
Task 
< 	
GeneralResponse	 
> 
CreateAsync %
(% &#
CreateUpdatePropertyDto& =
input> C
)C D
;D E
Task 
< 	
PropertyDto	 
> 
UpdateAsync !
(! "
Guid" &
id' )
,) *#
CreateUpdatePropertyDto+ B
inputC H
)H I
;I J
Task 
DeleteAsync	 
( 
Guid 
id 
) 
; 
} ƒ+
êD:\PROJECTS\.NET\ABP Framework\SawaTech assign\aspnet-core\src\SawaTech.PropertyMini.Application.Contracts\Properties\CreateUpdatePropertyDto.cs
	namespace 	
SawaTech
 
. 
PropertyMini 
.  

Properties  *
;* +
public		 
class		 #
CreateUpdatePropertyDto		 $
{

 
[ 
Required 
] 
public 

Guid 
PropertyTypeId 
{  
get! $
;$ %
set& )
;) *
}+ ,
=- .
Guid/ 3
.3 4
NewGuid4 ;
(; <
)< =
;= >
[ 
Required 
] 
public 

Guid 
GovernorateId 
{ 
get  #
;# $
set% (
;( )
}* +
[ 
Required 
] 
[ 
StringLength 
( 
$num 
, 
MinimumLength $
=% &
$num' (
)( )
]) *
public 

string 
Title 
{ 
get 
; 
set "
;" #
}$ %
=& '
string( .
.. /
Empty/ 4
;4 5
[ 
Required 
] 
public 

Guid 
OwnerId 
{ 
get 
; 
set "
;" #
}$ %
[ 
Required 
] 
[ 
StringLength 
( 
$num 
) 
] 
public 

string 
? 
Description 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 

string 
? 
Address 
{ 
get  
;  !
set" %
;% &
}' (
=) *
string* 0
.0 1
Empty1 6
;6 7
public 

string 
? 
PaymentType 
{  
get! $
;$ %
set& )
;) *
}+ ,
=- .
string. 4
.4 5
Empty5 :
;: ;
[!! 
Required!! 
]!! 
["" 
Range"" 

(""
 
$num"" 
,"" 
double"" 
."" 
MaxValue"" 
)"" 
]"" 
public## 

decimal## 
Price## 
{## 
get## 
;## 
set##  #
;### $
}##% &
public%% 

decimal%% 
InsurancePayment%% #
{%%$ %
get%%& )
;%%) *
set%%+ .
;%%. /
}%%0 1
public'' 

float'' 
Area'' 
{'' 
get'' 
;'' 
set''  
;''  !
}''" #
[)) 
Range)) 

())
 
$num)) 
,)) 
$num)) 
))) 
])) 
public** 

int** 
Rooms** 
{** 
get** 
;** 
set** 
;**  
}**! "
[00 
Required00 
]00 
public11 

PropertyStatus11 
PropertyStatus11 (
{11) *
get11+ .
;11. /
set110 3
;113 4
}115 6
public44 

List44 
<44 
string44 
>44 
?44 
	Amenities44 "
{44# $
get44% (
;44( )
set44* -
;44- .
}44/ 0
=441 2
[443 4
]444 5
;445 6
public55 

List55 
<55 
string55 
>55 
?55 
Features55 !
{55" #
get55$ '
;55' (
set55) ,
;55, -
}55. /
=550 1
[552 3
]553 4
;554 5
public88 

List88 
<88 
string88 
>88 
?88 
NearbyPlaces88 %
{88& '
get88( +
;88+ ,
set88- 0
;880 1
}882 3
=884 5
[886 7
]887 8
;888 9
[:: 
Required:: 
]:: 
public;; 

required;; 
	IFormFile;; 
	MainImage;; '
{;;( )
get;;+ .
;;;. /
set;;0 3
;;;3 4
};;5 6
[== 
Required== 
]== 
public>> 

List>> 
<>> 
	IFormFile>> 
>>> 
?>> 
	PhotoUrls>> %
{>>& '
get>>( +
;>>+ ,
set>>- 0
;>>0 1
}>>2 3
public?? 

	IFormFile?? 
??? 
VideoUrl?? 
{??  
get??! $
;??$ %
set??& )
;??) *
}??+ ,
[AA 
RequiredAA 
]AA 
publicBB 

doubleBB 
LatitudeBB 
{BB 
getBB  
;BB  !
setBB" %
;BB% &
}BB' (
[DD 
RequiredDD 
]DD 
publicEE 

doubleEE 
	LongitudeEE 
{EE 
getEE !
;EE! "
setEE# &
;EE& '
}EE( )
}FF ô
ëD:\PROJECTS\.NET\ABP Framework\SawaTech assign\aspnet-core\src\SawaTech.PropertyMini.Application.Contracts\Permissions\PropertyMiniPermissions.cs
	namespace 	
SawaTech
 
. 
PropertyMini 
.  
Permissions  +
;+ ,
public 
static 
class #
PropertyMiniPermissions +
{ 
public 

const 
string 
	GroupName !
=" #
$str$ 2
;2 3
}		 û

¢D:\PROJECTS\.NET\ABP Framework\SawaTech assign\aspnet-core\src\SawaTech.PropertyMini.Application.Contracts\Permissions\PropertyMiniPermissionDefinitionProvider.cs
	namespace 	
SawaTech
 
. 
PropertyMini 
.  
Permissions  +
;+ ,
public 
class 4
(PropertyMiniPermissionDefinitionProvider 5
:6 7(
PermissionDefinitionProvider8 T
{ 
public		 

override		 
void		 
Define		 
(		  (
IPermissionDefinitionContext		  <
context		= D
)		D E
{

 
var 
myGroup 
= 
context 
. 
AddGroup &
(& '#
PropertyMiniPermissions' >
.> ?
	GroupName? H
)H I
;I J
} 
private 
static 
LocalizableString $
L% &
(& '
string' -
name. 2
)2 3
{ 
return 
LocalizableString  
.  !
Create! '
<' ( 
PropertyMiniResource( <
>< =
(= >
name> B
)B C
;C D
} 
} Ñ
âD:\PROJECTS\.NET\ABP Framework\SawaTech assign\aspnet-core\src\SawaTech.PropertyMini.Application.Contracts\NearByPlaces\NearbyPlaceDto.cs
	namespace 	
SawaTech
 
. 
PropertyMini 
.  
NearByPlaces  ,
{ 
public 

class 
NearbyPlaceDto 
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
;7 8
} 
} ¿
íD:\PROJECTS\.NET\ABP Framework\SawaTech assign\aspnet-core\src\SawaTech.PropertyMini.Application.Contracts\NearByPlaces\INearbyPlacesAppService.cs
	namespace		 	
SawaTech		
 
.		 
PropertyMini		 
.		  
NearByPlaces		  ,
{

 
public 

	interface #
INearbyPlacesAppService ,
:, -
IApplicationService. A
{ 
Task 
< 
GeneralResponse 
>  
GetNearbyPlacesAsync 2
(2 3
)3 4
;4 5
Task 
< 
GeneralResponse 
> 
GetNearbyPlaceAsync 1
(1 2
Guid2 6
id7 9
)9 :
;: ;
Task 
< 
GeneralResponse 
> "
CreateNearbyPlaceAsync 4
(4 5#
CreateUpdateNearbyPlace5 L
inputM R
)R S
;S T
Task 
< 
GeneralResponse 
> "
UpdateNearbyPlaceAsync 4
(4 5
Guid5 9
id: <
,< =#
CreateUpdateNearbyPlace> U
inputV [
)[ \
;\ ]
Task 
< 
GeneralResponse 
> "
DeleteNearbyPlaceAsync 4
(4 5
Guid5 9
id: <
)< =
;= >
} 
} ƒ
íD:\PROJECTS\.NET\ABP Framework\SawaTech assign\aspnet-core\src\SawaTech.PropertyMini.Application.Contracts\NearByPlaces\CreateUpdateNearbyPlace.cs
	namespace 	
SawaTech
 
. 
PropertyMini 
.  
NearByPlaces  ,
{ 
public		 

class		 #
CreateUpdateNearbyPlace		 (
{

 
public 
required 
string 
Name #
{$ %
get& )
;) *
set+ .
;. /
}0 1
} 
} 

ëD:\PROJECTS\.NET\ABP Framework\SawaTech assign\aspnet-core\src\SawaTech.PropertyMini.Application.Contracts\Governorates\IGovernorateAppService.cs
	namespace 	
SawaTech
 
. 
PropertyMini 
.  
Governorates  ,
;, -
public 
	interface "
IGovernorateAppService '
:( )
IApplicationService* =
{		 
Task

 
<

 	
List

	 
<

 
GovernorateDto

 
>

 
>

 
GetListAsync

 +
(

+ ,
)

, -
;

- .
Task 
< 	
GovernorateDto	 
> 
GetAsync !
(! "
Guid" &
id' )
)) *
;* +
Task 
< 	
GovernorateDto	 
> 
CreateAsync $
($ %&
CreateUpdateGovernorateDto% ?
input@ E
)E F
;F G
Task 
< 	
GovernorateDto	 
> 
UpdateAsync $
($ %
Guid% )
id* ,
,, -&
CreateUpdateGovernorateDto. H
inputI N
)N O
;O P
Task 
DeleteAsync	 
( 
Guid 
id 
) 
; 
} Å
âD:\PROJECTS\.NET\ABP Framework\SawaTech assign\aspnet-core\src\SawaTech.PropertyMini.Application.Contracts\Governorates\GovernorateDto.cs
	namespace 	
SawaTech
 
. 
PropertyMini 
.  
Governorates  ,
{ 
public 

class 
GovernorateDto 
:  
AuditedEntityDto" 2
<2 3
Guid3 7
>7 8
{ 
[		 	
Required			 
]		 
public		 
string		  
Name		! %
{		& '
get		( +
;		+ ,
set		- 0
;		0 1
}		2 3
=		4 5
string		6 <
.		< =
Empty		= B
;		B C
}

 
} ¸
èD:\PROJECTS\.NET\ABP Framework\SawaTech assign\aspnet-core\src\SawaTech.PropertyMini.Application.Contracts\Governorates\GovernorateDetailDto.cs
	namespace 	
SawaTech
 
. 
PropertyMini 
.  
Governorates  ,
{ 
public		 

class		  
GovernorateDetailDto		 %
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
} 
} º
ïD:\PROJECTS\.NET\ABP Framework\SawaTech assign\aspnet-core\src\SawaTech.PropertyMini.Application.Contracts\Governorates\CreateUpdateGovernorateDto.cs
	namespace 	
SawaTech
 
. 
PropertyMini 
.  
Governorates  ,
{ 
public		 

class		 &
CreateUpdateGovernorateDto		 +
{

 
[ 	
Required	 
] 
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
;7 8
} 
} î	
âD:\PROJECTS\.NET\ABP Framework\SawaTech assign\aspnet-core\src\SawaTech.PropertyMini.Application.Contracts\AuthResponses\LoginResponse.cs
	namespace 	
SawaTech
 
. 
PropertyMini 
.  
AuthResponses  -
{ 
public		 

record		 
LoginResponse		 
(		  
bool

 
Flag

 
,

 
Payload 
? 
UserData 
, 
string	 
AccessToken 
= 
null "
!" #
,# $
string 
RefreshToken 
= 
null "
!" #
,# $
string 
Message 
= 
null 
! 
) 
; 
public 

record 
Payload 
( 
string 
? 
UserType 
, 
string 
? 
UserName 
, 
string 
Email 
, 
Guid 
Id 
) 	
;	 

} Î
ãD:\PROJECTS\.NET\ABP Framework\SawaTech assign\aspnet-core\src\SawaTech.PropertyMini.Application.Contracts\AuthResponses\GeneralResponse.cs
	namespace 	
SawaTech
 
. 
PropertyMini 
.  
AuthResponses  -
{ 
public		 

record		 
GeneralResponse		 !
(

 
bool 
Flag 
, 
string 
? 
Message "
," #
object$ *
?* +
Payload, 3
=4 5
null5 9
)9 :
;: ;
} 