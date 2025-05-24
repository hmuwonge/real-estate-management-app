using System;
using Volo.Abp.Application.Dtos;

namespace SawaTech.PropertyMini.PropertyTypes
{
    public class PropertyTypeDto : AuditedEntityDto<Guid>
    {
        public string Name { get; set; }
    }
}
