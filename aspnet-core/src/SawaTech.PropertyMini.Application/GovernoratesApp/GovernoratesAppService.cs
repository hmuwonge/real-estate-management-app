using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using SawaTech.PropertyMini.AuthResponses;
using SawaTech.PropertyMini.Governorates;
using Volo.Abp.Application.Services;
using Volo.Abp.Domain.Repositories;

namespace SawaTech.PropertyMini.GovernoratesApp
{
    public class GovernoratesAppService(IRepository<Governorate, Guid> repository)
        : ApplicationService, IGovernorateAppService
    {
        public async Task<GeneralResponse> CreateAsync(CreateUpdateGovernorateDto input)
        {
            try
            {
                var existingGovernorate = await repository.FirstOrDefaultAsync(g => g.Name == input.Name);
                if (existingGovernorate != null)
                {
                    return new GeneralResponse(
                        false,
                        "Governorate with this name already exists",
                        null
                    );
                }
                var governorate = new Governorate
                {
                    Name =  (input.Name).Trim()
                };
                await repository.InsertAsync(governorate);
                return new GeneralResponse(
                    true,
                    "Governorate created successfully",
                    ObjectMapper.Map<Governorate, GovernorateDto>(governorate)
                );
            }
            catch (Exception ex)
            {
                return new GeneralResponse(
                    false,
                    ex.Message,
                    ex.StackTrace
                );
               
            }

            }

        public async Task<GeneralResponse> DeleteAsync(Guid id)
        {
            try
            {
                var governorate = await repository.GetAsync(id);
                if (governorate == null)
                {
                    return new GeneralResponse(
                        false,
                        "Property governorate not found",
                        null
                    );
                }
                await repository.DeleteAsync(governorate);
                return new GeneralResponse(
                    true,
                    "Governorate deleted successfully",
                    null
                );
            }
            catch (Exception ex)
            {
                return new GeneralResponse(
                    false,
                    ex.Message,
                    ex.StackTrace
                );
            }
        }

        public async Task<GovernorateDto> GetAsync(Guid id)
        {
            var governorate = await repository.GetAsync(id);
            return ObjectMapper.Map<Governorate, GovernorateDto>(governorate);
        }

        public async Task<GeneralResponse> GetListAsync()
        {
            try
            {
                var governorates = await repository.GetListAsync();
                var list = ObjectMapper.Map<List<Governorate>, List<GovernorateDto>>(governorates);
                return new GeneralResponse(true, "success", list);
            }
            catch (Exception ex)
            {
                return new GeneralResponse(
                    false,
                    ex.Message,
                    ex.StackTrace
                );
            }
              
        }

        public async Task<GovernorateDto> UpdateAsync(Guid id, CreateUpdateGovernorateDto input)
        {
             var governorate = await repository.GetAsync(id);
            governorate.Name = input.Name;
            await repository.UpdateAsync(governorate);
            return ObjectMapper.Map<Governorate, GovernorateDto>(governorate);
        }
    }
}
