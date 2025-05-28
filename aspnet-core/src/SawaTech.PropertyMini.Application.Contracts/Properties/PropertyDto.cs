using System.Collections.Generic;
using SawaTech.PropertyMini.PropertyEntities;

namespace SawaTech.PropertyMini.Properties;

public class PropertyDto
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
    public decimal InsurancePayment { get; set; }
    public float Area { get; set; }
    public int NumberOfRooms { get; set; }
    
    // related data
    public PropertyType? Type { get; set; }
    public PropertyStatus PropertyStatus { get; set; }
    
    // amenities
    public List<string>? Amenities { get; set; }
    
    //nearby places
    public List<string>? NearbyPlaces { get; set; }
    
    public List<string>? PhotoUrls { get; set; }
    public string? VideoUrl { get; set; }
    
    public double Latitude { get; set; }
    public double Longitude { get; set; }
    public List<string>? images { get; set; }
}