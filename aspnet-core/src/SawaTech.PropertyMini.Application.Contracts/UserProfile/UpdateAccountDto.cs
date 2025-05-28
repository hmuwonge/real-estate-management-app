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
