using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using Microsoft.AspNetCore.Http;
using SawaTech.PropertyMini.PropertyEntities;

namespace SawaTech.PropertyMini.Properties;

public class CreateUpdatePropertyDto
{
    [Required]
    [StringLength(128)]
    public string Title { get; set; }

    public string OwnerId { get; set; }

    [Required]
    [StringLength(128, MinimumLength = 5)]
    public string Title { get; set; } = string.Empty;

    [Required]
    public Guid OwnerId { get; set; }

    [Required]
    [StringLength(2000)]
    public string? Description { get; set; }

    //location properties
    public string Address { get; set; }
    
    // main property info
    [Required]
    public decimal Price { get; set; }
    public decimal InsurancePayment { get; set; }
    public float Area { get; set; }
    public int Rooms { get; set; }
    
    // related data
    [Required]
    public PropertyType Type { get; set; }
    
    [Required]
    public PropertyStatus PropertyStatus { get; set; }
    
    // amenities
    public List<string> Amenities { get; set; }
    
    //nearby places
    public List<string> NearbyPlaces { get; set; }
    
    [Required]
    public List<IFormFile> PhotoUrls { get; set; }
    public IFormFile? VideoUrl { get; set; }
    
    [Required]
    public double Latitude { get; set; }
    [Required]
    public double Longitude { get; set; }
}