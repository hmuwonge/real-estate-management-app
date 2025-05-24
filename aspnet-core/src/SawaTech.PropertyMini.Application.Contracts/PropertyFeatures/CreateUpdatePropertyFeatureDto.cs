using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SawaTech.PropertyMini.PropertyFeatures
{
    public class CreateUpdatePropertyFeaturesDto
    {
        [Required]
        public required string Name { get; set; }
        public required string IconUrl { get; set; }
    }
}
