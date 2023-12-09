import 'package:flutter/material.dart';
import 'package:jayanti_beach_app/Screens/photo_spot_detail_page.dart';

class PhotoSpotsPage extends StatelessWidget {
  final List<PhotoSpot> photoSpots = [
    PhotoSpot('Pantai Indah', 'assets/images/spot1.jpg',
        'Pantai eksotis dengan pasir putih yang indah.'),
    PhotoSpot('Hutan Hijau', 'assets/images/spot2.jpg',
        'Hutan yang sejuk dengan pepohonan hijau dan segar.'),
    PhotoSpot('Gunung Megah', 'assets/images/spot3.jpg',
        'Pemandangan megah dari puncak gunung.'),
    PhotoSpot('Gunung Megah', 'assets/images/spot1.jpg',
        'Pemandangan megah dari puncak gunung.'),
    // Tambahkan lebih banyak tempat foto sesuai kebutuhan
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tempat Foto'),
        backgroundColor: Color.fromARGB(255, 54, 184, 207), // Sesuaikan dengan warna yang diinginkan
      ),
      body: ListView.builder(
        itemCount: photoSpots.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // Aksi yang diambil ketika item di-tap
              _navigateToPhotoSpotDetail(context, photoSpots[index]);
            },
            child: _buildPhotoSpotCard(photoSpots[index]),
          );
        },
      ),
    );
  }

  // Widget untuk membangun kartu tempat foto
  Widget _buildPhotoSpotCard(PhotoSpot photoSpot) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
            child: Image.asset(
              photoSpot.imagePath,
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
                  photoSpot.name,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  photoSpot.description,
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Metode untuk menavigasi ke halaman detail tempat foto
  void _navigateToPhotoSpotDetail(BuildContext context, PhotoSpot photoSpot) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PhotoSpotDetailPage(photoSpot),
      ),
    );
  }
}

// Model data untuk tempat foto
class PhotoSpot {
  final String name;
  final String imagePath;
  final String description;

  PhotoSpot(this.name, this.imagePath, this.description);
}
