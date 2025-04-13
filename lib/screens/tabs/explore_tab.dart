import 'package:flutter/material.dart';

class ExploreTab extends StatelessWidget {
  const ExploreTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            backgroundColor: Colors.white,
            title: Container(
              height: 45,
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(25),
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search destinations',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  _FilterChip(label: 'All', isSelected: true),
                  _FilterChip(label: 'Rooms'),
                  _FilterChip(label: 'Houses'),
                  _FilterChip(label: 'Experiences'),
                  _FilterChip(label: 'Popular'),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 0.8,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) => _PropertyCard(
                  imageUrl: 'https://picsum.photos/200/250?random=$index',
                  name: 'Beautiful Property ${index + 1}',
                  city: 'City ${index + 1}',
                  rating: 4.5,
                  price: (100 + index * 10).toDouble(),
                ),
                childCount: 10,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _FilterChip extends StatelessWidget {
  final String label;
  final bool isSelected;

  const _FilterChip({
    required this.label,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: FilterChip(
        label: Text(label),
        selected: isSelected,
        onSelected: (bool selected) {
          // TODO: Implement filter logic
        },
        selectedColor: Theme.of(context).colorScheme.primary.withOpacity(0.2),
        checkmarkColor: Theme.of(context).colorScheme.primary,
      ),
    );
  }
}

class _PropertyCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String city;
  final double rating;
  final double price;

  const _PropertyCard({
    required this.imageUrl,
    required this.name,
    required this.city,
    required this.rating,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Stack(
              children: [
                Image.network(
                  imageUrl,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: IconButton(
                    icon: const Icon(Icons.favorite_border),
                    color: Colors.white,
                    onPressed: () {
                      // TODO: Implement favorite logic
                    },
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.star, size: 16, color: Colors.amber[700]),
                    const SizedBox(width: 4),
                    Text(
                      rating.toString(),
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  city,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '\$${price.toInt()} / night',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
} 