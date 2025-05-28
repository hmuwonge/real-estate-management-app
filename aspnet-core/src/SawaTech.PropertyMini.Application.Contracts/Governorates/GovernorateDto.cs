using System;
using System.ComponentModel.DataAnnotations;
using Volo.Abp.Application.Dtos;

namespace SawaTech.PropertyMini.Governorates
{
    public class GovernorateDto:  AuditedEntityDto<Guid>
    {
        [Required] public string Name { get; set; } = string.Empty;
    }
}