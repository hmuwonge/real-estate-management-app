†
™D:\PROJECTS\.NET\ABP Framework\SawaTech assign\aspnet-core\test\SawaTech.PropertyMini.HttpApi.Client.ConsoleTestApp\PropertyMiniConsoleApiClientModule.cs
	namespace		 	
SawaTech		
 
.		 
PropertyMini		 
.		  
HttpApi		  '
.		' (
Client		( .
.		. /
ConsoleTestApp		/ =
;		= >
[ 
	DependsOn 

(
 
typeof 

(
 
AbpAutofacModule 
) 
, 
typeof 

(
 +
PropertyMiniHttpApiClientModule *
)* +
,+ ,
typeof 

(
 ,
 AbpHttpClientIdentityModelModule +
)+ ,
) 
] 
public 
class .
"PropertyMiniConsoleApiClientModule /
:0 1
	AbpModule2 ;
{ 
public 

override 
void  
PreConfigureServices -
(- .'
ServiceConfigurationContext. I
contextJ Q
)Q R
{ 
PreConfigure 
< '
AbpHttpClientBuilderOptions 0
>0 1
(1 2
options2 9
=>: <
{ 	
options 
. #
ProxyClientBuildActions +
.+ ,
Add, /
(/ 0
(0 1
remoteServiceName1 B
,B C
clientBuilderD Q
)Q R
=>S U
{ 
clientBuilder 
. '
AddTransientHttpErrorPolicy 9
(9 :
policyBuilder !
=>" $
policyBuilder% 2
.2 3
WaitAndRetryAsync3 D
(D E
$numE F
,F G
iH I
=>J L
TimeSpanM U
.U V
FromSecondsV a
(a b
Mathb f
.f g
Powg j
(j k
$numk l
,l m
in o
)o p
)p q
)q r
) 
; 
} 
) 
; 
} 	
)	 

;
 
} 
} Ñ
~D:\PROJECTS\.NET\ABP Framework\SawaTech assign\aspnet-core\test\SawaTech.PropertyMini.HttpApi.Client.ConsoleTestApp\Program.cs
	namespace 	
SawaTech
 
. 
PropertyMini 
.  
HttpApi  '
.' (
Client( .
.. /
ConsoleTestApp/ =
;= >
class 
Program 
{		 
static

 

async

 
Task

 
Main

 
(

 
string

 !
[

! "
]

" #
args

$ (
)

( )
{ 
await 
CreateHostBuilder 
(  
args  $
)$ %
.% &
RunConsoleAsync& 5
(5 6
)6 7
;7 8
} 
public 

static 
IHostBuilder 
CreateHostBuilder 0
(0 1
string1 7
[7 8
]8 9
args: >
)> ?
=>@ B
Host 
.  
CreateDefaultBuilder !
(! "
args" &
)& '
. %
AddAppSettingsSecretsJson &
(& '
)' (
. 
ConfigureServices 
( 
(  
hostContext  +
,+ ,
services- 5
)5 6
=>7 9
{ 
services 
. 
AddHostedService )
<) *'
ConsoleTestAppHostedService* E
>E F
(F G
)G H
;H I
} 
) 
; 
} –
’D:\PROJECTS\.NET\ABP Framework\SawaTech assign\aspnet-core\test\SawaTech.PropertyMini.HttpApi.Client.ConsoleTestApp\ConsoleTestAppHostedService.cs
	namespace 	
SawaTech
 
. 
PropertyMini 
.  
HttpApi  '
.' (
Client( .
.. /
ConsoleTestApp/ =
;= >
public

 
class

 '
ConsoleTestAppHostedService

 (
:

) *
IHostedService

+ 9
{ 
private 
readonly 
IConfiguration #
_configuration$ 2
;2 3
public 
'
ConsoleTestAppHostedService &
(& '
IConfiguration' 5
configuration6 C
)C D
{ 
_configuration 
= 
configuration &
;& '
} 
public 

async 
Task 

StartAsync  
(  !
CancellationToken! 2
cancellationToken3 D
)D E
{ 
using 
( 
var 
application 
=  
await! &!
AbpApplicationFactory' <
.< =
CreateAsync= H
<H I.
"PropertyMiniConsoleApiClientModuleI k
>k l
(l m
optionsm t
=>u w
{ 	
options 
. 
Services 
.  
ReplaceConfiguration 0
(0 1
_configuration1 ?
)? @
;@ A
options 
. 

UseAutofac 
( 
) 
;  
} 	
)	 

)
 
{ 	
await 
application 
. 
InitializeAsync -
(- .
). /
;/ 0
var 
demo 
= 
application "
." #
ServiceProvider# 2
.2 3
GetRequiredService3 E
<E F
ClientDemoServiceF W
>W X
(X Y
)Y Z
;Z [
await 
demo 
. 
RunAsync 
(  
)  !
;! "
await   
application   
.   
ShutdownAsync   +
(  + ,
)  , -
;  - .
}!! 	
}"" 
public$$ 

Task$$ 
	StopAsync$$ 
($$ 
CancellationToken$$ +
cancellationToken$$, =
)$$= >
{%% 
return&& 
Task&& 
.&& 
CompletedTask&& !
;&&! "
}'' 
}(( ð
ˆD:\PROJECTS\.NET\ABP Framework\SawaTech assign\aspnet-core\test\SawaTech.PropertyMini.HttpApi.Client.ConsoleTestApp\ClientDemoService.cs
	namespace 	
SawaTech
 
. 
PropertyMini 
.  
HttpApi  '
.' (
Client( .
.. /
ConsoleTestApp/ =
;= >
public 
class 
ClientDemoService 
:   
ITransientDependency! 5
{		 
private

 
readonly

 
IProfileAppService

 '
_profileAppService

( :
;

: ;
public 

ClientDemoService 
( 
IProfileAppService /
profileAppService0 A
)A B
{ 
_profileAppService 
= 
profileAppService .
;. /
} 
public 

async 
Task 
RunAsync 
( 
)  
{ 
var 
output 
= 
await 
_profileAppService -
.- .
GetAsync. 6
(6 7
)7 8
;8 9
Console 
. 
	WriteLine 
( 
$" 
$str '
{' (
output( .
.. /
UserName/ 7
}7 8
"8 9
)9 :
;: ;
Console 
. 
	WriteLine 
( 
$" 
$str '
{' (
output( .
.. /
Email/ 4
}4 5
"5 6
)6 7
;7 8
Console 
. 
	WriteLine 
( 
$" 
$str '
{' (
output( .
.. /
Name/ 3
}3 4
"4 5
)5 6
;6 7
Console 
. 
	WriteLine 
( 
$" 
$str '
{' (
output( .
.. /
Surname/ 6
}6 7
"7 8
)8 9
;9 :
} 
} 