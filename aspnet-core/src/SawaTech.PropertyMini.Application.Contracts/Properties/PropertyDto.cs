using System;
using System.Collections.Generic;
using SawaTech.PropertyMini.Amenities;
using SawaTech.PropertyMini.PropertyAmenities;
using SawaTech.PropertyMini.PropertyEntities;
using SawaTech.PropertyMini.PropertyFeatures;
using SawaTech.PropertyMini.PropertyTypes;
using SawaTech.PropertyMini.Users;
using Volo.Abp.Application.Dtos;
using PropertyTypeDto = SawaTech.PropertyMini.PropertyTypes.PropertyTypeDto;

namespace SawaTech.PropertyMini.Properties;

public class PropertyDto : AuditedEntityDto<Guid>
{
    // public Guid Id { get; set; }
    // public string Title { get; set; }
    // public string Description { get; set; }

    // //location properties
    // public string Address { get; set; }

    // // main property info
    // public decimal Price { get; set; }
    // public decimal InsurancePayment { get; set; }
    // public float Area { get; set; }
    // public int NumberOfRooms { get; set; }

    // // related data
    // public PropertyType? PropertType { get; set; }
    // public PropertyStatus PropertyStatus { get; set; }

    // // amenities
    // public List<string>? Amenities { get; set; }

    // //nearby places
    // public List<string>? NearbyPlaces { get; set; }

    // public List<string>? PhotoUrls { get; set; }
    // public string? VideoUrl { get; set; }

    // public double Latitude { get; set; }
    // public double Longitude { get; set; }
    // public List<string>? images { get; set; }
    
    public required string Title { get; set; }
    public required string Description { get; set; }
    
    // Flat relationships (IDs only)
    public Guid OwnerId { get; set; }
    public Guid GovernorateId { get; set; }
    // public Guid TypeId { get; set; }
    
    // Complex objects (when needed)
    public virtual AccountUser Owner { get; set; } = null!;
    public virtual PropertyType PropertyType { get; set; } = null!;
    
    // Collections
    public List<PropertyFeatureDto> Features { get; set; } = null!;
    public List<Amenity> Amenities { get; set; } = null!;
    public List<string> Images { get; set; } = [];
    
    // Location
    public decimal Price { get; set; }
    public float Area { get; set; }
    public int Rooms { get; set; }
    public double Latitude { get; set; }
    public double Longitude { get; set; }
}