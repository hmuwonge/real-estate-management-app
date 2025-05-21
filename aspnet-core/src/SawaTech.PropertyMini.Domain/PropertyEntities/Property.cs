using System;
using System.Collections.Generic;
using SawaTech.PropertyMini.Addresses;
using SawaTech.PropertyMini.Properties;
using SawaTech.PropertyMini.Users;
using Volo.Abp.Domain.Entities.Auditing;

namespace SawaTech.PropertyMini.PropertyEntities;

public class Property: AuditedAggregateRoot<Guid>
{
    public string Title { get; set; } = string.Empty;
    public Guid OwnerId { get; set; }
    public AccountUser Owner { get; set; } = null!;
    public string Description { get; set; } = string.Empty;
    public PropertyType Type { get; set; }
    public PropertyPaymentType PaymentType { get; set; }
    public PropertyStatus Status { get; set; }
    public string Address { get; set; } = string.Empty;
    public decimal Price { get; set; }
    public decimal InsurancePayment { get; set; }
    public float Area { get; set; }
    public int Rooms { get; set; }
    public double Latitude { get; set; }
    public double Longitude { get; set; }
    public ICollection<PropertyFeature> Features { get; } = [];
    public ICollection<PropertyAmenity> Amenities { get;} = [];
    public ICollection<PropertyImage> PropertyImages { get; } = [];
    public PropertyVideo? PropertyVideo { get; set; }
}