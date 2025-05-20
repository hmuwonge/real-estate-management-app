using SawaTech.PropertyMini.Samples;
using Xunit;

namespace SawaTech.PropertyMini.EntityFrameworkCore.Domains;

[Collection(PropertyMiniTestConsts.CollectionDefinitionName)]
public class EfCoreSampleDomainTests : SampleDomainTests<PropertyMiniEntityFrameworkCoreTestModule>
{

}
