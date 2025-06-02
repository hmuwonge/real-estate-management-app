using System;
using SawaTech.PropertyMini.Properties;
using Volo.Abp.Domain.Entities.Auditing;

namespace SawaTech.PropertyMini.PublicProperties;

public class PropertyImage : AuditedAggregateRoot<Guid>
{
    public string Url { get; set; } = string.Empty;
    public MediaTypeEnum? MediaType { get; set; }
    public Guid PropertyId { get; set; }
    public Property? Property { get; set; }
}