using System;
using Volo.Abp.Application.Dtos;

namespace SawaTech.PropertyMini.PropertyTypes
{
    public class PropertTypeDto : AuditedEntityDto<Guid>
    {
        public Guid? Id { get; set; }
        public string? Name { get; set; }
    }
}
