‹
†D:\PROJECTS\.NET\ABP Framework\SawaTech assign\aspnet-core\src\SawaTech.PropertyMini.HttpApi.Client\PropertyMiniHttpApiClientModule.cs
	namespace 	
SawaTech
 
. 
PropertyMini 
;  
[ 
	DependsOn 

(
 
typeof 

(
 2
&PropertyMiniApplicationContractsModule 1
)1 2
) 
] 
public 
class +
PropertyMiniHttpApiClientModule ,
:- .
	AbpModule/ 8
{ 
public 

const 
string 
RemoteServiceName )
=* +
$str, 5
;5 6
public 

override 
void 
ConfigureServices *
(* +'
ServiceConfigurationContext+ F
contextG N
)N O
{ 
context 
. 
Services 
.  
AddHttpClientProxies -
(- .
typeof 
( 2
&PropertyMiniApplicationContractsModule 9
)9 :
.: ;
Assembly; C
,C D
RemoteServiceName 
) 	
;	 

	Configure!! 
<!! '
AbpVirtualFileSystemOptions!! -
>!!- .
(!!. /
options!!/ 6
=>!!7 9
{"" 	
options## 
.## 
FileSets## 
.## 
AddEmbedded## (
<##( )+
PropertyMiniHttpApiClientModule##) H
>##H I
(##I J
)##J K
;##K L
}$$ 	
)$$	 

;$$
 
}%% 
}&& 