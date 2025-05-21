using System;
using Volo.Abp.Domain.Entities.Auditing;

namespace SawaTech.PropertyMini.PropertyEntities;

public class PropertyAmenity : AuditedAggregateRoot<Guid>
{
    public string Name { get; set; } = string.Empty;
}