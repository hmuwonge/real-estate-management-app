using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace SawaTech.PropertyMini.PublicProperties
{
    public class PropertyFilterInput
    {
        public Guid? GovernorateId { get; set; }
        public string? Type { get; set; }
        public decimal? MinPrice { get; set; }
        public decimal? MaxPrice { get; set; }
        public double? MinArea { get; set; }
        public double? MaxArea { get; set; }
    }
}
