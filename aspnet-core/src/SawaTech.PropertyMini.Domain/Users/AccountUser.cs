using System;
using Volo.Abp.Identity;

namespace SawaTech.PropertyMini.Users;

public class AccountUser : IdentityUser
{
    public UserType Type { get; set; }
    public string? CompanyName { get; set; }
    public string? CompanyEmail { get; set; }
    public string? Department { get; set; }
    public string? JobPosition { get; set; }
    public string? Phone { get; set; }
    public string? WhatsApp { get; set; }
    public string? Country { get; set; }
    public string? ProfilePictureUrl { get; set; }
}


public enum UserType
{
    Agent,Visitor
}