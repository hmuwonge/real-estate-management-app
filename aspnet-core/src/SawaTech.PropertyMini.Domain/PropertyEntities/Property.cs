using System;
using System.Collections.Generic;
using System.Text.Json.Serialization;
using SawaTech.PropertyMini.Addresses;
using SawaTech.PropertyMini.Amenities;
using SawaTech.PropertyMini.Properties;
using SawaTech.PropertyMini.Users;
using Volo.Abp.Domain.Entities.Auditing;
using SawaTech.PropertyMini.NearbyPlaces;
using SawaTech.PropertyMini.Governorates;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;

namespace SawaTech.PropertyMini.PublicProperties;

public class Property : AuditedAggregateRoot<Guid>
{
    public string Title { get; set; } = string.Empty;
    public Guid OwnerId { get; set; }
    public Guid GovernorateId { get; set; }

    public AccountUser Owner { get;} = null!;
    public string? Description { get; set; } = string.Empty;
    public Guid PropertyTypeId { get; set; }

    public PropertyType? PropertyType { get; } = null!;
    public string? PaymentType { get; set; } = string.Empty;
    public string Status { get; set; } = string.Empty;
    public string Address { get; set; } = string.Empty;
    public string MainImage { get; set; } = string.Empty;
    public decimal Price { get; set; }
    public decimal InsurancePayment { get; set; }
    public float Area { get; set; }
    public int Rooms { get; set; }
    public double Latitude { get; set; }
    public double Longitude { get; set; }

    [JsonIgnore]
    public virtual ICollection<PropertyAmenity> PropertyAmenities { get; set; } = [];
    
    [JsonIgnore]
    public virtual ICollection<PropertyFeature> PropertyFeatures { get; set; } = [];

    [NotMapped]
    public List<Amenity>? Amenities => PropertyAmenities?.Select(static pa => pa.Amenity).ToList();
    
    [NotMapped]
    public List<Feature>? Features => PropertyFeatures?.Select(pa => pa.Feature).ToList();

    [JsonIgnore]
    public List<PropertyImage> PropertyImages { get; } = [];

    [JsonIgnore]
    public PropertyVideo? PropertyVideo { get; set; }

    public virtual ICollection<PropertyNearbyPlace> PropertyNearbyPlaces { get; set; } = null!;
    public Governorate Governorate { get; set; } = null!;
}
