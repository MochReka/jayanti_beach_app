import 'package:flutter/material.dart';

void main() {
  runApp(HotelScreen());
}

class HotelScreen extends StatelessWidget {
  const HotelScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HotelList(),
    );
  }
}

class HotelList extends StatelessWidget {
  final List<Hotel> hotels = [
    Hotel(name: 'Hotel A', image: 'images/hotel1.jpg'),
    Hotel(name: 'Hotel B', image: 'images/hotel2.jpg'),
    Hotel(name: 'Hotel C', image: 'images/hotel3.jpg'),
    Hotel(name: 'Hotel D', image: 'images/hotel4.jpg'),
    // Add more hotels with images as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Hotel'),
      ),
      body: ListView.builder(
        itemCount: hotels.length,
        itemBuilder: (context, index) {
          return HotelCard(hotel: hotels[index]);
        },
      ),
    );
  }
}

class HotelCard extends StatelessWidget {
  final Hotel hotel;

  const HotelCard({Key? key, required this.hotel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      // Menyesuaikan padding pada Card
      // Ubah nilai sesuai kebutuhan
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0.0), // Tidak ada radius
      ),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black, // Ubah warna sesuai kebutuhan
            width: 2.0, // Ubah lebar sesuai kebutuhan
          ),
        ),
        child: ListTile(
          title: Text(hotel.name),
          // Menyesuaikan contentPadding pada ListTile
          // Ubah nilai sesuai kebutuhan
          contentPadding: EdgeInsets.all(30.0),
          leading: Container(
            width: 200.0, // Lebar tetap 200.0, sesuaikan dengan preferensi Anda
            height: 312.5, // Sesuai dengan rasio aspek 16:9 (200 * 9 / 16)
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(hotel.image),
                fit: BoxFit.cover, // Menggunakan BoxFit.cover
              ),
            ),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    DetailScreen(place: hotel.name, image: hotel.image),
              ),
            );
          },
        ),
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  final String place;
  final String image;

  const DetailScreen({Key? key, required this.place, required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details for $place'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            image,
            width: 500.0,
            height: 500.0,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 16.0),
          Text('Details for $place'),
        ],
      ),
    );
  }
}

class Hotel {
  final String name;
  final String image;

  Hotel({required this.name, required this.image});
}
