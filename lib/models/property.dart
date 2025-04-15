class Property {
  final String id;
  final String name;
  final String location;
  final double price;
  final double rating;
  final String imageUrl;
  final double latitude;
  final double longitude;
  bool isSaved;

  Property({
    required this.id,
    required this.name,
    required this.location,
    required this.price,
    required this.rating,
    required this.imageUrl,
    required this.latitude,
    required this.longitude,
    this.isSaved = false,
  });
} 