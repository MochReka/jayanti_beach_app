// photo_spots_page.dart
import 'package:flutter/material.dart';
import 'package:jayanti_beach_app/Screens/photo_spot_detail_page.dart';
import 'package:jayanti_beach_app/constants.dart';
import 'package:jayanti_beach_app/models/spot_data.dart'; // Import model data

class PhotoSpotsPage extends StatelessWidget {
  final List<PhotoSpot> photoSpots =
      photoSpotsData; // Menggunakan data dari model

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tempat Foto'),
        backgroundColor: primaryColor,
      ),
      body: ListView.builder(
        itemCount: photoSpots.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              _navigateToPhotoSpotDetail(context, photoSpots[index]);
            },
            child: _buildPhotoSpotCard(photoSpots[index]),
          );
        },
      ),
    );
  }

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

  void _navigateToPhotoSpotDetail(BuildContext context, PhotoSpot photoSpot) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PhotoSpotDetailPage(photoSpot),
      ),
    );
  }
}
