using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SawaTech.PropertyMini.PublicProperties;

namespace SawaTech.PropertyMini.Properties
{
    public class PropertyFilterDto
    {
        public string? AddressKeyword { get; set; }
        public decimal? MinPrice { get; set; }
        public decimal? MaxPrice { get; set; }
        public string? Location { get; set; }
        public int? Rooms { get; set; }
        public PropertyType? Type { get; set; }
        public PropertyStatus? Status { get; set; }
    }
}
