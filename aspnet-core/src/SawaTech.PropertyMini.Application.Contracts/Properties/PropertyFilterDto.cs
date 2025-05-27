using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SawaTech.PropertyMini.PropertyEntities;

namespace SawaTech.PropertyMini.Properties
{
    public class PropertyFilterDto
    {
        public Guid? GovernorateId { get; set; }
        public string? AddressKeyword { get; set; }
        public decimal? MinPrice { get; set; }
        public decimal? MaxPrice { get; set; }
        public float? MinArea{ get; set; }
        public float? MaxArea { get; set; }
        public string? Location { get; set; }
        public int? Rooms { get; set; }
        public Guid? Type { get; set; }
        public string? Status { get; set; }
    }
}
