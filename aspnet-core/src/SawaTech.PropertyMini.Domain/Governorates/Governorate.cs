using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using SawaTech.PropertyMini.PublicProperties;
using Volo.Abp.Domain.Entities.Auditing;

namespace SawaTech.PropertyMini.Governorates
{
    public class Governorate : AuditedAggregateRoot<Guid>
    {
        public required string Name { get; set; }
        public ICollection<Property> Property { get; set; } = [];
    }
}