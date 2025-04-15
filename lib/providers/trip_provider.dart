import 'package:flutter/foundation.dart';
import '../models/trip.dart';

class TripProvider with ChangeNotifier {
  final List<Trip> _trips = [
    Trip(
      id: '1',
      propertyName: 'Luxury Villa with Pool',
      location: 'Bali, Indonesia',
      imageUrl: 'https://picsum.photos/400/200?random=1',
      checkIn: DateTime.now().add(const Duration(days: 7)),
      checkOut: DateTime.now().add(const Duration(days: 14)),
      numberOfGuests: 2,
      totalPrice: 1750.0,
    ),
    Trip(
      id: '2',
      propertyName: 'Modern City Apartment',
      location: 'New York, USA',
      imageUrl: 'https://picsum.photos/400/200?random=2',
      checkIn: DateTime.now().add(const Duration(days: 30)),
      checkOut: DateTime.now().add(const Duration(days: 35)),
      numberOfGuests: 3,
      totalPrice: 900.0,
    ),
    Trip(
      id: '3',
      propertyName: 'Beach House',
      location: 'Miami, USA',
      imageUrl: 'https://picsum.photos/400/200?random=3',
      checkIn: DateTime.now().subtract(const Duration(days: 30)),
      checkOut: DateTime.now().subtract(const Duration(days: 25)),
      numberOfGuests: 4,
      totalPrice: 1250.0,
      isPast: true,
    ),
  ];

  List<Trip> get trips => List.unmodifiable(_trips);

  List<Trip> get upcomingTrips => _trips.where((trip) => !trip.isPast).toList();

  List<Trip> get pastTrips => _trips.where((trip) => trip.isPast).toList();

  void addTrip(Trip trip) {
    _trips.add(trip);
    notifyListeners();
  }

  void removeTrip(String tripId) {
    _trips.removeWhere((trip) => trip.id == tripId);
    notifyListeners();
  }

  void cancelTrip(String tripId) {
    final tripIndex = _trips.indexWhere((trip) => trip.id == tripId);
    if (tripIndex != -1) {
      _trips[tripIndex] = _trips[tripIndex].copyWith(isPast: true);
      notifyListeners();
    }
  }
} 