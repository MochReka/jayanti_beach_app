import 'package:flutter/material.dart';

class RestaurantsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Restoran Terbaik'),
        backgroundColor: Colors.blue, // Sesuaikan dengan warna yang diinginkan
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: [
            RestaurantCard(
              name: 'Warung Makan Bahagia',
              cuisine: 'Masakan Nusantara',
              rating: 4.5,
              imagePath: 'assets/images/resto1.jpg',
            ),
            SizedBox(height: 16),
            RestaurantCard(
              name: 'Sushi Sensation',
              cuisine: 'Masakan Jepang',
              rating: 4.7,
              imagePath: 'assets/images/resto2.jpg',
            ),
            SizedBox(height: 16),
            RestaurantCard(
              name: 'Sushi Sensation',
              cuisine: 'Masakan Jepang',
              rating: 4.7,
              imagePath: 'assets/images/resto3.jpg',
            ),
            SizedBox(height: 16),
            RestaurantCard(
              name: 'Sushi Sensation',
              cuisine: 'Masakan Jepang',
              rating: 4.7,
              imagePath: 'assets/images/resto1.jpg',
            ),
          ],
        ),
      ),
    );
  }
}

class RestaurantCard extends StatelessWidget {
  final String name;
  final String cuisine;
  final double rating;
  final String imagePath;

  RestaurantCard({
    required this.name,
    required this.cuisine,
    required this.rating,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
            child: Image.asset(
              imagePath,
              width: double.infinity,
              height: 150,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  cuisine,
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.orange, size: 18),
                    SizedBox(width: 4),
                    Text(
                      '$rating',
                      style: TextStyle(fontSize: 16),
                    ),
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
