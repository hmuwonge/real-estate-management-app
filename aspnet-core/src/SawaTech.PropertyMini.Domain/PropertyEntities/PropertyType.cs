using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Volo.Abp.Domain.Entities.Auditing;

namespace SawaTech.PropertyMini.PublicProperties
{
    public class PropertyType : AuditedAggregateRoot<Guid>
    {
        public string Name { get; set; } = string.Empty;

    }
}
