class Property {
  final String id;
  final String name;
  final String description;
  final String location;
  final double price;
  final String imageUrl;
  final int bedrooms;
  final int bathrooms;
  final int maxGuests;
  final double rating;
  final int reviews;
  final double latitude;
  final double longitude;
  bool isSaved;

  Property({
    required this.id,
    required this.name,
    required this.description,
    required this.location,
    required this.price,
    required this.imageUrl,
    required this.bedrooms,
    required this.bathrooms,
    required this.maxGuests,
    required this.rating,
    required this.reviews,
    this.latitude = 0,
    this.longitude = 0,
    this.isSaved = false,
  });
} 