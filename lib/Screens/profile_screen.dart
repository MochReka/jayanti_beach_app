import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  // Dummy user data
  final String username = 'John Doe';
  final String email = 'john.doe@example.com';
  final String profileImage = 'https://example.com/path/to/your/profile/image.jpg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(profileImage),
            ),
            SizedBox(height: 16),
            Text(
              username,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              email,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                // Tambahkan logika untuk logout di sini
                // Misalnya, panggil fungsi untuk logout
                // Contoh: AuthService.logout();
              },
              child: Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
