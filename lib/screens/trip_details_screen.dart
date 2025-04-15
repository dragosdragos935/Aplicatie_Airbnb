import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/trip.dart';

class TripDetailsScreen extends StatelessWidget {
  final Trip trip;

  const TripDetailsScreen({
    super.key,
    required this.trip,
  });

  @override
  Widget build(BuildContext context) {
    final numberOfNights = trip.checkOut.difference(trip.checkIn).inDays;
    final pricePerNight = trip.totalPrice / numberOfNights;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Trip Details'),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              trip.imageUrl,
              height: 250,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    trip.propertyName,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    trip.location,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Trip Details',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildDetailRow(
                    'Check-in',
                    DateFormat('MMM dd, yyyy').format(trip.checkIn),
                  ),
                  const SizedBox(height: 8),
                  _buildDetailRow(
                    'Check-out',
                    DateFormat('MMM dd, yyyy').format(trip.checkOut),
                  ),
                  const SizedBox(height: 8),
                  _buildDetailRow(
                    'Number of nights',
                    numberOfNights.toString(),
                  ),
                  const SizedBox(height: 8),
                  _buildDetailRow(
                    'Guests',
                    '${trip.numberOfGuests} ${trip.numberOfGuests == 1 ? 'guest' : 'guests'}',
                  ),
                  const Divider(height: 32),
                  const Text(
                    'Price Details',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildDetailRow(
                    'Price per night',
                    '\$${pricePerNight.toStringAsFixed(2)}',
                  ),
                  const SizedBox(height: 8),
                  _buildDetailRow(
                    'Number of nights',
                    '$numberOfNights nights',
                  ),
                  const Divider(height: 16),
                  _buildDetailRow(
                    'Total',
                    '\$${trip.totalPrice.toStringAsFixed(2)}',
                    isTotal: true,
                  ),
                  const SizedBox(height: 24),
                  if (!trip.isPast)
                    ElevatedButton(
                      onPressed: () {
                        // TODO: Implement trip cancellation
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        minimumSize: const Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        'Cancel Trip',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value, {bool isTotal = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: isTotal ? 18 : 16,
            fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: isTotal ? 18 : 16,
            fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    );
  }
} 