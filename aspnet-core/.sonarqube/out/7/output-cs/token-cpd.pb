ê
yD:\PROJECTS\.NET\ABP Framework\SawaTech assign\aspnet-core\src\SawaTech.PropertyMini.HttpApi\PropertyMiniHttpApiModule.cs
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
 2
&PropertyMiniApplicationContractsModule 1
)1 2
,2 3
typeof 

(
 #
AbpAccountHttpApiModule "
)" #
,# $
typeof 

(
 $
AbpIdentityHttpApiModule #
)# $
,$ %
typeof 

(
 0
$AbpPermissionManagementHttpApiModule /
)/ 0
,0 1
typeof 

(
 ,
 AbpTenantManagementHttpApiModule +
)+ ,
,, -
typeof 

(
 -
!AbpFeatureManagementHttpApiModule ,
), -
) 
] 
public 
class %
PropertyMiniHttpApiModule &
:' (
	AbpModule) 2
{ 
public 

override 
void 
ConfigureServices *
(* +'
ServiceConfigurationContext+ F
contextG N
)N O
{ !
ConfigureLocalization 
( 
) 
;  
} 
private 
void !
ConfigureLocalization &
(& '
)' (
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
	Resources"" 
.## 
Get## 
<##  
PropertyMiniResource## )
>##) *
(##* +
)##+ ,
.$$ 
AddBaseTypes$$ 
($$ 
typeof%% 
(%% 
AbpUiResource%% (
)%%( )
)&& 
;&& 
}'' 	
)''	 

;''
 
}(( 
})) ∫
uD:\PROJECTS\.NET\ABP Framework\SawaTech assign\aspnet-core\src\SawaTech.PropertyMini.HttpApi\Models\Test\TestModel.cs
	namespace 	
SawaTech
 
. 
PropertyMini 
.  
Models  &
.& '
Test' +
;+ ,
public 
class 
	TestModel 
{ 
public 

string 
? 
Name 
{ 
get 
; 
set "
;" #
}$ %
public		 

DateTime		 
	BirthDate		 
{		 
get		  #
;		# $
set		% (
;		( )
}		* +
}

 ¬
ÇD:\PROJECTS\.NET\ABP Framework\SawaTech assign\aspnet-core\src\SawaTech.PropertyMini.HttpApi\Controllers\PropertyMiniController.cs
	namespace 	
SawaTech
 
. 
PropertyMini 
.  
Controllers  +
;+ ,
public 
abstract 
class "
PropertyMiniController ,
:- .
AbpControllerBase/ @
{		 
	protected

 "
PropertyMiniController

 $
(

$ %
)

% &
{  
LocalizationResource 
= 
typeof %
(% & 
PropertyMiniResource& :
): ;
;; <
} 
} 