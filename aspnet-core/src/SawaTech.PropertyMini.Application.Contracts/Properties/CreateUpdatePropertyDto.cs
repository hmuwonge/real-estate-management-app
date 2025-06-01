using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using Microsoft.AspNetCore.Http;
using SawaTech.PropertyMini.PublicProperties;

namespace SawaTech.PropertyMini.Properties;

public class CreateUpdatePropertyDto
{
    [Required]
    public Guid PropertyTypeId { get; set; } = Guid.NewGuid();

    [Required]
    public Guid GovernorateId { get; set; }

    [Required]
    [StringLength(128, MinimumLength = 5)]
    public string Title { get; set; } = string.Empty;

    [Required]
    public Guid OwnerId { get; set; }

    [Required]
    [StringLength(2000)]
    public string? Description { get; set; }

    //location properties
    public string? Address { get; set; } =string.Empty;
    public string? PaymentType { get; set; } =string.Empty;

    // main property info
    [Required]
    [Range(0, double.MaxValue)]
    public decimal Price { get; set; }
    
    public decimal InsurancePayment { get; set; }
    
    public float Area { get; set; }

    [Range(0, 1000)]
    public int Rooms { get; set; }

    [Required]
    public PropertyStatus Status { get; set; }

    // amenities
    public List<string>? Amenities { get; set; } = new List<string>();
    public List<string>? Features { get; set; } = [];

    //nearby places
    public List<string>? NearbyPlaces { get; set; } = [];

    [Required]
    public required IFormFile MainImage {  get; set; }

    [Required]
    public List<IFormFile>? PhotoUrls { get; set; }
    public IFormFile? VideoUrl { get; set; }

    [Required]
    public double Latitude { get; set; }

    [Required]
    public double Longitude { get; set; }
}
