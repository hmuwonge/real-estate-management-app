using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.Extensions.Options;
using SawaTech.PropertyMini.UserAccount;
using SawaTech.PropertyMini.AuthResponses;
using SawaTech.PropertyMini.Helpers;
using SawaTech.PropertyMini.Users;
using Volo.Abp.Application.Services;
using Volo.Abp.Data;
using Volo.Abp.Domain.Repositories;
using SawaTech.PropertyMini.PropertyEntities;
using System.Security.Cryptography;
using Microsoft.IdentityModel.Tokens;
using System.Security.Claims;
using System.IdentityModel.Tokens.Jwt;
using static Volo.Abp.Identity.Settings.IdentitySettingNames;

namespace SawaTech.PropertyMini.UserAccount
{
    public class UserAccountAppService:ApplicationService, IUserAccountAppService
    {
        private readonly IOptions<JwtSection> _config;
        private readonly IRepository<AccountUser, Guid> _userAccountRepository;
        private readonly IRepository<RefreshTokenInfo, Guid> _userRefreshTokenRepository;

        public UserAccountAppService(
            IOptions<JwtSection> config, IRepository<AccountUser, Guid> userAccountRepository,
            IRepository<RefreshTokenInfo, Guid> userRefreshTokenRepository)
        {
            _config = config;
            _userAccountRepository = userAccountRepository;
            _userRefreshTokenRepository = userRefreshTokenRepository;
        }


        public async Task<GeneralResponse> RegisterAsync(CreateUpdateAccountDto user)
        {
            if (user is null) return new GeneralResponse(false, "Model is empty");
            
            var checkUser = await FindUserByEmail(user.Email!);
            Console.WriteLine($"Check user result for {user.Email}: {checkUser?.Email ?? "null"}");
            if (checkUser != null) return new GeneralResponse(false, "User already registered");


            // save user
            var userAccount = new AccountUser
            {
                Type = user.UserType,
                Email =user.Email,
                UserName = user.UserName,
                CompanyEmail = user.CompanyMail,
                CompanyName = user.CompanyName,
                Department = user.Department,
                JobPosition = user.JobPosition,
                Phone = user.PhoneNumber,
                WhatsApp = user.WhatsApp,
                Country = user.Country,
                Password = BCrypt.Net.BCrypt.HashPassword(user.Password),
            };
            await _userAccountRepository.InsertAsync(userAccount);
            return new GeneralResponse(true,"Account created successfully");
        }

        private async Task<AccountUser?> FindUserByEmail(string userEmail)
        {
            if (string.IsNullOrEmpty(userEmail)) return null;
           return await _userAccountRepository.FirstOrDefaultAsync(
               x => x.Email != null  && x.Email.ToLower() == userEmail!.ToLower()
               );

        }
        public async Task<LoginResponse> LoginAsync(LoginDto user)
        {
            if (user is null) return new LoginResponse(false, "Model is empty");

            var checkUser = await FindUserByEmail(user.Email!);
            if (checkUser == null) return new LoginResponse(false, $"{user.Email} User not registered");

            if (!BCrypt.Net.BCrypt.Verify(user.Password!, checkUser.Password!))
                return new LoginResponse(false, "Invalid password");

            // Generate JWT token
            var token = GenerateJwtToken(checkUser);
            var refreshToken = GenerateRefreshToken();

            var findUser = await _userRefreshTokenRepository.FirstOrDefaultAsync(
                x=>x.UserId == checkUser.Id);

            if (findUser is not null)
            {
                findUser!.Token = refreshToken;
                await _userRefreshTokenRepository.UpdateAsync(findUser);
            }
            else
            {
                var refreshTokenInfo = new RefreshTokenInfo
                {
                    UserId = checkUser.Id,
                    Token = refreshToken
                    //ExpirationDate = DateTime.UtcNow.AddDays(30) // Set expiration date for 30 days
                };
                await _userRefreshTokenRepository.InsertAsync(refreshTokenInfo);
            }

            return new LoginResponse(true, "Logged in successfully", token, refreshToken);
        }

        private static string GenerateRefreshToken()
        {
           return Convert.ToBase64String(RandomNumberGenerator.GetBytes(64));
        }

        private string GenerateJwtToken(AccountUser checkUser)
        {

            Console.WriteLine($"Check user result for {_config.Value}");
            if (checkUser == null)
            {
                throw new ArgumentNullException(nameof(checkUser));
            }

            if (string.IsNullOrWhiteSpace(_config?.Value?.Key))
                throw new InvalidOperationException("JWT Key is not configured");

            if (string.IsNullOrWhiteSpace(checkUser.Email)) throw new ArgumentException("User email cannot be null or empty");


                var securityKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_config.Value.Key));
            var credentials = new SigningCredentials(securityKey, SecurityAlgorithms.HmacSha256);

            //var tokenDescriptor = new SecurityTokenDescriptor
            //{
            //    Subject = new System.Security.Claims.ClaimsIdentity(new[]
            //    {
            //        new System.Security.Claims.Claim("id", checkUser.Id.ToString()),
            //        new System.Security.Claims.Claim("email", checkUser.Email),
            //        new System.Security.Claims.Claim("type", checkUser.Type)
            //    }),
            //    Expires = DateTime.UtcNow.AddHours(1),
            //    SigningCredentials = credentials
            //};

            //var tokenHandler = new System.IdentityModel.Tokens.Jwt.JwtSecurityTokenHandler();
            //var token = tokenHandler.CreateToken(tokenDescriptor);

            //var tokenString = tokenHandler.WriteToken(token);
            //return tokenString;

            var userClaims = new List<Claim>
            {
                new Claim(ClaimTypes.NameIdentifier, checkUser.Id.ToString()),
                new Claim(ClaimTypes.Email, checkUser.Email),
                new Claim(ClaimTypes.Name, checkUser.UserName)
            };

            var token = new JwtSecurityToken(
                issuer: _config.Value.Issuer,
                audience: _config.Value.Audience,
                claims: userClaims,
                expires: DateTime.Now.AddDays(30),
                signingCredentials: credentials
                );

            return new JwtSecurityTokenHandler().WriteToken(token);
        }

        public Task<LoginResponse> RefreshTokenAsync(RefreshTokenDto user)
        {
            throw new NotImplementedException();
        }


    }
  
}
