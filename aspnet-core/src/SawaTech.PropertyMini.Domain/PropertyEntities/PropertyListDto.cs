using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace SawaTech.PropertyMini.PropertyEntities
{
    public class PropertyListDto
    {
        public Guid Id { get; set; }
        public string Title { get; set; }
        public decimal Price { get; set; }
        public float Area { get; set; }
        public int Rooms { get; set; }
        public PropertyImageDto MainImage { get; set; }
        public PropertyOwnerDto Owner { get; set; }
        public string Governorate { get; set; }
        public string PropertyType { get; set; }
        public DateTime CreationTime { get; set; }
    }
}
