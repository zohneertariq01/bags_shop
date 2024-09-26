
class LampItem {
  final String name;
  final double price;
  final String imageUrl;
   bool isLiked;
  final String description;
  final double rating;
  final int voltage;
  final String batteryTiming;
  final int availableColors;
  final List<String> sizes;
  int count;  // New count property

  LampItem({
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.isLiked,
    required this.description,
    required this.rating,
    required this.voltage,
    required this.batteryTiming,
    required this.availableColors,
    required this.sizes,
    this.count = 1,  // Initialize count to 1
  });
}

