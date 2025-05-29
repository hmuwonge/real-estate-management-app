using System;
using System.Collections.Generic;
using Volo.Abp.Domain.Entities.Auditing;

namespace SawaTech.PropertyMini.PublicProperties;

public class Feature: AuditedAggregateRoot<Guid>
{
    public string Name { get; set; } = string.Empty;
    public string IconUrl { get; set; } = string.Empty;

    public ICollection <Property> Properties
    { get; set; } = new List<Property>();
}