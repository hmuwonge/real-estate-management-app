using System.Linq;
using AutoMapper;
using SawaTech.PropertyMini.Properties;
using SawaTech.PropertyMini.PropertyEntities;

namespace SawaTech.PropertyMini;

public class PropertyMiniApplicationAutoMapperProfile : Profile
{
    public PropertyMiniApplicationAutoMapperProfile()
    {
        /* You can configure your AutoMapper mapping configuration here.
         * Alternatively, you can split your mapping configurations
         * into multiple profile classes for a better organization. */

        CreateMap<Property, PropertyDto>();
        CreateMap<CreateUpdatePropertyDto, Property>()
            .ForMember(dest=>dest.Amenities,opt=>opt.MapFrom(
                src=>src.Amenities.Select(name=>new PropertyAmenity
                { Name=name}).ToList()));
    }
}
