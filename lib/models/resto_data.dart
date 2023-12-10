class Restaurant {
  final String name;
  final String cuisine;
  final double rating;
  final String imagePath;

  Restaurant({
    required this.name,
    required this.cuisine,
    required this.rating,
    required this.imagePath,
  });
}

// Fungsi untuk mendapatkan data restoran
List<Restaurant> getRestaurants() {
  return [
    Restaurant(
      name: 'Warung Makan Bahagia',
      cuisine: 'Masakan Nusantara',
      rating: 4.5,
      imagePath: 'assets/images/resto1.jpg',
    ),
    Restaurant(
      name: 'Sushi Sensation',
      cuisine: 'Masakan Jepang',
      rating: 4.7,
      imagePath: 'assets/images/resto2.jpg',
    ),
    Restaurant(
      name: 'Sushi Sensation',
      cuisine: 'Masakan Jepang',
      rating: 4.7,
      imagePath: 'assets/images/resto3.jpg',
    ),
    Restaurant(
      name: 'Sushi Sensation',
      cuisine: 'Masakan Jepang',
      rating: 4.7,
      imagePath: 'assets/images/resto1.jpg',
    ),
    Restaurant(
      name: 'Warung Makan Bahagia',
      cuisine: 'Masakan Nusantara',
      rating: 4.5,
      imagePath: 'assets/images/resto1.jpg',
    ),
    Restaurant(
      name: 'Sushi Sensation',
      cuisine: 'Masakan Jepang',
      rating: 4.7,
      imagePath: 'assets/images/resto2.jpg',
    ),
    // Tambahkan lebih banyak restoran sesuai kebutuhan
  ];
}
