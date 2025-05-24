using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SawaTech.PropertyMini.PropertyTypes
{
    public class CreateUpdatePropertyTypeDto
    {
        [Required]
        public required string Name { get; set; } = default!;
    }
}
