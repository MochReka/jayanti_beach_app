import 'dart:async';

import 'package:flutter/material.dart';
import 'package:jayanti_beach_app/Screens/tiket_screen.dart';
import 'package:jayanti_beach_app/Screens/hotel_screen.dart';
import 'package:jayanti_beach_app/Screens/resto_screen.dart';
import 'package:jayanti_beach_app/Screens/foto_screen.dart';
import 'package:jayanti_beach_app/constants.dart';
import 'package:ionicons/ionicons.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentPage);

    // Auto slide every 3 seconds
    Timer.periodic(Duration(seconds: 3), (Timer timer) {
      if (_currentPage < 2) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      if (_pageController.hasClients) {
        _pageController.animateToPage(
          _currentPage,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  Widget _buildBlueBox({
    required String imagePath,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 75,
        height: 100,
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                imagePath,
                width: 20,
                height: 20,
              ),
              Text(
                label,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTrendingBox(String imageUrl) {
    return Container(
      width: 250, // Tentukan lebar tetap
      height: 150, // Tentukan tinggi tetap
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.asset(
          imageUrl,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildTrendingText(String text) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Text(
          '$text',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double spacing = (screenWidth - 75 * 4) / 5;

    List<BoxData> boxDataList = [
      BoxData(label: 'Tiket', imagePath: 'assets/images/ticket.png'),
      BoxData(label: 'Spot Foto', imagePath: 'assets/images/spot.png'),
      BoxData(label: 'Hotel', imagePath: 'assets/images/hotel.png'),
      BoxData(label: 'Restoran', imagePath: 'assets/images/restoran.png'),
    ];

    List<String> trendingSpotImages = [
      'assets/images/spot1.jpg',
      'assets/images/spot2.jpg',
      'assets/images/spot3.jpg',
    ];

    List<String> trendingRestoImages = [
      'assets/images/resto1.jpg',
      'assets/images/resto2.jpg',
      'assets/images/resto3.jpg',
    ];

    List<String> trendingHotelImages = [
      'assets/images/hotel1.jpg',
      'assets/images/hotel2.jpg',
      'assets/images/hotel3.jpg',
    ];

    return Scaffold(
      body: ListView(
        children: [
          Container(
            width: screenWidth,
            height: 300,
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    'assets/images/welcome.jpg',
                    fit: BoxFit.cover,
                    width: screenWidth,
                    height: 300,
                  ),
                ),
                Positioned(
                  top: 250,
                  left: 0,
                  child: Container(
                    width: screenWidth,
                    height: 300,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 60,
                  left: 20,
                  child: const Text(
                    'Selamat Pagi!',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                for (int i = 0; i < boxDataList.length; i++)
                  Positioned(
                    top: 170,
                    left: (75 + spacing) * i + spacing,
                    child: _buildBlueBox(
                      imagePath: boxDataList[i].imagePath,
                      label: boxDataList[i].label,
                      onTap: () {
                        switch (boxDataList[i].label) {
                          case 'Hotel':
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MainScreen(),
                              ),
                            );
                            break;
                          case 'Spot Foto':
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => FotoScreen(),
                              ),
                            );
                            break;
                          case 'Restoran':
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RestoScreen(),
                              ),
                            );
                            break;
                          case 'Tiket':
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => TiketScreen(),
                              ),
                            );
                            break;
                        }
                      },
                    ),
                  ),
              ],
            ),
          ),
          _buildTrendingText('  Trending Spot'),

          // Trending Spot
          Container(
            height: 150,
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemCount: trendingSpotImages.length,
              itemBuilder: (context, index) {
                return _buildTrendingBox(trendingSpotImages[index]);
              },
            ),
          ),

          _buildTrendingText('  Trending Resto'),

          // Trending Resto
          Container(
            height: 150,
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemCount: trendingRestoImages.length,
              itemBuilder: (context, index) {
                return _buildTrendingBox(trendingRestoImages[index]);
              },
            ),
          ),

          _buildTrendingText('  Trending Hotel'),

          // Trending Hotel
          Container(
            height: 150,
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemCount: trendingHotelImages.length,
              itemBuilder: (context, index) {
                return _buildTrendingBox(trendingHotelImages[index]);
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Ionicons.home_outline),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Ionicons.bookmark_outline),
            label: "Bookmark",
          ),
          BottomNavigationBarItem(
            icon: Icon(Ionicons.ticket_outline),
            label: "Ticket",
          ),
          BottomNavigationBarItem(
            icon: Icon(Ionicons.person_outline),
            label: "Profile",
          )
        ],
      ), 
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}

class BoxData {
  final String label;
  final String imagePath;

  BoxData({required this.label, required this.imagePath});
}
