using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using SawaTech.PropertyMini.Governorates;
using Volo.Abp.Application.Services;
using Volo.Abp.Domain.Repositories;

namespace SawaTech.PropertyMini.GovernoratesApp
{
    public class GovernoratesAppService : ApplicationService, IGovernorateAppService
    {
        private readonly IRepository<Governorate, Guid> _repository;

        public GovernoratesAppService(IRepository<Governorate, Guid> repository)
        {
            _repository = repository;
        }

        public async Task<GovernorateDto> CreateAsync(CreateUpdateGovernorateDto input)
        {
            var governorate = new Governorate { Name = input.Name };
            await _repository.InsertAsync(governorate);
            return ObjectMapper.Map<Governorate, GovernorateDto>(governorate);
        }

        public async Task DeleteAsync(Guid id)
        {
            var governorate = await _repository.GetAsync(id);
            if (governorate == null)
            {
                throw new Exception("Property governorate not found");
            }
            await _repository.DeleteAsync(governorate);
        }

        public async Task<GovernorateDto> GetAsync(Guid id)
        {
            var governorate = await _repository.GetAsync(id);
            return ObjectMapper.Map<Governorate, GovernorateDto>(governorate);
        }

        public async Task<List<GovernorateDto>> GetListAsync()
        {
            var governorates = await _repository.GetListAsync();
            return ObjectMapper.Map<List<Governorate>, List<GovernorateDto>>(governorates);
        }

        public async Task<GovernorateDto> UpdateAsync(Guid id, CreateUpdateGovernorateDto input)
        {
             var governorate = await _repository.GetAsync(id);
            governorate.Name = input.Name;
            await _repository.UpdateAsync(governorate);
            return ObjectMapper.Map<Governorate, GovernorateDto>(governorate);
        }
    }
}
