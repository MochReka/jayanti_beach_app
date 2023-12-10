// restaurants_page.dart
import 'package:flutter/material.dart';
import 'package:jayanti_beach_app/constants.dart';
import 'package:jayanti_beach_app/models/resto_data.dart'; // Import model data

class RestaurantsPage extends StatelessWidget {
  final List<Restaurant> restaurants =
      getRestaurants(); // Menggunakan data dari model

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Restoran'),
        backgroundColor: primaryColor,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: restaurants.map((restaurant) {
            return RestaurantCard(
              name: restaurant.name,
              cuisine: restaurant.cuisine,
              rating: restaurant.rating,
              imagePath: restaurant.imagePath,
            );
          }).toList(),
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
