using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace SawaTech.PropertyMini.PropertyEntities
{
    public class PropertyImageDto
    {
        public Guid Id { get; set; }
        public string Url { get; set; }
        public bool IsMain { get; set; }
        public int SortOrder { get; set; }
        public string FullUrl { get; set; } // computed URL
    }
}
