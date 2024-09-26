import 'package:flutter/material.dart';

import '../repos/products_repo.dart';

class LampItemProvider extends ChangeNotifier {

   List<LampItem> _lampItems = [
    LampItem(
      name: 'Urban Voyager',
      price: 126.99,
      imageUrl: 'assets/images/bag1.png',
      isLiked: false,
      description:
      'The Urban Voyager Bag features a sleek, modern design with a brushed metal base and a warm, ambient glow. Perfect for both contemporary and traditional spaces, this Bag adds a touch of sophistication to any room.',
      rating: 4.5,
      voltage: 12,
      batteryTiming: '5 hours',
      availableColors: 3,
      sizes: ['Small', 'Medium', 'Large'],
    ),
    LampItem(
      name: 'Sahara Nomad',
      price: 280.50,
      imageUrl: 'assets/images/bag2.png',
      isLiked: true,
      description:
      'Sahara Nomad Bag boasts a unique, stylish design with a transparent glass body and elegant finish. Its modern aesthetic complements any décor, while providing ample light for reading or ambiance. A perfect blend of form and function.',
      rating: 4.8,
      voltage: 8,
      batteryTiming: '8 hours',
      availableColors: 4,
      sizes: ['Medium', 'Large'],
    ),
    LampItem(
      name: 'Midnight Elegance',
      price: 50.00,
      imageUrl: 'assets/images/bag3.png',
      isLiked: true,
      description:
      'Compact yet powerful, the Midnight Elegance Bag is designed for small spaces. Its minimalist design and bright light make it ideal for work or study areas. This lamp combines simplicity with efficiency, enhancing any workspace effortlessly.',
      rating: 4.2,
      voltage: 3,
      batteryTiming: '6 hours',
      availableColors: 2,
      sizes: ['Small'],
    ),
    LampItem(
      name: 'Harbor Sailor',
      price: 589.00,
      imageUrl: 'assets/images/bag4.png',
      isLiked: false,
      description:
      'Harbor Sailor Bag is a premium lighting solution with a luxurious design. Crafted with high-quality materials, it features an elegant silhouette that adds a touch of class to any space. Perfect for those seeking both style and substance.',
      rating: 4.9,
      voltage: 15,
      batteryTiming: '10 hours',
      availableColors: 5,
      sizes: ['Medium', 'Large'],
    ),
    LampItem(
      name: 'Vintage Scholar',
      price: 490.00,
      imageUrl: 'assets/images/bag5.png',
      isLiked: false,
      description:
      'A timeless classic, the Vintage Scholar Bag is a versatile piece that fits seamlessly into any room. Its elegant design, coupled with its reliable performance, makes it a must-have for those who value both aesthetics and functionality.',
      rating: 4.6,
      voltage: 7,
      batteryTiming: '7 hours',
      availableColors: 3,
      sizes: ['Medium'],
    ),
    LampItem(
      name: 'Tech Nomad',
      price: 490.00,
      imageUrl: 'assets/images/bag6.png',
      isLiked: false,
      description:
      'A timeless classic, the Tech Nomad Bag is a versatile piece that fits seamlessly into any room. Its elegant design, coupled with its reliable performance, makes it a must-have for those who value both aesthetics and functionality.',
      rating: 4.6,
      voltage: 18,
      batteryTiming: '7 hours',
      availableColors: 3,
      sizes: ['Medium'],
    ),
    LampItem(
      name: 'Aurora Breeze',
      price: 490.00,
      imageUrl: 'assets/images/bag7.png',
      isLiked: true,
      description:
      'A timeless classic, the Aurora Breeze Bag is a versatile piece that fits seamlessly into any room. Its elegant design, coupled with its reliable performance, makes it a must-have for those who value both aesthetics and functionality.',
      rating: 4.6,
      voltage: 4,
      batteryTiming: '7 hours',
      availableColors: 3,
      sizes: ['Medium'],
    ),
    LampItem(
      name: 'Sunset Sling',
      price: 490.00,
      imageUrl: 'assets/images/bag8.png',
      isLiked: false,
      description:
      'A timeless classic, the Sunset Sling Bag is a versatile piece that fits seamlessly into any room. Its elegant design, coupled with its reliable performance, makes it a must-have for those who value both aesthetics and functionality.',
      rating: 4.6,
      voltage: 10,
      batteryTiming: '7 hours',
      availableColors: 3,
      sizes: ['Medium'],
    ),
  ];

  List<LampItem> get lampItems => _lampItems;

  void updateCount(LampItem lampItem, int newCount) {
    lampItem.count = newCount;
    notifyListeners();
  }

  void likeItem(LampItem lampItem) {
    lampItem.isLiked = !lampItem.isLiked;
    notifyListeners();
  }
}
