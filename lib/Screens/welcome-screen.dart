import 'package:flutter/material.dart';
import 'package:jayanti_beach_app/Screens/dashboard-screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Column(
        children: [
          Container(
            width: screenWidth,
            height: screenHeight,
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    'assets/images/welcome.jpg',
                    fit: BoxFit.cover,
                    width: screenWidth,
                    height: screenHeight,
                  ),
                ),
                Positioned(
                  top: screenHeight * 0.7,
                  left: 0,
                  child: Container(
                    width: screenWidth,
                    height: screenHeight * 0.3,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              top: 10), // Jarak atas untuk teks pertama
                          child: Text(
                            'Jayanti Beach Explorer',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        SizedBox(
                            height: 5), // Jarak antara teks pertama dan kedua
                        Padding(
                          padding: EdgeInsets.only(
                              bottom: 10), // Jarak bawah untuk teks kedua
                          child: Text(
                            'Pengalaman Terbaik Berwisata Dipantai Jayanti',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        SizedBox(
                            height: 10), // Jarak antara teks kedua dan tombol
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DashboardScreen()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(255, 54, 184, 207),
                            onPrimary: Colors.white,
                            padding: EdgeInsets.symmetric(
                                horizontal: 120, vertical: 15),
                          ),
                          child: Text('Start'),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
