using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using SawaTech.PropertyMini.Amenities;
using SawaTech.PropertyMini.Governorates;
using SawaTech.PropertyMini.NearByPlaces;
using SawaTech.PropertyMini.PropertyAmenities;

namespace SawaTech.PropertyMini.PublicProperties
{
    public class PropertyListDto
    {
        public Guid Id { get; set; }
        public string Title { get; set; } = string.Empty;
        public decimal Price { get; set; }
        public float Area { get; set; }
        public int Rooms { get; set; }
        public string MainImage { get; set; } =string.Empty;
        public PropertyOwnerDto Owner { get; set; }= null!;
        public GovernorateDetailDto Governorate { get; set; }= null!;
        public PropertyType PropertyType { get; set; }= null!;
        public List<Amenity> Amenities { get; set; } = [];
        public List<NearbyPlaceDto> PropertyNearbyPlaces { get; set; } = null!;
        public List<PropertyImageDto> PropertyImages { get; set; } = [];
        public DateTime CreationTime { get; set; }
    }
}
