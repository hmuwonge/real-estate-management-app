export interface SimilarProperty {
  id: string;
  title: string;
  price: number;
  description: string;
  insurancePayment: string;
  area: number;
  longitude?:number,
  latitude?:number,
  rooms: number;
  mainImage: string;
  owner: any | null;
  governorate: any | null;
  propertyType: string | null;
  amenities: Amenity[];
  propertyNearbyPlaces: any[];
  features: any[];
  propertyImages: any[];
  creationTime: string;
}

export interface Amenity {
  name: string;
  lastModificationTime: string;
  lastModifierId: string | null;
  creationTime: string;
  creatorId: string | null;
  extraProperties: Record<string, any>;
  concurrencyStamp: string;
  id: string;
}
