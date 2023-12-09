import 'package:flutter/material.dart';
import 'package:jayanti_beach_app/helper/month.dart';

class BookingPage extends StatelessWidget {
  final DateTime startDate;
  final DateTime endDate;

  BookingPage({
    required this.startDate,
    required this.endDate,
  });

  @override
  Widget build(BuildContext context) {
    // Menghitung durasi dan total harga
    int totalPrice = _calculateTotalPrice(); // Metode yang diperbarui

    return Scaffold(
      appBar: AppBar(
        title: Text('Halaman Pemesanan'),
        backgroundColor: Color.fromARGB(255, 54, 184, 207),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Detail Pemesanan:',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            _buildDetailItem('Tanggal Mulai', _formattedDate(startDate)),
            _buildDetailItem('Tanggal Akhir', _formattedDate(endDate)),
            SizedBox(height: 20),
            Divider(
              color: Colors.grey,
              thickness: 1,
            ),
            SizedBox(height: 20),
            Text(
              'Informasi Tambahan:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            _buildDetailItem('Durasi', _calculateDuration()),
            _buildDetailItem(
                'Harga', 'Rp $totalPrice'), // Menampilkan total harga
          ],
        ),
      ),
    );
  }

  String _formattedDate(DateTime date) {
    return '${date.day} ${_getMonthName(date.month)} ${date.year}';
  }

  String _getMonthName(int month) {
    return getMonthName(month);
  }

  String _calculateDuration() {
    Duration duration = endDate.difference(startDate);
    int days = duration.inDays;

    if (days <= 0) {
      return '1 Hari'; // Jika tanggal mulai dan akhir sama, dianggap sebagai 1 hari
    } else {
      return '${days + 1} Hari'; // Tambahkan 1 pada jumlah hari untuk pemesanan pada hari yang sama
    }
  }

  int _calculateTotalPrice() {
    Duration duration = endDate.difference(startDate);
    int days = duration.inDays;

    if (days <= 0) {
      return 10000; // Jika tanggal akhir sebelum tanggal mulai, anggap sebagai 1 hari dengan harga dasar 10000
    } else {
      return 10000 *
          (days +
              1); // Jumlah hari ditambah 1 untuk pemesanan pada hari yang sama
    }
  }

  Widget _buildDetailItem(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 16, color: Colors.grey[700]),
        ),
        Text(
          value,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
