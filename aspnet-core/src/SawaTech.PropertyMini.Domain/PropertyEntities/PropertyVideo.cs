using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SawaTech.PropertyMini.PropertyEntities
{
    public class PropertyVideo
    {
        [Key, ForeignKey("Property")]
        public string Url { get; set; } = string.Empty;
        public Guid PropertyId { get; set; }
        public Property Property { get; set; } = null!;
    }
}
