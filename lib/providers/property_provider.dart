import 'package:flutter/foundation.dart';
import '../models/property.dart';

class PropertyProvider with ChangeNotifier {
  final List<Property> _properties = [
    Property(
      id: '1',
      name: 'Luxury Villa with Pool',
      location: 'Bali, Indonesia',
      price: 250,
      rating: 4.8,
      imageUrl: 'https://picsum.photos/400/300?random=1',
      latitude: -8.409518,
      longitude: 115.188919,
    ),
    Property(
      id: '2',
      name: 'Modern City Apartment',
      location: 'New York, USA',
      price: 180,
      rating: 4.6,
      imageUrl: 'https://picsum.photos/400/300?random=2',
      latitude: 40.7128,
      longitude: -74.0060,
    ),
    Property(
      id: '3',
      name: 'Beach House',
      location: 'Miami, USA',
      price: 300,
      rating: 4.9,
      imageUrl: 'https://picsum.photos/400/300?random=3',
      latitude: 25.7617,
      longitude: -80.1918,
    ),
    Property(
      id: '4',
      name: 'Mountain Cabin',
      location: 'Swiss Alps',
      price: 200,
      rating: 4.7,
      imageUrl: 'https://picsum.photos/400/300?random=4',
      latitude: 46.8182,
      longitude: 8.2275,
    ),
    Property(
      id: '5',
      name: 'Historic Downtown Loft',
      location: 'Paris, France',
      price: 220,
      rating: 4.5,
      imageUrl: 'https://picsum.photos/400/300?random=5',
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
} 