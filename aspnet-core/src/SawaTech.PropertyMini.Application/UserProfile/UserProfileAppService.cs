using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using SawaTech.PropertyMini.AuthResponses;
using SawaTech.PropertyMini.UserAccount;
using SawaTech.PropertyMini.Users;
using Volo.Abp.Application.Services;
using Volo.Abp.Domain.Repositories;
using Volo.Abp.Users;

namespace SawaTech.PropertyMini.UserProfile
{
    [Authorize]
    public class UserProfileAppService(
        IRepository<AccountUser, Guid> userAccountRepository,
        ICurrentUser currentUser, IHttpContextAccessor httpContextAccessor) : ApplicationService, IUserProflieAppService
    {
        private readonly IRepository<AccountUser, Guid> _userAccountRepository = userAccountRepository;
        private readonly ICurrentUser _currentUser = currentUser;
        private readonly IHttpContextAccessor _httpContextAccessor = httpContextAccessor;

        public async Task<GeneralResponse> UpdateAsync([FromForm] UpdateAccountDto? dto)
        {
            if (dto is null) return new GeneralResponse(false, "Invalid model");

            Console.WriteLine($" user being saved::{_currentUser}");

            var userId = _currentUser.Id;
            if (userId == null) return new GeneralResponse(false, "User not logged in");

            var user = await _userAccountRepository.FindAsync(userId.Value);
            if (user == null) return new GeneralResponse(false, "User not found");

            // Fix for CS8601: Ensure dto.UserName is not null before assignment
            if (dto.UserName != null)
            {
                user.UserName = dto.UserName;
            }

            user.Phone = dto.PhoneNumber;
            user.WhatsApp = dto.WhatsApp;
            user.Country = dto.Country;
            user.CompanyName = dto.CompanyName;
            user.CompanyEmail = dto.CompanyMail;
            user.Department = dto.Department;
            user.JobPosition = dto.JobPosition;

            var profilePicture = dto.ProfilePicture;
            if (profilePicture != null)
            {
                var fileName = Path.GetFileName(profilePicture.FileName);
                var uniqueFileName = $"{Guid.NewGuid()}_{fileName}";
                var uploadsPath = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", "uploads");

                if (!Directory.Exists(uploadsPath))
                    Directory.CreateDirectory(uploadsPath);

                var filePath = Path.Combine(uploadsPath, uniqueFileName);
                using (var stream = new FileStream(filePath, FileMode.Create))
                {
                    await profilePicture.CopyToAsync(stream);
                }

                var request = _httpContextAccessor.HttpContext!.Request;
                var baseUrl = $"{request.Scheme}://{request.Host}";
                user.ProfilePictureUrl = $"{baseUrl}/uploads/{uniqueFileName}";
            }

            await _userAccountRepository.UpdateAsync(user);
            return new GeneralResponse(true, "Profile updated successfully", user);
        }


    }
}
