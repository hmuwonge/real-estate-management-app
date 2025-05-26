using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Volo.Abp.Application.Dtos;

namespace SawaTech.PropertyMini.PropertyAmenities
{
    public class AmenityDto : AuditedEntityDto<Guid>
    {
        public string Name { get; set; } = string.Empty;
    }
}
