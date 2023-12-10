import 'package:flutter/material.dart';
import 'package:jayanti_beach_app/constants.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // Dummy user data
  String username = 'Moch Reka';
  String email = 'mochreka87@example.com';

  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    usernameController.text = username;
    emailController.text = email;
  }

  void saveChanges() {
    setState(() {
      username = usernameController.text;
      email = emailController.text;
    });
    // Tambahkan logika untuk menyimpan perubahan ke server atau penyimpanan lokal
    // Misalnya, AuthService.updateProfile(username, email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil'),
        backgroundColor: primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.start, // Ubah ke MainAxisAlignment.start
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Align(
              alignment: Alignment.topCenter, // Atur posisi vertikal ke atas
              child: CircleAvatar(
                radius: 80,
                backgroundImage: NetworkImage(
                  'https://images.unsplash.com/photo-1529665253569-6d01c0eaf7b6?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxfDB8MXxyYW5kb218MHx8fHx8fHx8MTY4MjAxOTM0Mw&ixlib=rb-4.0.3&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1080',
                ),
              ),
            ),
            SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: TextField(
                  controller: usernameController,
                  style: TextStyle(fontSize: 18), // Atur ukuran teks
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: 'Nama',
                    labelStyle: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 8),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: TextField(
                  controller: emailController,
                  style: TextStyle(fontSize: 18), // Atur ukuran teks
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: 'Email',
                    labelStyle: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: saveChanges,
              style: ElevatedButton.styleFrom(
                primary: primaryColor, // Warna background
                padding:
                    EdgeInsets.symmetric(vertical: 18), // Atur tinggi tombol
              ),
              child: Text(
                'Simpan Perubahan',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18, // Atur ukuran teks
                ),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Tambahkan logika untuk logout di sini
                // Misalnya, panggil fungsi untuk logout
                // Contoh: AuthService.logout();
              },
              style: ElevatedButton.styleFrom(
                primary: primaryColor, // Warna background
                padding:
                    EdgeInsets.symmetric(vertical: 18), // Atur tinggi tombol
              ),
              child: Text(
                'Logout',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18, // Atur ukuran teks
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
