using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using SawaTech.PropertyMini.PublicProperties;
using Volo.Abp.Domain.Entities.Auditing;

namespace SawaTech.PropertyMini.NearbyPlaces
{
    public class NearbyPlace : AuditedAggregateRoot<Guid>
    {
        public string Name { get; set; } = string.Empty;
        public string Icon { get; set; } = string.Empty;

        public virtual ICollection<PropertyNearbyPlace> PropertyNearbyPlaces { get; set; } = [];
    }
}