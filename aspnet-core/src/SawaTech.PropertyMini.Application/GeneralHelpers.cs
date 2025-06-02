using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;

namespace SawaTech.PropertyMini
{
    public class GeneralHelpers
    {
        public  async Task<string> SaveMainImageAsync(IFormFile mainImage, string uploadsPath, string baseUrl)
        {
            var mainFileName = Path.GetFileName(mainImage.FileName);
            var mainUniqueFileName = $"{Guid.NewGuid()}_{mainFileName}";
            var mainFilePath = Path.Combine(uploadsPath, mainUniqueFileName);

            await using (var mainStream = new FileStream(mainFilePath, FileMode.Create))
            {
                await mainImage.CopyToAsync(mainStream);
            }

            return $"{baseUrl}/uploads/{mainUniqueFileName}";
        }
    }
}
