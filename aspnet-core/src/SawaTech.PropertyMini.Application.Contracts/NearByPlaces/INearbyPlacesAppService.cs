using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SawaTech.PropertyMini.AuthResponses;
using Volo.Abp.Application.Services;

namespace SawaTech.PropertyMini.NearByPlaces
{
    public interface INearbyPlacesAppService: IApplicationService
    {
        Task<GeneralResponse> GetNearbyPlacesAsync();
        Task<GeneralResponse> GetNearbyPlaceAsync(Guid id);
        Task<GeneralResponse> CreateNearbyPlaceAsync(CreateUpdateNearbyPlace input);
        Task<GeneralResponse> UpdateNearbyPlaceAsync(Guid id, CreateUpdateNearbyPlace input);
        Task<GeneralResponse> DeleteNearbyPlaceAsync(Guid id);
    }
   
}
