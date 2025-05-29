using System;
using System.ComponentModel.DataAnnotations;
using Microsoft.AspNetCore.Http;

namespace SawaTech.PropertyMini.UserAccount
{
    public class CreateUpdateAccountDto: AccountBase
    {
        public Guid Id { get; set; } 
        [Required]
        [MaxLength(100)]
        [MinLength(3)]
        public string UserName { get; set; } = null!;

        public string UserType { get; set; } = string.Empty;

        //[DataType(DataType.Password)]
        //[Required]
        //public string? Password { get; set; }


        [DataType(DataType.Password)]
        [Compare(nameof(Password))]
        [Required]
        public string? ConfirmPassword { get; set; }


        //[DataType(DataType.EmailAddress)]
        //[Required]
        //public string? Email { get; set; }

        public string? PhoneNumber { get; set; }
        public string? WhatsApp { get; set; }
        public string? Country { get; set; }
        public IFormFile? ProfilePicture { get; set; }
        public string? CompanyName { get; set; }
        public string? CompanyMail { get; set; }
        public string? Department { get; set; }
        public string? JobPosition { get; set; }

    }
}
