import 'package:flutter/material.dart';

// after retrieving data from firestore, map it to a model class like this:
class Craftsmanship {
  final String imageUrl;
  final String title;
  final String distance;

  Craftsmanship({
    required this.imageUrl,
    required this.title,
    required this.distance,
  });
}

class CraftsmanshipCard extends StatelessWidget {
  final Craftsmanship item;

  const CraftsmanshipCard({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            item.imageUrl,
            height: 150,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.location_on, size: 16),
                    SizedBox(width: 4),
                    Text(item.distance),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CraftsmanshipGrid extends StatelessWidget {
  // Replace with your data model
  final List<Craftsmanship> items = [
    Craftsmanship(
      imageUrl: 'assets/rosidah.png',
      title: 'Kerajinan Botol Bekas Ibu Rosidah',
      distance: '100m',
    ),
    // Add more items...
  ];

  CraftsmanshipGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(8),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 0.8,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return CraftsmanshipCard(item: items[index]);
      },
    );
  }
}
