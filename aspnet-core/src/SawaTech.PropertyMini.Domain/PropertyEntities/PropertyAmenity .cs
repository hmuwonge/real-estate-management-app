using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using SawaTech.PropertyMini.Amenities;
using Volo.Abp.Domain.Entities.Auditing;

namespace SawaTech.PropertyMini.PublicProperties
{
    public class PropertyAmenity: AuditedAggregateRoot<Guid>
    {
        public Guid PropertyId { get; set; }
        public Guid AmenityId { get; set; }

        public virtual Property Property { get; set; } = null!;
        public virtual Amenity Amenity { get; set; } = null!;
    }
}
