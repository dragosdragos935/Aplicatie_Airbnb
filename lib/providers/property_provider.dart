import 'package:flutter/foundation.dart';
import '../models/property.dart';

class PropertyProvider with ChangeNotifier {
  final List<Property> _properties = [
    Property(
      id: '1',
      name: 'Luxury Villa with Pool',
      description: 'Beautiful villa with a private pool and garden',
      location: 'Bali, Indonesia',
      price: 250,
      rating: 4.8,
      reviews: 124,
      imageUrl: 'https://picsum.photos/400/300?random=1',
      bedrooms: 3,
      bathrooms: 2,
      maxGuests: 6,
      latitude: -8.409518,
      longitude: 115.188919,
    ),
    Property(
      id: '2',
      name: 'Modern City Apartment',
      description: 'Stylish apartment in the heart of the city',
      location: 'New York, USA',
      price: 180,
      rating: 4.6,
      reviews: 89,
      imageUrl: 'https://picsum.photos/400/300?random=2',
      bedrooms: 2,
      bathrooms: 1,
      maxGuests: 4,
      latitude: 40.7128,
      longitude: -74.0060,
    ),
    Property(
      id: '3',
      name: 'Beach House',
      description: 'Stunning beachfront property with ocean views',
      location: 'Miami, USA',
      price: 300,
      rating: 4.9,
      reviews: 156,
      imageUrl: 'https://picsum.photos/400/300?random=3',
      bedrooms: 4,
      bathrooms: 3,
      maxGuests: 8,
      latitude: 25.7617,
      longitude: -80.1918,
    ),
    Property(
      id: '4',
      name: 'Mountain Cabin',
      description: 'Cozy cabin with breathtaking mountain views',
      location: 'Swiss Alps',
      price: 200,
      rating: 4.7,
      reviews: 78,
      imageUrl: 'https://picsum.photos/400/300?random=4',
      bedrooms: 2,
      bathrooms: 1,
      maxGuests: 4,
      latitude: 46.8182,
      longitude: 8.2275,
    ),
    Property(
      id: '5',
      name: 'Historic Downtown Loft',
      description: 'Charming loft in a historic building',
      location: 'Paris, France',
      price: 220,
      rating: 4.5,
      reviews: 92,
      imageUrl: 'https://picsum.photos/400/300?random=5',
      bedrooms: 1,
      bathrooms: 1,
      maxGuests: 2,
      latitude: 48.8566,
      longitude: 2.3522,
    ),
  ];

  List<Property> get properties => [..._properties];
  List<Property> get savedProperties => _properties.where((p) => p.isSaved).toList();

  void toggleSaved(String propertyId) {
    final propertyIndex = _properties.indexWhere((p) => p.id == propertyId);
    if (propertyIndex != -1) {
      _properties[propertyIndex].isSaved = !_properties[propertyIndex].isSaved;
      notifyListeners();
    }
  }

  void addProperty(Property property) {
    _properties.add(property);
    notifyListeners();
  }
} 