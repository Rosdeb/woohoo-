import 'package:flutter/material.dart';

class MapUser {
  final String id;
  final String initial;
  final Color color;
  final double lat;
  final double lng;

  const MapUser({
    required this.id,
    required this.initial,
    required this.color,
    required this.lat,
    required this.lng,
  });
}

class VenueDetail {
  final String id;
  final String name;
  final String category;
  final String location;
  final String distance;
  final double rating;
  final int bookings;
  final String time;
  final int spots;
  final List<MapUser> whoIsGoing;
  final int othersCount;
  final String imagePath;
  final bool isOriginal;
  final bool isDinner;

  const VenueDetail({
    required this.id,
    required this.name,
    required this.category,
    required this.location,
    required this.distance,
    required this.rating,
    required this.bookings,
    required this.time,
    required this.spots,
    required this.whoIsGoing,
    required this.othersCount,
    required this.imagePath,
    this.isOriginal = false,
    this.isDinner = false,
  });
}