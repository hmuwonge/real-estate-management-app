¤
D:\PROJECTS\.NET\ABP Framework\SawaTech assign\aspnet-core\src\SawaTech.PropertyMini.DbMigrator\PropertyMiniDbMigratorModule.cs
	namespace 	
SawaTech
 
. 
PropertyMini 
.  

DbMigrator  *
;* +
[ 
	DependsOn 

(
 
typeof 

(
 
AbpAutofacModule 
) 
, 
typeof		 

(		
 1
%PropertyMiniEntityFrameworkCoreModule		 0
)		0 1
,		1 2
typeof

 

(


 2
&PropertyMiniApplicationContractsModule

 1
)

1 2
) 
] 
public 
class (
PropertyMiniDbMigratorModule )
:* +
	AbpModule, 5
{ 
} Û
jD:\PROJECTS\.NET\ABP Framework\SawaTech assign\aspnet-core\src\SawaTech.PropertyMini.DbMigrator\Program.cs
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

DbMigrator

  *
;

* +
class 
Program 
{ 
static 

async 
Task 
Main 
( 
string !
[! "
]" #
args$ (
)( )
{ 
Log 
. 
Logger 
= 
new 
LoggerConfiguration ,
(, -
)- .
. 
MinimumLevel 
. 
Information %
(% &
)& '
. 
MinimumLevel 
. 
Override "
(" #
$str# .
,. /
LogEventLevel0 =
.= >
Warning> E
)E F
. 
MinimumLevel 
. 
Override "
(" #
$str# -
,- .
LogEventLevel/ <
.< =
Warning= D
)D E
. 
MinimumLevel 
. 
Override &
(& '
$str' >
,> ?
LogEventLevel@ M
.M N
DebugN S
)S T
. 
Enrich 
. 
FromLogContext &
(& '
)' (
. 
WriteTo 
. 
Async 
( 
c 
=> 
c  !
.! "
File" &
(& '
$str' 6
)6 7
)7 8
. 
WriteTo 
. 
Async 
( 
c 
=> 
c  !
.! "
Console" )
() *
)* +
)+ ,
. 
CreateLogger 
( 
) 
; 
await 
CreateHostBuilder 
(  
args  $
)$ %
.% &
RunConsoleAsync& 5
(5 6
)6 7
;7 8
} 
public!! 

static!! 
IHostBuilder!! 
CreateHostBuilder!! 0
(!!0 1
string!!1 7
[!!7 8
]!!8 9
args!!: >
)!!> ?
=>!!@ B
Host"" 
.""  
CreateDefaultBuilder"" !
(""! "
args""" &
)""& '
.## %
AddAppSettingsSecretsJson## &
(##& '
)##' (
.$$ 
ConfigureLogging$$ 
($$ 
($$ 
context$$ &
,$$& '
logging$$( /
)$$/ 0
=>$$1 3
logging$$4 ;
.$$; <
ClearProviders$$< J
($$J K
)$$K L
)$$L M
.%% 
ConfigureServices%% 
(%% 
(%%  
hostContext%%  +
,%%+ ,
services%%- 5
)%%5 6
=>%%7 9
{&& 
services'' 
.'' 
AddHostedService'' )
<'') *#
DbMigratorHostedService''* A
>''A B
(''B C
)''C D
;''D E
}(( 
)(( 
;(( 
})) ¥
zD:\PROJECTS\.NET\ABP Framework\SawaTech assign\aspnet-core\src\SawaTech.PropertyMini.DbMigrator\DbMigratorHostedService.cs
	namespace 	
SawaTech
 
. 
PropertyMini 
.  

DbMigrator  *
;* +
public 
class #
DbMigratorHostedService $
:% &
IHostedService' 5
{ 
private 
readonly $
IHostApplicationLifetime -$
_hostApplicationLifetime. F
;F G
private 
readonly 
IConfiguration #
_configuration$ 2
;2 3
public 
#
DbMigratorHostedService "
(" #$
IHostApplicationLifetime# ;#
hostApplicationLifetime< S
,S T
IConfigurationU c
configurationd q
)q r
{ $
_hostApplicationLifetime  
=! "#
hostApplicationLifetime# :
;: ;
_configuration 
= 
configuration &
;& '
} 
public 

async 
Task 

StartAsync  
(  !
CancellationToken! 2
cancellationToken3 D
)D E
{ 
using 
( 
var 
application 
=  
await! &!
AbpApplicationFactory' <
.< =
CreateAsync= H
<H I(
PropertyMiniDbMigratorModuleI e
>e f
(f g
optionsg n
=>o q
{ 	
options 
. 
Services 
.  
ReplaceConfiguration 0
(0 1
_configuration1 ?
)? @
;@ A
options 
. 

UseAutofac 
( 
) 
;  
options 
. 
Services 
. 

AddLogging &
(& '
c' (
=>) +
c, -
.- .

AddSerilog. 8
(8 9
)9 :
): ;
;; <
options 
. '
AddDataMigrationEnvironment .
(. /
)/ 0
;0 1
}   	
)  	 

)  
 
{!! 	
await"" 
application"" 
."" 
InitializeAsync"" -
(""- .
)"". /
;""/ 0
await$$ 
application$$ 
.%% 
ServiceProvider%%  
.&& 
GetRequiredService&& #
<&&# $*
PropertyMiniDbMigrationService&&$ B
>&&B C
(&&C D
)&&D E
.'' 
MigrateAsync'' 
('' 
)'' 
;''  
await)) 
application)) 
.)) 
ShutdownAsync)) +
())+ ,
))), -
;))- .$
_hostApplicationLifetime++ $
.++$ %
StopApplication++% 4
(++4 5
)++5 6
;++6 7
},, 	
}-- 
public// 

Task// 
	StopAsync// 
(// 
CancellationToken// +
cancellationToken//, =
)//= >
{00 
return11 
Task11 
.11 
CompletedTask11 !
;11! "
}22 
}33 