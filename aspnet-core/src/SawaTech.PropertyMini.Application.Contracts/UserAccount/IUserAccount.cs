using System.Threading.Tasks;
using SawaTech.PropertyMini.AuthResponses;
using Volo.Abp.Application.Services;

namespace SawaTech.PropertyMini.UserAccount
{
    public interface IUserAccount:IApplicationService
    {
        Task<GeneralResponse> RegisterAsync(CreateUpdateAccountDto user);
        Task<LoginResponse> LoginAsync(LoginDto user);
        Task<LoginResponse> RefreshTokenAsync(RefreshTokenDto user);
    }
}
