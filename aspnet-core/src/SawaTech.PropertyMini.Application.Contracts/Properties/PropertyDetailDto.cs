using System.Collections.Generic;
using SawaTech.PropertyMini.NearByPlaces;
using SawaTech.PropertyMini.PropertyAmenities;
using SawaTech.PropertyMini.PublicProperties;
using SawaTech.PropertyMini.PropertyFeatures;

namespace SawaTech.PropertyMini.Properties
{
    public class PropertyDetailDto : PropertyListDto
    {
        public string Description { get; set; } = string.Empty;
        public string Address { get; set; }= string.Empty;
        public decimal InsurancePayment { get; set; }
        public string Status { get; set; }= string.Empty;
        public new PropertyTypeDto PropertyType { get; set; }= null!;
        public string PaymentType { get; set; }= string.Empty;
        public List<PropertyImageDto> Images { get; set; }= null!;
        public List<PropertyFeatureDto> Features { get; set; }= null!;
        public new List<SinglePropertyAmenityDto> Amenities { get; set; } = null!;
        public List<NearbyPlaceDto> NearbyPlaces { get; set; }= null!;
    }
}
