using System;
using System.Collections.Generic;
using Volo.Abp.Domain.Entities.Auditing;

namespace SawaTech.PropertyMini.PublicProperties;

public class PropertyFeature: AuditedAggregateRoot<Guid>
{
    public Guid PropertyId { get; set; }
    public Property Property { get; set; } = null!;

    public Guid FeatureId { get; set; }
    public Feature Feature { get; set; } = null!;
}