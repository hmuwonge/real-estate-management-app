using System.Linq;
using AutoMapper;
using SawaTech.PropertyMini.Amenities;
using SawaTech.PropertyMini.Governorates;
using SawaTech.PropertyMini.Properties;
using SawaTech.PropertyMini.PropertyAmenities;
using SawaTech.PropertyMini.PropertyEntities;
using SawaTech.PropertyMini.PropertyFeatures;
using SawaTech.PropertyMini.PropertyTypes;
using SawaTech.PropertyMini.UserAccount;
using SawaTech.PropertyMini.Users;
using PropertyTypeDto = SawaTech.PropertyMini.PropertyTypes.PropertyTypeDto;

namespace SawaTech.PropertyMini;

public class PropertyMiniApplicationAutoMapperProfile : Profile
{
    public PropertyMiniApplicationAutoMapperProfile()
    {
        /* You can configure your AutoMapper mapping configuration here.
         * Alternatively, you can split your mapping configurations
         * into multiple profile classes for a better organization. */

        CreateMap<Property, PropertyDto>()
            .ForMember(dest => dest.Rooms, opt => opt.MapFrom(src => src.Rooms))
             .ForMember(dest => dest.Images, opt => opt.MapFrom(src => src.PropertyImages))
            .ForMember(dest => dest.PropertyType, 
                opt => opt.MapFrom(src => src.PropertyType))
            .ForMember(
                dest => dest.Images,
                opt => opt.MapFrom(src => src.PropertyImages.Select(x => x.Url))
            );
        
        CreateMap<Property, PropertyListDto>()
            .ForMember(dest => dest.Rooms, opt => opt.MapFrom(src => src.Rooms))
            .ForMember(dest => dest.PropertyType, 
                opt => opt.MapFrom(src => src.PropertyType)
            )
            .ForMember(dest=>dest.Owner, opt=>opt.MapFrom(src=>src.Owner));

        CreateMap<Property, PropertyDetailDto>()
            .ForMember(
                dest => dest.Amenities,
                opt =>
                    opt.MapFrom(src =>
                        src.Amenities
                    )
            );
        // .ForMember(
        //     dest => dest.images,
        //     opt => opt.MapFrom(src => src.PropertyImages.Select(x => x.Url))
        // );

        CreateMap<CreateUpdatePropertyDto, Property>()
            .ForMember(
                dest => dest.Amenities,
                opt =>
                    opt.MapFrom(src =>
                        src.Amenities.Select(name => new Amenity { Name = name }).ToList()
                    )
            );

        // automapper for property features
        CreateMap<Feature, PropertyFeatureDto>();
        CreateMap<CreateUpdatePropertyFeaturesDto, Feature>();

        CreateMap<Governorate, GovernorateDto>();
        CreateMap<Governorate, PropertyGovernorateDto>().ForMember(dest=>dest.Name, opt=>opt.MapFrom(src=>src.Name));
        CreateMap<CreateUpdateGovernorateDto, Governorate>();

        CreateMap<AccountUser, PropertyOwnerDto>()
            .ForMember(dest => dest.Id, opt => opt.MapFrom(src => src.Id))
            .ForMember(dest => dest.Name, opt => opt.MapFrom(src => src.UserName))
            .ForMember(dest => dest.Email, opt => opt.MapFrom(src => src.Email))
            .ForMember(dest => dest.PhoneNumber, opt => opt.MapFrom(src => src.Phone)
            
            );

        CreateMap<PropertyType, PropertyTypeDto>()
            .ForMember(dest => dest.Name, opt => opt.MapFrom(src => src.Name))
            .ForMember(dest => dest.Id, opt => opt.MapFrom(src => src.Id));

        CreateMap<CreateUpdatePropertyTypeDto, PropertyType>()
            .ForMember(dest => dest.Name, opt => opt.MapFrom(src => src.Name));

        CreateMap<Amenity, AmenityDto>();
        CreateMap<Amenity, SinglePropertyAmenityDto>()
            .ForMember(dest=>dest.Name,opt=>opt.MapFrom(src=>src.Name));
        CreateMap<CreateUpdateAmenityDto, Amenity>()
            .ForMember(dest => dest.Name, opt => opt.MapFrom(src => src.Name));

        CreateMap<PropertyImage, PropertyImageDto>()
    .ForMember(dest => dest.FullUrl, opt =>
        opt.MapFrom(src => $"{_blobSettings.BaseUrl}{src.Url}"));

    }
}
