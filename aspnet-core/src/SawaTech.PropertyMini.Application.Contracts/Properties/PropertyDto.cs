using System.Collections.Generic;

namespace SawaTech.PropertyMini.Properties;

public class PropertyDto
{
    public string Title { get; set; }
    public string Description { get; set; }
    
    //location properties
    public string Governorate { get; set; }
    public string District { get; set; }
    public string Street { get; set; }
    
    // main property info
    public decimal Price { get; set; }
    public float Area { get; set; }
    public int NumberOfRooms { get; set; }
    
    // related data
    public PropertyType Type { get; set; }
    public PropertyStatus PropertyStatus { get; set; }
    
    // amenities
    public List<string> Amenities { get; set; }
    
    //nearby places
    public List<string> NearbyPlaces { get; set; }
    
    public List<string> PhotoUrls { get; set; }
    public string? VideoUrl { get; set; }
    
    public double Latitude { get; set; }
    public double Longitude { get; set; }
}