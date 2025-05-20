using System;
using SawaTech.PropertyMini.Properties;
using Volo.Abp.Domain.Entities.Auditing;

namespace SawaTech.PropertyMini.PropertyEntities;

public class PropertyMedia : AuditedAggregateRoot<Guid>
{
    public string Url { get; set; }
    public MediaTypeEnum MediaType { get; set; }
}