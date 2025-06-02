using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SawaTech.PropertyMini.NearByPlaces
{
    public class CreateUpdateNearbyPlace
    {
        public required string Name { get; set; }
        public string Icon { get; set; } = string.Empty;
    }
}
