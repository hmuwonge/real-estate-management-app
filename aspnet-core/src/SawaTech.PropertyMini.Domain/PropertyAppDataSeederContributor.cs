using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SawaTech.PropertyMini.PropertyEntities;
using Volo.Abp.Data;
using Volo.Abp.Domain.Repositories;

namespace SawaTech.PropertyMini
{

    public class PropertyAppDataSeederContributor : IDataSeedContributor
    {
        private readonly IRepository<PropertyFeature, Guid> _propertyFeatureRepository;

        public PropertyAppDataSeederContributor(IRepository<PropertyFeature,Guid> repository) 
        {
            _propertyFeatureRepository = repository;
        }
        public async Task SeedAsync(DataSeedContext context)
        {
            if (await _propertyFeatureRepository.GetCountAsync() <= 0) 
            {
                await _propertyFeatureRepository.InsertAsync(
                    new PropertyFeature
                    {
                        Name = "Jacuzzi",
                        IconUrl = "hhhhh"
                    },
                    autoSave: true
                    );

                await _propertyFeatureRepository.InsertAsync(
                     new PropertyFeature
                     {
                         Name = "Garage",
                         IconUrl = "hhhhh"
                     },
                     autoSave: true
                     );

                await _propertyFeatureRepository.InsertAsync(
                   new PropertyFeature
                   {
                       Name = "Big Garden",
                       IconUrl = "hhhhh"
                   },
                   autoSave: true
                   );

                await _propertyFeatureRepository.InsertAsync(
                   new PropertyFeature
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
