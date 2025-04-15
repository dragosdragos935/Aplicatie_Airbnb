class Trip {
  final String id;
  final String propertyName;
  final String location;
  final String imageUrl;
  final DateTime checkIn;
  final DateTime checkOut;
  final int numberOfGuests;
  final double totalPrice;
  final bool isPast;

  Trip({
    required this.id,
    required this.propertyName,
    required this.location,
    required this.imageUrl,
    required this.checkIn,
    required this.checkOut,
    required this.numberOfGuests,
    required this.totalPrice,
    this.isPast = false,
  });

  int get numberOfNights {
    return checkOut.difference(checkIn).inDays;
  }

  Trip copyWith({
    String? id,
    String? propertyName,
    String? location,
    String? imageUrl,
    DateTime? checkIn,
    DateTime? checkOut,
    int? numberOfGuests,
    double? totalPrice,
    bool? isPast,
  }) {
    return Trip(
      id: id ?? this.id,
      propertyName: propertyName ?? this.propertyName,
      location: location ?? this.location,
      imageUrl: imageUrl ?? this.imageUrl,
      checkIn: checkIn ?? this.checkIn,
      checkOut: checkOut ?? this.checkOut,
      numberOfGuests: numberOfGuests ?? this.numberOfGuests,
      totalPrice: totalPrice ?? this.totalPrice,
      isPast: isPast ?? this.isPast,
    );
  }
} 