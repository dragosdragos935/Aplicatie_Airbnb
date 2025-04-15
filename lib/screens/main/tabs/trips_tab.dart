import 'package:flutter/material.dart';
import '../../../models/trip.dart';
import '../../trip_details_screen.dart';

class TripsTab extends StatelessWidget {
  const TripsTab({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample trips data
    final List<Trip> upcomingTrips = [
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
    ];

    final List<Trip> pastTrips = [
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

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Trips'),
          backgroundColor: Colors.white,
          elevation: 0,
          bottom: const TabBar(
            labelColor: Color(0xFFFE3C5B),
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(text: 'Upcoming'),
              Tab(text: 'Past'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Upcoming Trips
            _buildTripsList(upcomingTrips, context),
            // Past Trips
            _buildTripsList(pastTrips, context),
          ],
        ),
      ),
    );
  }

  Widget _buildTripsList(List<Trip> trips, BuildContext context) {
    if (trips.isEmpty) {
      return const Center(
        child: Text('No trips found'),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: trips.length,
      itemBuilder: (context, index) {
        final trip = trips[index];
        final numberOfNights = trip.checkOut.difference(trip.checkIn).inDays;

        return Card(
          margin: const EdgeInsets.only(bottom: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Image.network(
                    trip.imageUrl,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  if (!trip.isPast)
                    Positioned(
                      top: 16,
                      right: 16,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Text(
                          'Upcoming',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      trip.propertyName,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(trip.location),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        const Icon(Icons.calendar_today, size: 16),
                        const SizedBox(width: 8),
                        Text('${numberOfNights} nights'),
                        const Spacer(),
                        Text(
                          '\$${trip.totalPrice.toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        const Icon(Icons.people, size: 16),
                        const SizedBox(width: 8),
                        Text('${trip.numberOfGuests} guests'),
                      ],
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TripDetailsScreen(trip: trip),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFE3C5B),
                        minimumSize: const Size(double.infinity, 40),
                      ),
                      child: const Text('View Details'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
} 