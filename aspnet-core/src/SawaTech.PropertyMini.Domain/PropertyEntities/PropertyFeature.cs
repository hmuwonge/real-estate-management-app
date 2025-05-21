using System;
using Volo.Abp.Domain.Entities.Auditing;

namespace SawaTech.PropertyMini.PropertyEntities;

public class PropertyFeature: AuditedAggregateRoot<Guid>
{
    public string Name { get; set; } = string.Empty;
    public string IconUrl { get; set; } = string.Empty;
}