using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using SawaTech.PropertyMini.NearbyPlaces;

namespace SawaTech.PropertyMini.PublicProperties
{
    public class PropertyNearbyPlace
    {
        public Guid PropertyId { get; set; }
        public Property Property { get; set; }= null!;

        public Guid NearbyPlaceId { get; set; }
        public NearbyPlace NearbyPlace { get; set; }= null!;
    }

    
}