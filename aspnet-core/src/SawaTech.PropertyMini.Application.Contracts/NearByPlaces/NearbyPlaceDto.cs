using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace SawaTech.PropertyMini.NearByPlaces
{
    public class NearbyPlaceDto
    {
        public Guid Id { get; set; }
        public string Name { get; set; } = string.Empty;
        public string Icon { get; set; } = string.Empty;
    }
}