using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using SawaTech.PropertyMini.AuthResponses;
using SawaTech.PropertyMini.UserAccount;
using Volo.Abp.Application.Services;

namespace SawaTech.PropertyMini.UserProfile

{
    public interface IUserProflieAppService : IApplicationService
    {
        Task<GeneralResponse> UpdateAsync([FromForm] UpdateAccountDto? user);
    }

   
}
