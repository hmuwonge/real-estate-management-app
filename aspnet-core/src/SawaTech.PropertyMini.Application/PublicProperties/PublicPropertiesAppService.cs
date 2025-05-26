using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Components.Forms;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Internal;
using SawaTech.PropertyMini.EntityFrameworkCore;
using SawaTech.PropertyMini.Properties;
using Volo.Abp.Application.Services;
using Volo.Abp.Domain.Repositories;
using Property = SawaTech.PropertyMini.PropertyEntities.Property;

namespace SawaTech.PropertyMini.PublicProperties;

public class PublicPropertiesAppService: ApplicationService, IPublicPropertyAppService
{
    private readonly IRepository<Property, Guid>    _repository;
    private readonly PropertyMiniDbContext _dbContext;
    public PublicPropertiesAppService(IRepository<Property, Guid>    repository,
        PropertyMiniDbContext dbContext)
    {
        _repository = repository;
        _dbContext = dbContext;
    }
    public async Task<List<PropertyDto>> GetPublicPropertyListAsync()
    {
       var properties = await _repository.GetListAsync();
       return ObjectMapper.Map<List<Property>, List<PropertyDto>>(properties);
    }

    public async Task<PropertyDto> GetPublicPropertyAsync(Guid id)
    {
        var property = await _repository.GetAsync(id);
        return ObjectMapper.Map<Property, PropertyDto>(property);
    }

    public async Task<List<PropertyDto>> GetFilteredPropertiesAsync(PropertyFilterDto filter)
    {
        var query = await _repository.GetQueryableAsync();
        
        var sql = "EXEC sp_FilterProperties @GovernorateId, @PropertType,@MinPrice, @MaxPrice,@MinArea, @MaxArea";
        var result = await _dbContext.Properties
            .FromSqlRaw(sql,
                new SqlParameter("@GovernorateId", filter.GovernorateId ?? (object)DBNull.Value),
                new SqlParameter("@PropertType", filter.Type ?? (object)DBNull.Value),
                new SqlParameter("@MinPrice", filter.MinPrice ?? (object)DBNull.Value),
                new SqlParameter("@MaxPrice", filter.MaxPrice ?? (object)DBNull.Value),
                new SqlParameter("@MinArea", filter.MinArea ?? (object)DBNull.Value),
                new SqlParameter("@MaxArea", filter.MaxArea ?? (object)DBNull.Value),
                new SqlParameter("@Status", filter.Status ?? (object)DBNull.Value),
                new SqlParameter("@Rooms", filter.Rooms ?? (object)DBNull.Value)
            ).ToListAsync();
        
        return ObjectMapper.Map<List<Property>, List<PropertyDto>>(result);
    }
}