using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SawaTech.PropertyMini.UserAccount;
using SawaTech.PropertyMini.AuthResponses;
using Volo.Abp.Application.Services;

namespace SawaTech.PropertyMini.UserAccount
{
    public class UserAccountAppService:ApplicationService, IUserAccountAppService
    {

        public Task<GeneralResponse> RegisterAsync(CreateUpdateAccountDto user)
        {
            throw new NotImplementedException();
        }
        public Task<LoginResponse> LoginAsync(LoginDto user)
        {
            throw new NotImplementedException();
        }
        public Task<LoginResponse> RefreshTokenAsync(RefreshTokenDto user)
        {
            throw new NotImplementedException();
        }
    }
  
}
