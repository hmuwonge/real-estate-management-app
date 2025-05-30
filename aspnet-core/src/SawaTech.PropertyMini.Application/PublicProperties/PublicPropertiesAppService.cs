using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Components.Forms;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Internal;
using SawaTech.PropertyMini.AuthResponses;
using SawaTech.PropertyMini.EntityFrameworkCore;
using SawaTech.PropertyMini.Governorates;
using SawaTech.PropertyMini.Properties;
using SawaTech.PropertyMini.PublicProperties;
using Volo.Abp.Application.Services;
using Volo.Abp.Domain.Repositories;
using Property = SawaTech.PropertyMini.PublicProperties.Property;

namespace SawaTech.PropertyMini.PublicProperties;

public class PublicPropertiesAppService(
    PropertyMiniDbContext dbContext)
    : ApplicationService, IPublicPropertyAppService
{
    public async Task<GeneralResponse> GetPublicPropertyListAsync()
    {
       var properties =await  dbContext.Properties
            .Include(p => p.PropertyAmenities)
            .ThenInclude(p => p.Amenity)
            .Include(x => x.PropertyType)
            .Include(x => x.PropertyFeatures)
            .Include(x => x.PropertyAmenities)
            .Include(x => x.Owner)
            .Include(x => x.PropertyImages)
            .Include(p => p.PropertyNearbyPlaces)
            .ThenInclude(p => p.NearbyPlace)
            .ToListAsync();

        
        var list= ObjectMapper.Map<List<Property>, List<PropertyListDto>>(properties);
        return new GeneralResponse(true, "success", list);

    }



    public async Task<GeneralResponse> GetPublicPropertyAsync(Guid id)
    {
        try
        {
            var property = await dbContext.Properties
                .Include(p => p.PropertyAmenities)
                .ThenInclude(p => p.Amenity)
                .Include(p => p.PropertyImages)
                .Include(p => p.PropertyFeatures)
                .Include(p => p.PropertyType)
                .Include(p => p.PropertyNearbyPlaces)
                .ThenInclude(p => p.NearbyPlace)
                .Include(p => p.Owner)
                .Include(p => p.Governorate)
                .FirstOrDefaultAsync(p => p.Id == id);

            if (property == null)
            {
                return new GeneralResponse(false, "Property not found", null);
            }

            var result = ObjectMapper.Map<Property, PropertyListDto>(property);
            return new GeneralResponse(true, "success", result);
        }
        catch (Exception ex)
        {
            return new GeneralResponse(false, ex.Message, ex.StackTrace);
        }
    }

    public async Task<List<PropertyDto>> GetFilteredPropertiesAsync(PropertyFilterDto filter)
    {
        
        var sql = "EXEC sp_FilterProperties @GovernorateId, @PropertType,@MinPrice, @MaxPrice,@MinArea, @MaxArea";
        var result = await dbContext.Properties
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

    public async Task<GeneralResponse> GetExploreHomePropertyListAsync()
    {
        try
        {
            var properties = await dbContext.Properties.Include(p=>p.Governorate).ToListAsync();


            var list = ObjectMapper.Map<List<Property>, List<ExploreHomesDto>>(properties);
            return new GeneralResponse(true, "success", list);
        }
        catch (Exception ex)
        {
            return new GeneralResponse(false, ex.Message, ex.StackTrace);
        }
    }
}