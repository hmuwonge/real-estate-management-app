using System;
using System.Collections.Generic;
using SawaTech.PropertyMini.Addresses;
using SawaTech.PropertyMini.Properties;
using Volo.Abp.Domain.Entities.Auditing;

namespace SawaTech.PropertyMini.PropertyEntities;

public class Property: AuditedAggregateRoot<Guid>
{
    public string Title { get; set; }
    public string Description { get; set; }
    public PropertyType Type { get; set; }
    public PropertyPaymentType PaymentType { get; set; }
    public PropertyStatus Status { get; set; }
    public Guid AddressId { get; set; }
    public Address Address { get; set; }
    public decimal Price { get; set; }
    public decimal InsurancePayment { get; set; }
    public float Area { get; set; }
    public int Rooms { get; set; }
    public double Latitude { get; set; }
    public string Governorate { get; set; }
    public string district { get; set; }
    public string Street { get; set; }
    public double Longitude { get; set; }
    public ICollection<PropertyFeature> Features { get; set; }
    public ICollection<PropertyAmenity> Amenities { get; set; }
    public ICollection<PropertyMedia> Media { get; set; }    
}