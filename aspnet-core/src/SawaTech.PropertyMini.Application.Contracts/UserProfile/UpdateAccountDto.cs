using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;

namespace SawaTech.PropertyMini.UserProfile
{
    public class UpdateAccountDto
    {
        //[Required]
        public Guid Id { get; set; }
        [DataType(DataType.EmailAddress)]
        [EmailAddress]
        public string Email { get; set; } = string.Empty;

        [DataType(DataType.Password)]
        public string Password { get; set; } = String.Empty;

        [MaxLength(100), MinLength(3)]
        public string? UserName { get; set; } = null!;

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
