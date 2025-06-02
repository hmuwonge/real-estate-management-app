export interface PropertyDetail {
  id: string;
  title: string;
  price: number;
  area: number;
  rooms: number;
  mainImage: string;
  insurancePayment: string;
  owner: Owner;
  governorate: Governorate;
  propertyType: PropertyType;
  amenities: Amenity[];
  propertyNearbyPlaces: any[]; // Update type if structure is known
  propertyImages: PropertyImage[];
  creationTime: string;
  features: Features[];
  description: string;
}

export interface Owner {
  id: string;
  name: string;
  email: string;
  phoneNumber: string;
  profileImageUrl: string;
}

export interface Governorate {
  id: string;
  name: string;
}

export interface Features {
  id: string;
  name: string;
  icon: string|null;
}


export interface PropertyType {
  id: string;
  name: string;
}

export interface Amenity {
  id: string;
  name: string;
  creationTime: string;
  creatorId: string | null;
  lastModificationTime: string | null;
  lastModifierId: string | null;
  extraProperties: Record<string, any>;
  concurrencyStamp: string;
}

export interface PropertyImage {
  id: string;
  url: string;
  isMain: boolean;
  sortOrder: number;
  fullUrl: string;
}
