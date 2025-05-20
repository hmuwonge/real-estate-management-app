using SawaTech.PropertyMini.Samples;
using Xunit;

namespace SawaTech.PropertyMini.EntityFrameworkCore.Applications;

[Collection(PropertyMiniTestConsts.CollectionDefinitionName)]
public class EfCoreSampleAppServiceTests : SampleAppServiceTests<PropertyMiniEntityFrameworkCoreTestModule>
{

}
