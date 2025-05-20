using Xunit;

namespace SawaTech.PropertyMini.EntityFrameworkCore;

[CollectionDefinition(PropertyMiniTestConsts.CollectionDefinitionName)]
public class PropertyMiniEntityFrameworkCoreCollection : ICollectionFixture<PropertyMiniEntityFrameworkCoreFixture>
{

}
