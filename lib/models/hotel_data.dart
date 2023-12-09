// models/hotel_model.dart
class Hotel {
  final String name;
  final String description;
  final String imagePath;
  final double rating;
  final String location;
  final double price;

  Hotel({
    required this.name,
    required this.description,
    required this.imagePath,
    required this.rating,
    required this.location,
    required this.price,
  });
}
