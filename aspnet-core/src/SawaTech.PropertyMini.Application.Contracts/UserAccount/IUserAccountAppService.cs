using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using SawaTech.PropertyMini.AuthResponses;
using Volo.Abp.Application.Services;

namespace SawaTech.PropertyMini.UserAccount
{
    public interface IUserAccountAppService: IApplicationService
    {
        Task<GeneralResponse> RegisterAsync([FromForm] CreateUpdateAccountDto? user );
        Task<GeneralResponse> UpdateAsync([FromForm] CreateUpdateAccountDto? user );
        Task<LoginResponse> LoginAsync(LoginDto? user);
        Task<LoginResponse> RefreshTokenAsync(RefreshTokenDto user);
    }
   
}
