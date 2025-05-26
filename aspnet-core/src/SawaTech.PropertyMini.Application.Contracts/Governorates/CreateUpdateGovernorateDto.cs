using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace SawaTech.PropertyMini.Governorates
{
    public class CreateUpdateGovernorateDto
    {
        [Required]
        public string? Name { get; set; } = string.Empty;
    }
}