using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SawaTech.PropertyMini.PublicProperties;
using Volo.Abp.Data;
using Volo.Abp.Domain.Repositories;

namespace SawaTech.PropertyMini
{

    public class PropertyAppDataSeederContributor : IDataSeedContributor
    {
        private readonly IRepository<Feature, Guid> _propertyFeatureRepository;

        public PropertyAppDataSeederContributor(IRepository<Feature,Guid> repository) 
        {
            _propertyFeatureRepository = repository;
        }
        public async Task SeedAsync(DataSeedContext context)
        {
            if (await _propertyFeatureRepository.GetCountAsync() <= 0) 
            {
                await _propertyFeatureRepository.InsertAsync(
                    new Feature
                    {
                        Name = "Jacuzzi",
                        IconUrl = "hhhhh"
                    },
                    autoSave: true
                    );

                await _propertyFeatureRepository.InsertAsync(
                     new Feature
                     {
                         Name = "Garage",
                         IconUrl = "hhhhh"
                     },
                     autoSave: true
                     );

                await _propertyFeatureRepository.InsertAsync(
                   new Feature
                   {
                       Name = "Big Garden",
                       IconUrl = "hhhhh"
                   },
                   autoSave: true
                   );

                await _propertyFeatureRepository.InsertAsync(
                   new Feature
                   {
                       Name = "Heater",
                       IconUrl = "hhhhh"
                   },
                   autoSave: true
                   );

            }
        }
    }
}
