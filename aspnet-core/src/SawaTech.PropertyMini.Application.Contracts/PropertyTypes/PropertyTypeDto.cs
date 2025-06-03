using System;
using Volo.Abp.Application.Dtos;

namespace SawaTech.PropertyMini.PropertyTypes
{
    public class PropertyTypeDto : AuditedEntityDto<Guid>
    {
        public string Name { get; set; }
    }
}


//using System;
//using Volo.Abp.Application.Dtos;

//namespace SawaTech.PropertyMini.PropertyTypes
//{
//    public class PropertyTypeDto
//    {
//        public Guid? Id { get; set; }
//        public string? Name { get; set; }
//    }
//}
