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
            try
            {
                if (string.IsNullOrWhiteSpace(input.Name))
                {
                    return new GeneralResponse(false, "Name is required", null);
                }
                var place = new NearbyPlace
                {
                    Name = input.Name,
                    Icon = input.Icon
                };
                await _repository.InsertAsync(place);
                var createdPlace = ObjectMapper.Map<NearbyPlace, NearbyPlaceDto>(place);
                return new GeneralResponse(true, "Successfully created place", createdPlace);

            }
            catch (Exception ex)
            {
                return new GeneralResponse(false, ex.Message, ex.StackTrace);
            }
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
            try
            {
                if (id == Guid.Empty)
                {
                    return new GeneralResponse(false, "Id is required", null);
                }
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
            catch (Exception ex)
            {
                return new GeneralResponse(false, ex.Message, ex.StackTrace);
                var place = await _repository.GetAsync(id);
            }

        }

        public async Task<GeneralResponse> GetNearbyPlacesAsync()
        {
            try
            {
                var nearbyPlaces = await _repository.GetListAsync();
                var places = ObjectMapper.Map<List<NearbyPlace>, List<NearbyPlaceDto>>(
                    nearbyPlaces
                );

                return new GeneralResponse(true, "Success", places);
            }
            catch (Exception ex)
            {
                return new GeneralResponse(false, ex.Message, ex.StackTrace);
            }

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
