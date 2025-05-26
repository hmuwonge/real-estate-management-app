using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SawaTech.PropertyMini.PropertyAmenities
{
    public class CreateUpdateAmenityDto
    {
        [Required]
        public  string Name { get; set; } = default!;
    }
}
