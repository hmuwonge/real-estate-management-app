using System;
using System.Collections.Generic;
using SawaTech.PropertyMini.PropertyEntities;
using Volo.Abp.Domain.Entities;
using Volo.Abp.Domain.Entities.Auditing;
using Volo.Abp.Identity;

namespace SawaTech.PropertyMini.Users;

public class AccountUser: AuditedAggregateRoot<Guid>
{
    public string Type { get; set; }
    public string Email { get; set; }
    public string UserName { get; set; }
    public string Password { get; set; }
    public string? CompanyName { get; set; }
    public string? CompanyEmail { get; set; }
    public string? Department { get; set; }
    public string? JobPosition { get; set; }
    public string? Phone { get; set; }
    public string? WhatsApp { get; set; }
    public string? Country { get; set; }
    public string? ProfilePictureUrl { get; set; }
    public ICollection<Property> Properties { get; set; } = [];
}


public enum UserType
{
    Agent,Visitor
}