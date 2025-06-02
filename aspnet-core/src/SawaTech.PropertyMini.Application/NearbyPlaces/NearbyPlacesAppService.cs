using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SawaTech.PropertyMini.AuthResponses;
using SawaTech.PropertyMini.NearByPlaces;
using SawaTech.PropertyMini.PropertyFeatures;
using SawaTech.PropertyMini.PublicProperties;
using Volo.Abp.Application.Services;
using Volo.Abp.Domain.Repositories;
using Volo.Abp.ObjectMapping;

namespace SawaTech.PropertyMini.NearbyPlaces
{
    public class NearbyPlacesAppService : ApplicationService, INearbyPlacesAppService
    {
        private readonly IRepository<NearbyPlace, Guid> _repository;
        public NearbyPlacesAppService(IRepository<NearbyPlace, Guid> repository)
        {
            _repository = repository;
        }
        public async Task<GeneralResponse> CreateNearbyPlaceAsync(CreateUpdateNearbyPlace input)
        {
            var nearbyPlace = ObjectMapper.Map<CreateUpdateNearbyPlace, NearbyPlace>(input);
            // Here you would typically save the nearbyPlace to a database
             await _repository.InsertAsync(nearbyPlace);
            // For now, we will just return a success response with the created nearby place
            return new GeneralResponse(true, "Nearby place created successfully", nearbyPlace);
        }

        public async Task<GeneralResponse> DeleteNearbyPlaceAsync(Guid id)
        {
            try
            {
                var place = await _repository.GetAsync(id);
                if (place == null)
                {
                    return new GeneralResponse(false, "Neaby Place not found", null);
                }
                await _repository.DeleteAsync(place);

                return new GeneralResponse(true, "Successfully delete place", null);
            }
            catch (Exception ex)
            {
                return new GeneralResponse(false, ex.Message, ex.StackTrace);
            }
            


        }

        public async Task<GeneralResponse> GetNearbyPlaceAsync(Guid id)
        {
            var place = await _repository.GetAsync(id);
            var result = ObjectMapper.Map<NearbyPlace, NearbyPlaceDto>(place);
            if (result != null)
            {

                return new GeneralResponse(true, "Success", result);
            }
            else
            {
                return new GeneralResponse(false, "Failed, Item not found", null);
            }

        }

        public async Task<GeneralResponse> GetNearbyPlacesAsync()
        {
            var nearbyPlaces = await _repository.GetListAsync();
            var places= ObjectMapper.Map<List<NearbyPlace>, List<NearbyPlaceDto>>(
                nearbyPlaces
            );

            return new GeneralResponse(true, "Success", places);
        }

        public async Task<GeneralResponse> UpdateNearbyPlaceAsync(Guid id, CreateUpdateNearbyPlace input)
        {
            var place = await _repository.GetAsync(id);
            place.Name = input.Name;
            await _repository.UpdateAsync(place);
            var updatePlace = ObjectMapper.Map<NearbyPlace, NearbyPlaceDto>(place);
            return new GeneralResponse(true, "Successfully update place", updatePlace);
        }
    }
}
