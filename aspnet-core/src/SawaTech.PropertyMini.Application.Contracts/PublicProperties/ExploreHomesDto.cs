using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SawaTech.PropertyMini.Governorates;

namespace SawaTech.PropertyMini.PublicProperties
{
    public class ExploreHomesDto
    {
        public Guid Id { get; set; }
        public string MainImage { get; set; } = string.Empty;
        public string GovernorateName { get; set; } = null!;
    }
}
