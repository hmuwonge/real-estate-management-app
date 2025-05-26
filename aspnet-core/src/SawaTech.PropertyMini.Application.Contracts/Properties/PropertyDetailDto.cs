using System.Collections.Generic;
using SawaTech.PropertyMini.NearByPlaces;
using SawaTech.PropertyMini.PropertyAmenities;
using SawaTech.PropertyMini.PropertyEntities;
using SawaTech.PropertyMini.PropertyFeatures;

namespace SawaTech.PropertyMini.Properties
{
    public class PropertyDetailDto : PropertyListDto
    {
        public string Description { get; set; }
        public string Address { get; set; }
        public decimal InsurancePayment { get; set; }
        public string Status { get; set; }
        public string PaymentType { get; set; }
        public List<PropertyImageDto> Images { get; set; }
        public List<PropertyFeatureDto> Features { get; set; }
        public List<AmenityDto> Amenities { get; set; }
        public List<NearbyPlaceDto> NearbyPlaces { get; set; }
        // public PropertyVideoDto? Video { get; set; }
    }
}
