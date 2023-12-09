import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LocationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Halaman Lokasi'),
        backgroundColor: Colors.blue, // Sesuaikan dengan warna halaman tiket
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Pantai Jayanti',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Container(
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                        'assets/images/gambarlokasi.jpg'), // Sesuaikan dengan path gambar Anda
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Deskripsi Lokasi:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'Pantai Indah adalah destinasi liburan yang sempurna. '
                'Nikmati keindahan pasir putih dan air laut yang jernih. '
                'Tempat ini cocok untuk bersantai dan menikmati keindahan alam.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Container(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Aksi yang diambil ketika tombol ditekan
                    _launchGoogleMaps();
                  },
                  style: ElevatedButton.styleFrom(
                    primary:
                        Colors.blue, // Sesuaikan dengan warna halaman tiket
                    onPrimary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      'Lihat Peta',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Method untuk membuka Google Maps
  _launchGoogleMaps() async {
    // Ganti koordinat (-6.2088, 106.8456) sesuai dengan koordinat lokasi Anda
    const url =
        'https://maps.app.goo.gl/cixuYMhgd1UdXs847';
        
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
