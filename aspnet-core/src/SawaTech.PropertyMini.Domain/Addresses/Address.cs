using System;
using Volo.Abp.Domain.Entities.Auditing;

namespace SawaTech.PropertyMini.Addresses;

public class Address : AuditedAggregateRoot<Guid>
{
    public string Governorate { get; set; }
    public string District { get; set; }
    public string Street { get; set; }
}