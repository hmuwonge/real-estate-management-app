using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Caching.Memory;
using SawaTech.PropertyMini.Amenities;
using SawaTech.PropertyMini.AuthResponses;
using SawaTech.PropertyMini.PublicProperties;
using Volo.Abp.Application.Services;
using Volo.Abp.Domain.Repositories;
using Volo.Abp.ObjectMapping;

namespace SawaTech.PropertyMini.PropertyAmenities
{
    //[Authorize]
    public class AmenityAppService: ApplicationService, IAmenityAppService
    {
        private readonly IRepository<Amenity, Guid> _repository;
        private readonly IHttpContextAccessor httpContextAccessor;
        private readonly IMemoryCache _cache;

        public AmenityAppService(
            IRepository<Amenity, Guid> repository,
            IMemoryCache cache, 
            IHttpContextAccessor httpContextAccessor)
        {
            _repository = repository;
            this.httpContextAccessor = httpContextAccessor;
            _cache = cache;
        }

        public async  Task<GeneralResponse> CreateAsync([FromForm] CreateUpdateAmenityDto input)
        {
            try
            {
                var uploadsPath = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", "uploads");

                if (!Directory.Exists(uploadsPath))
                    Directory.CreateDirectory(uploadsPath);

                var request = httpContextAccessor.HttpContext?.Request;
                var baseUrl = $"{request?.Scheme}://{request?.Host}";

                var amenity = new Amenity
                {
                    Name = input.Name
                };

                if (input.Icon != null)
                {
                    // Extracted nested block into SaveMainImageAsync method
                    amenity.Icon = await SaveMainImageAsync(input.Icon, uploadsPath, baseUrl);
                }
                await _repository.InsertAsync(amenity);

                var result = ObjectMapper.Map<Amenity, AmenityDto>(amenity);
                return new GeneralResponse(true, "Successfully created amenity", result);
            }
            catch (Exception ex)
            {
                return new GeneralResponse(false, ex.Message, ex.StackTrace);
            }          
           
        }

        public async Task<GeneralResponse> DeleteAsync(Guid id)
        {
            try
            {
                var amenity = await _repository.GetAsync(id);
                if (amenity == null)
                {
                    return new GeneralResponse(false, "Amenity not found", null);
                }
                await _repository.DeleteAsync(amenity);
                return new GeneralResponse(false, "Amenity deleted successfully", null);
            }
            catch (Exception ex)
            {
                return new GeneralResponse(false, ex.Message, ex.StackTrace);
            }
            

        }

        public async Task<AmenityDto> GetAsync(Guid id)
        {
            var propertyType = await _repository.GetAsync(id);
            return ObjectMapper.Map<Amenity, AmenityDto>(propertyType);
        }

        public async Task<GeneralResponse> GetListAsync()
        {

            const string cacheKey = "PublicPropertyList";

            if (!_cache.TryGetValue(cacheKey, out List<AmenityDto>? cachedList)) // Use nullable type for cachedList  
            {
                var amenities = await _repository.GetListAsync();

                cachedList = ObjectMapper.Map<List<Amenity>, List<AmenityDto>>(amenities);

                // Cache for 5 minutes  
                _cache.Set(cacheKey, cachedList, TimeSpan.FromMinutes(5));
            }

            return new GeneralResponse(true, "Success", cachedList);
        }

        public async Task<AmenityDto> UpdateAsync(Guid id,[FromForm] CreateUpdateAmenityDto input)
        {
            var propertyType = await _repository.GetAsync(id);
            ObjectMapper.Map(input, propertyType);
            return ObjectMapper.Map<Amenity, AmenityDto>(propertyType);
        }

        private static async Task<string> SaveMainImageAsync(IFormFile mainImage, string uploadsPath, string baseUrl)
        {
            var mainFileName = Path.GetFileName(mainImage.FileName);
            var mainUniqueFileName = $"{Guid.NewGuid()}_{mainFileName}";
            var mainFilePath = Path.Combine(uploadsPath, mainUniqueFileName);

            await using (var mainStream = new FileStream(mainFilePath, FileMode.Create))
            {
                await mainImage.CopyToAsync(mainStream);
            }

            return $"{baseUrl}/uploads/amenities/{mainUniqueFileName}";
        }
    }
    
}
