using System;
using Volo.Abp.Domain.Entities.Auditing;

namespace SawaTech.PropertyMini.Users
{
    public class RefreshTokenInfo : AuditedAggregateRoot<Guid>
    {
        public string? Token { get; set; }
        public Guid UserId {  get; set; }
    }
}
