using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using SawaTech.PropertyMini.Governorates;

namespace SawaTech.PropertyMini.PropertyEntities
{
    public class PropertyListDto
    {
        public Guid Id { get; set; }
        public string Title { get; set; } = string.Empty;
        public decimal Price { get; set; }
        public float Area { get; set; }
        public int Rooms { get; set; }
        public PropertyImageDto MainImage { get; set; } = null!;
        public PropertyOwnerDto Owner { get; set; }= null!;
        public Governorate Governorate { get; set; }= null!;
        public PropertyType PropertyType { get; set; }= null!;
        public DateTime CreationTime { get; set; }
    }
}
