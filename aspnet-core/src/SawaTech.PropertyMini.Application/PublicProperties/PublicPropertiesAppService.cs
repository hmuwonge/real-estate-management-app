using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Components.Forms;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Internal;
using Microsoft.Extensions.Caching.Memory;
using SawaTech.PropertyMini.AuthResponses;
using SawaTech.PropertyMini.EntityFrameworkCore;
using SawaTech.PropertyMini.Governorates;
using SawaTech.PropertyMini.Properties;
using SawaTech.PropertyMini.PublicProperties;
using Volo.Abp.Application.Dtos;
using Volo.Abp.Application.Services;
using Volo.Abp.Domain.Repositories;
using Volo.Abp.ObjectMapping;
using Property = SawaTech.PropertyMini.PublicProperties.Property;

namespace SawaTech.PropertyMini.PublicProperties;

public class PublicPropertiesAppService(IMemoryCache cache,
    PropertyMiniDbContext dbContext, IRepository<Property, Guid> _propertyRepository)
    : ApplicationService,
        IPublicPropertyAppService
{
    public async Task<GeneralResponse> GetPublicPropertyListAsync()
    {
        const string cacheKey = "PublicPropertyList";

        if (!cache.TryGetValue(cacheKey, out List<PropertyListDto>? cachedList)) // Use nullable type for cachedList  
        {
            var properties = await dbContext
                .Properties.Include(p => p.PropertyAmenities)
                .ThenInclude(p => p.Amenity)
                .Include(x => x.PropertyType)
                .Include(x => x.PropertyFeatures)
                .Include(x => x.PropertyAmenities)
                .Include(x => x.Owner)
                .Include(x => x.PropertyImages)
                .Include(p => p.PropertyNearbyPlaces)
                .ThenInclude(p => p.NearbyPlace)
                .ToListAsync();

            cachedList = ObjectMapper.Map<List<Property>, List<PropertyListDto>>(properties);

            // Cache for 5 minutes  
            cache.Set(cacheKey, cachedList, TimeSpan.FromMinutes(5));
        }

        return new GeneralResponse(true, "Success", cachedList);
    }


    public async Task<GeneralResponse> GetPublicPropertyAsync(Guid id)
    {
        string cacheKey = $"PublicProperty_{id}";

        if (!cache.TryGetValue(cacheKey, out PropertyListDto? result)) // Use nullable type for result  
        {
            var property = await dbContext
                .Properties.Include(p => p.PropertyAmenities)
                .ThenInclude(p => p.Amenity)
                .Include(p => p.PropertyImages)
                .Include(p => p.PropertyFeatures)
                .ThenInclude(f => f.Feature)
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

            result = ObjectMapper.Map<Property, PropertyListDto>(property);

            // Cache for 10 minutes  
            cache.Set(cacheKey, result, TimeSpan.FromMinutes(10));
        }

        return new GeneralResponse(true, "Success", result);
    }


    public async Task<GeneralResponse> GetSimilarProperties(Guid propertyId, int maxResults = 5)
    {
        string cacheKey = $"SimilarProperties{propertyId}";
        if (!cache.TryGetValue(cacheKey, out List<PropertyListDto>? results)) // Corrected type for results
        {
            var currentProperty = await _propertyRepository.GetAsync(propertyId);

            var queryable = await _propertyRepository.GetQueryableAsync();

            var data = queryable
                .Where(predicate: p => p.Id != propertyId) // Exclude current property
                .Where(p => p.Status == "Rent") // Only available properties
                .Where(p => p.GovernorateId == currentProperty.GovernorateId) // Same governorate
                .Where(p => p.PropertyTypeId == currentProperty.PropertyTypeId) // Same type
                .Where(p => p.Price >= currentProperty.Price * 0.8m &&
                            p.Price <= currentProperty.Price * 1.2m) // Price within ±20%
                .Where(p => p.Area >= currentProperty.Area * 0.8f &&
                            p.Area <= currentProperty.Area * 1.2f) // Area within ±20%
                .OrderBy(p => Math.Abs(p.Price - currentProperty.Price)) // Closest price first
                .ThenBy(p => Math.Abs(p.Area - currentProperty.Area)) // Then closest size
                .Include(p => p.PropertyAmenities)
                .ThenInclude(p => p.Amenity)
                .Take(maxResults)
                .ToList();

            results = ObjectMapper.Map<List<Property>, List<PropertyListDto>>(data); // Corrected mapping to handle List<Property>

            // Cache for 10 minutes  
            cache.Set(cacheKey, results, TimeSpan.FromSeconds(5));
        }


        return new GeneralResponse(true, "Success", results);
    }

    public async Task<GeneralResponse> GetFilteredPropertiesAsync(PropertyFilterDto filter)
    {
        try
        {
            var sql =
                "EXEC sp_FilterProperties @GovernorateId, @PropertType,@MinPrice, @MaxPrice,@MinArea, @MaxArea";
            var result = await dbContext
                .Properties.FromSqlRaw(
                    sql,
                    new SqlParameter(
                        "@GovernorateId",
                        filter.GovernorateId ?? (object)DBNull.Value
                    ),
                    new SqlParameter("@PropertType", filter.Type ?? (object)DBNull.Value),
                    new SqlParameter("@MinPrice", filter.MinPrice ?? (object)DBNull.Value),
                    new SqlParameter("@MaxPrice", filter.MaxPrice ?? (object)DBNull.Value),
                    new SqlParameter("@MinArea", filter.MinArea ?? (object)DBNull.Value),
                    new SqlParameter("@MaxArea", filter.MaxArea ?? (object)DBNull.Value),
                    new SqlParameter("@Status", filter.Status ?? (object)DBNull.Value),
                    new SqlParameter("@Rooms", filter.Rooms ?? (object)DBNull.Value)
                )
                .ToListAsync();

            var finalResult = ObjectMapper.Map<List<Property>, List<Properties.PropertyDto>>(result);
            return new GeneralResponse(true, "success", finalResult);
        }
        catch (Exception ex)
        {
            return new GeneralResponse(false, ex.Message, ex.StackTrace);
        }
    }

    public async Task<GeneralResponse> GetExploreHomePropertyListAsync()
    {
        try
        {
            var properties = await dbContext.Properties.Include(p => p.Governorate).ToListAsync();

            var list = ObjectMapper.Map<List<Property>, List<ExploreHomesDto>>(properties);
            return new GeneralResponse(true, "success", list);
        }
        catch (Exception ex)
        {
            return new GeneralResponse(false, ex.Message, ex.StackTrace);
        }
    }

    public async Task<GeneralResponse> GetListBuyRentAsync(
     PropertyFilterDto? filterDto = null,
     string? sortBy = null,
     bool sortDescending = false,
     int? maxResults = 10)
    {
        // 1. Get base queryable
        var queryable = (await _propertyRepository.GetQueryableAsync()).AsQueryable();

        // 2. Apply filters
        if (filterDto != null)
        {
            // Governorate filter with proper null/empty check
            if (filterDto.GovernorateId.HasValue && filterDto.GovernorateId.Value != Guid.Empty)
            {
                queryable = queryable.Where(p => p.GovernorateId == filterDto.GovernorateId.Value);
            }

            if (!string.IsNullOrWhiteSpace(filterDto.Status))
            {
                queryable = queryable.Where(p => p.Status.Contains(filterDto.Status));
            }

            // Rooms filter
            if (filterDto.Rooms.HasValue && filterDto.Rooms.Value > 0)
            {
                queryable = queryable.Where(p => p.Rooms == filterDto.Rooms.Value);
            }

            // Price range filters
            if (filterDto.MinPrice.HasValue)
            {
                queryable = queryable.Where(p => p.Price >= filterDto.MinPrice.Value);
            }

            if (filterDto.MaxPrice.HasValue)
            {
                queryable = queryable.Where(p => p.Price <= filterDto.MaxPrice.Value);
            }

            // Area range filters
            if (filterDto.MinArea.HasValue)
            {
                queryable = queryable.Where(p => p.Area >= filterDto.MinArea.Value);
            }

            if (filterDto.MaxArea.HasValue)
            {
                queryable = queryable.Where(p => p.Area <= filterDto.MaxArea.Value);
            }
        }

        // 3. Apply sorting FIRST (before pagination)
        queryable = (string.IsNullOrWhiteSpace(sortBy) ? "Price" : sortBy.ToLower()) switch
        {
            "price" => sortDescending
                ? queryable.OrderByDescending(p => p.Price)
                : queryable.OrderBy(p => p.Price),

            "address" => sortDescending
                ? queryable.OrderByDescending(p => p.Address)
                : queryable.OrderBy(p => p.Address),

            "rooms" => sortDescending
                ? queryable.OrderByDescending(p => p.Rooms)
                : queryable.OrderBy(p => p.Rooms),

            _ => queryable.OrderBy(p => p.Price), // Default sorting by Price
        };

        // 4. Apply maxResults (pagination) AFTER sorting
        if (maxResults.HasValue && maxResults > 0)
        {
            queryable = queryable.Take(maxResults.Value);
        }

        // 5. Execute query and map results
        var properties = await AsyncExecuter.ToListAsync(queryable);
        var results = ObjectMapper.Map<List<Property>, List<PropertyListDto>>(properties);

        return new GeneralResponse(true, "Properties retrieved successfully", results);
    }
}
