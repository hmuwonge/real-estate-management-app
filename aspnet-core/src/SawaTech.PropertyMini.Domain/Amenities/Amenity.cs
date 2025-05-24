using System;
using Volo.Abp.Domain.Entities.Auditing;

namespace SawaTech.PropertyMini.Amenities;

public class Amenity : AuditedAggregateRoot<Guid>
{
    public string Name { get; set; } = string.Empty;
}