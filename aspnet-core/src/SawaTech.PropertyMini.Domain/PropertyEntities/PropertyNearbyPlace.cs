using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using SawaTech.PropertyMini.NearbyPlaces;

namespace SawaTech.PropertyMini.PropertyEntities
{
    public class PropertyNearbyPlace
    {
        public Guid PropertyId { get; set; }
        public Property Property { get; set; }

        public Guid NearbyPlaceId { get; set; }
        public NearbyPlace NearbyPlace { get; set; }
    }

    
}