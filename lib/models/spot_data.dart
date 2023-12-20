class PhotoSpot {
  final String name;
  final String imagePath;
  final String description;

  PhotoSpot(this.name, this.imagePath, this.description);
}

List<PhotoSpot> photoSpotsData = [
  PhotoSpot('Pesisir Kidul', 'assets/images/spot1.jpg',
      'Spot Foto Bernuansa Sunset'),
  PhotoSpot('Pesisir kulon', 'assets/images/spot2.jpg',
      'Spot Foto Bernuansa Sunrise'),
  PhotoSpot('Cafetaria', 'assets/images/spot3.jpg',
      'Pemandangan Indah Didekat Cafetaria'),
  PhotoSpot('Gunung Megah', 'assets/images/spot1.jpg',
      'Pemandangan megah dari puncak gunung.'),
  PhotoSpot('Pantai Indah', 'assets/images/spot1.jpg',
      'Pantai eksotis dengan pasir putih yang indah.'),
  PhotoSpot('Hutan Hijau', 'assets/images/spot2.jpg',
      'Hutan yang sejuk dengan pepohonan hijau dan segar.'),
  // Tambahkan lebih banyak tempat foto sesuai kebutuhan
];
