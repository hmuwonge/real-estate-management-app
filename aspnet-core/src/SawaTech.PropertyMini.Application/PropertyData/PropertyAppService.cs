using System;
using System.Threading.Tasks;
using SawaTech.PropertyMini.Properties;
using SawaTech.PropertyMini.PropertyEntities;
using Volo.Abp.Application.Dtos;
using Volo.Abp.Application.Services;
using Volo.Abp.Domain.Repositories;

namespace SawaTech.PropertyMini.PropertyData;

public class PropertyAppService : CrudAppService<
    Property,
    PropertyDto,
    Guid,
    PagedAndSortedResultRequestDto,
    CreateUpdatePropertyDto>, IPropertyService
{
    public PropertyAppService(IRepository<Property,Guid> repository) : base(repository)
    {
    }
    public async Task<PropertyDto> GetByIdAsync(Guid id)
    {
        var property = await Repository.GetAsync(id);
        return ObjectMapper.Map<Property, PropertyDto>(property);
    }
    //public async Task<PropertyDto> CreateAsync(CreateUpdatePropertyDto input)
    //{
    //    var property = ObjectMapper.Map<CreateUpdatePropertyDto, Property>(input);
    //    await Repository.InsertAsync(property);
    //    return ObjectMapper.Map<Property, PropertyDto>(property);
    //}

}