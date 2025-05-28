using System;
using Volo.Abp.Domain.Entities.Auditing;

namespace SawaTech.PropertyMini.Addresses;

public class Address : AuditedAggregateRoot<Guid>
{
    public string Governorate { get; set; } = string.Empty;
    public string District { get; set; } = string.Empty;
    public string Street { get; set; } = string.Empty;
}