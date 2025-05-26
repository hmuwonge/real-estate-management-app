using System;
using SawaTech.PropertyMini.NearbyPlaces;

namespace SawaTech.PropertyMini.PropertyEntities;

public class PropertyFeature
{
    public Guid PropertyId { get; set; }
    public Property Property { get; set; }

    public Guid FeatureId { get; set; }
    public Feature Feature { get; set; }
}