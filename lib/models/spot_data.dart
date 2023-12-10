class PhotoSpot {
  final String name;
  final String imagePath;
  final String description;

  PhotoSpot(this.name, this.imagePath, this.description);
}

List<PhotoSpot> photoSpotsData = [
  PhotoSpot('Pantai Indah', 'assets/images/spot1.jpg',
      'Pantai eksotis dengan pasir putih yang indah.'),
  PhotoSpot('Hutan Hijau', 'assets/images/spot2.jpg',
      'Hutan yang sejuk dengan pepohonan hijau dan segar.'),
  PhotoSpot('Gunung Megah', 'assets/images/spot3.jpg',
      'Pemandangan megah dari puncak gunung.'),
  PhotoSpot('Gunung Megah', 'assets/images/spot1.jpg',
      'Pemandangan megah dari puncak gunung.'),
  PhotoSpot('Pantai Indah', 'assets/images/spot1.jpg',
      'Pantai eksotis dengan pasir putih yang indah.'),
  PhotoSpot('Hutan Hijau', 'assets/images/spot2.jpg',
      'Hutan yang sejuk dengan pepohonan hijau dan segar.'),
  // Tambahkan lebih banyak tempat foto sesuai kebutuhan
];
