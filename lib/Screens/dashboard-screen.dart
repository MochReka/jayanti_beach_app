import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    // Calculate spacing based on the number of blue boxes
    double spacing = (screenWidth - 75 * 4) / 5;

    // Data for each blue box
    List<BoxData> boxDataList = [
      BoxData(label: 'Tiket', imagePath: 'assets/images/ticket.png'),
      BoxData(label: 'Spot Foto', imagePath: 'assets/images/spot.png'),
      BoxData(label: 'Hotel', imagePath: 'assets/images/hotel.png'),
      BoxData(label: 'Restoran', imagePath: 'assets/images/restoran.png'),
    ];

    return Scaffold(
      body: ListView(
        children: [
          Container(
            width: screenWidth,
            height: 300, // Adjust this height as needed
            child: Stack(
              children: [
                // Background Image
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    'assets/images/welcome.jpg',
                    fit: BoxFit.cover,
                    width: screenWidth,
                    height: 300,
                  ),
                ),

                // Overlay Container
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

                // Greeting Text
                Positioned(
                  top: 60,
                  left: 20,
                  child: const Text(
                    'Selamat Pagi!',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),

                // Blue Boxes
                for (int i = 0; i < boxDataList.length; i++)
                  Positioned(
                    top: 170,
                    left: (75 + spacing) * i + spacing,
                    child: _buildBlueBox(
                      imagePath: boxDataList[i].imagePath,
                      label: boxDataList[i].label,
                    ),
                  ),
              ],
            ),
          ),

          // Other widgets below
          Positioned(
                  top: 60,
                  left: 40,
                  child: const Text(
                    '     Trending Spot',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black ,
                    ),
                  ),
                ),

          Container(
            child: Stack(
              children: [
                // Rounded Image
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      'https://images.unsplash.com/photo-1515238152791-8216bfdf89a7?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxfDB8MXxyYW5kb218MHx8fHx8fHx8MTY4MTM2MDQ2MA&ixlib=rb-4.0.3&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1080',
                      fit: BoxFit.cover,
                      width: 350,
                      height: 180,
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

  Widget _buildBlueBox({required String imagePath, required String label}) {
    return Container(
      width: 75,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.blue,
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
    );
  }
}

class BoxData {
  final String label;
  final String imagePath;

  BoxData({required this.label, required this.imagePath});
}
