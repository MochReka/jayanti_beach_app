import 'package:flutter/material.dart';


class RestoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restaurant App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RestaurantScreen(),
    );
  }
}

class Restaurant {
  final String name;
  final String image;
  final List<String> menuItems;

  Restaurant({required this.name, required this.image, required this.menuItems});
}

class RestaurantScreen extends StatefulWidget {
  @override
  _RestaurantScreenState createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> {
  List<Restaurant> restaurants = [
    Restaurant(
      name: 'Restoran A',
      image: 'assets/images/welcome.jpg',
      menuItems: ['Nasi Goreng', 'Mie Goreng', 'Ayam Bakar', 'Sate'],
    ),
    Restaurant(
      name: 'Restoran B',
      image: 'assets/images/welcome.jpg',
      menuItems: ['Sushi', 'Ramen', 'Teriyaki', 'Udon'],
    ),
    // Tambahkan restoran lainnya sesuai kebutuhan
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Restoran'),
      ),
      body: ListView.builder(
        itemCount: restaurants.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 5.0,
            margin: EdgeInsets.all(10.0),
            child: ListTile(
              contentPadding: EdgeInsets.all(10.0),
              title: Text(
                restaurants[index].name,
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              leading: CircleAvatar(
                backgroundImage: AssetImage(restaurants[index].image),
                radius: 30.0,
              ),
              onTap: () {
                _showMenuScreen(restaurants[index]);
              },
            ),
          );
        },
      ),
    );
  }

  void _showMenuScreen(Restaurant restaurant) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => MenuScreen(restaurant: restaurant),
      ),
    );
  }
}

class MenuScreen extends StatelessWidget {
  final Restaurant restaurant;

  MenuScreen({required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${restaurant.name} - Menu'),
      ),
      body: Column(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(restaurant.image),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(height: 16),
          Text(
            'Pilihan Menu:',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: restaurant.menuItems.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(restaurant.menuItems[index]),
                  // Tambahkan logika pemesanan sesuai kebutuhan
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
