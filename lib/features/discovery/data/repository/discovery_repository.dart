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

class DiscoveryRepository {
  List<DiscoveryCategory> fetchCategories() {
    return const [
      DiscoveryCategory(id: 'all', label: 'All', icon: Icons.grid_view_rounded),
      DiscoveryCategory(id: 'dinner', label: 'Dinner', icon: Icons.restaurant_rounded),
      DiscoveryCategory(id: 'drinks', label: 'Drinks', icon: Icons.local_bar_rounded),
      DiscoveryCategory(id: 'coffee', label: 'Coffee', icon: Icons.coffee_rounded),
      DiscoveryCategory(id: 'events', label: 'Events', icon: Icons.celebration_rounded),
      DiscoveryCategory(id: 'outdoor', label: 'Outdoor', icon: Icons.park_rounded),
    ];
  }

  List<DiscoveryVenue> fetchFeatured() {
    return const [
      DiscoveryVenue(
        id: '1',
        name: 'Bar Lune',
        category: 'Cocktails · Late Night',
        location: 'Fitzroy',
        distance: '0.8km',
        rating: 4.9,
        imagePath: 'assets/images/barluna.jpg',
        accentColor: Color(0xFFB94A2C),
        isHot: true,
        goingCount: 12,
      ),
      DiscoveryVenue(
        id: '2',
        name: 'Tipo 00',
        category: 'Italian · Dinner',
        location: 'Fitzroy',
        distance: '1.2km',
        rating: 4.8,
        imagePath: 'assets/images/night_club.jpg',
        accentColor: Color(0xFFE07B2A),
        isNew: true,
        goingCount: 8,
      ),
      DiscoveryVenue(
        id: '3',
        name: 'Night Cat',
        category: 'Live Music · Late',
        location: 'Fitzroy',
        distance: '1.5km',
        rating: 4.7,
        imagePath: 'assets/images/barluna.jpg',
        accentColor: Color(0xFFB8902A),
        isNew: true,
        goingCount: 5,
      ),
    ];
  }

  List<DiscoveryVenue> fetchNearby() {
    return const [
      DiscoveryVenue(
        id: '4',
        name: 'Black Pearl',
        category: 'Cocktails · Bar',
        location: 'Fitzroy',
        distance: '0.5km',
        rating: 4.6,
        imagePath: 'assets/images/night_club.jpg',
        accentColor: Color(0xFF1A6B8A),
        goingCount: 3,
      ),
      DiscoveryVenue(
        id: '5',
        name: 'Cibi',
        category: 'Japanese · Café',
        location: 'Collingwood',
        distance: '1.8km',
        rating: 4.5,
        imagePath: 'assets/images/barluna.jpg',
        accentColor: Color(0xFF2A7A4B),
        isNew: true,
        goingCount: 6,
      ),
      DiscoveryVenue(
        id: '6',
        name: 'Builders Arms',
        category: 'Pub · Dinner',
        location: 'Fitzroy',
        distance: '0.3km',
        rating: 4.4,
        imagePath: 'assets/images/night_club.jpg',
        accentColor: Color(0xFF8A3A5A),
        isHot: true,
        goingCount: 14,
      ),
      DiscoveryVenue(
        id: '7',
        name: 'Supernormal',
        category: 'Asian · Dinner',
        location: 'CBD',
        distance: '3.1km',
        rating: 4.8,
        imagePath: 'assets/images/barluna.jpg',
        accentColor: Color(0xFF5B3FA6),
        goingCount: 9,
      ),
    ];
  }
}

// Fix: add isDinner to the class
extension DiscoveryVenueExt on DiscoveryVenue {
  bool get isDinner => category.toLowerCase().contains('dinner');
}