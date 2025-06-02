using System;
using System.Collections.Generic;
using SawaTech.PropertyMini.PublicProperties;
using Volo.Abp.Domain.Entities;
using Volo.Abp.Domain.Entities.Auditing;
using Volo.Abp.Identity;

namespace SawaTech.PropertyMini.Users;

public class AccountUser: AuditedAggregateRoot<Guid>
{
    public string Type { get; set; }=string.Empty;
    public required string Email { get; set; }=string.Empty;
    public string UserName { get; set; }=string.Empty;
    public string Password { get; set; } =string.Empty;
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