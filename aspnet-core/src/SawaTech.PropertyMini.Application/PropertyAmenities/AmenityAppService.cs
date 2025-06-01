using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
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

        public AmenityAppService(IRepository<Amenity, Guid> repository, IHttpContextAccessor httpContextAccessor)
        {
            _repository = repository;
            this.httpContextAccessor = httpContextAccessor;
        }

        public async  Task<GeneralResponse> CreateAsync([FromForm] CreateUpdateAmenityDto input)
        {
            
            //var amenity = ObjectMapper.Map<CreateUpdateAmenityDto, Amenity>(input);

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

        public Task DeleteAsync(Guid id)
        {
            return _repository.DeleteAsync(id);
        }

        public async Task<AmenityDto> GetAsync(Guid id)
        {
            var propertyType = await _repository.GetAsync(id);
            return ObjectMapper.Map<Amenity, AmenityDto>(propertyType);
        }

        public async Task<GeneralResponse> GetListAsync()
        {
            var amenities = await _repository.GetListAsync(); // Await the Task to get the actual List<Amenity>
            var results= ObjectMapper.Map<List<Amenity>, List<AmenityDto>>(amenities);
            return new GeneralResponse(true, "Success", results);
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
