import 'package:flutter/material.dart';

class DrinkData {
  const DrinkData({
    required this.name,
    required this.subtitle,
    required this.price,
    required this.icon,
    required this.category,
    this.soldOut = false,
  });

  final String name;
  final String subtitle;
  final double price;
  final IconData icon;
  final String category;
  final bool soldOut;
}
