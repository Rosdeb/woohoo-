import 'package:flutter/material.dart';

class DiscoveryVenue {
  final String id;
  final String name;
  final String category;
  final String location;
  final String distance;
  final double rating;
  final String imagePath;
  final bool isHot;
  final bool isNew;
  final int goingCount;
  final Color accentColor;

  const DiscoveryVenue({
    required this.id,
    required this.name,
    required this.category,
    required this.location,
    required this.distance,
    required this.rating,
    required this.imagePath,
    required this.accentColor,
    this.isHot = false,
    this.isNew = false,
    this.goingCount = 0,
  });
}

class DiscoveryCategory {
  final String id;
  final String label;
  final IconData icon;

  const DiscoveryCategory({
    required this.id,
    required this.label,
    required this.icon,
  });
}