import 'dart:ui';

import '../models/map_user.dart';

class MapRepository {
  List<MapUser> fetchMapUsers() {
    return const [
      MapUser(id: '1', initial: 'J', color: Color(0xFFD4A017), lat: 37.7752, lng: -122.4190),
      MapUser(id: '2', initial: 'A', color: Color(0xFFB94A2C), lat: 37.7745, lng: -122.4205),
      MapUser(id: '3', initial: 'M', color: Color(0xFF2A7A4B), lat: 37.7758, lng: -122.4180),
      MapUser(id: '4', initial: 'S', color: Color(0xFF5B3FA6), lat: 37.7740, lng: -122.4195),
      MapUser(id: '5', initial: 'P', color: Color(0xFFD45E1A), lat: 37.7762, lng: -122.4210),
    ];
  }

  VenueDetail fetchVenueDetail(String id) {
    const users = [
      MapUser(id: '1', initial: 'J', color: Color(0xFFD4A017), lat: 0, lng: 0),
      MapUser(id: '2', initial: 'A', color: Color(0xFFB94A2C), lat: 0, lng: 0),
      MapUser(id: '3', initial: 'M', color: Color(0xFF2A7A4B), lat: 0, lng: 0),
      MapUser(id: '4', initial: 'S', color: Color(0xFF5B3FA6), lat: 0, lng: 0),
      MapUser(id: '5', initial: 'P', color: Color(0xFFD45E1A), lat: 0, lng: 0),
    ];

    return const VenueDetail(
      id: '1',
      name: 'Tipo 00',
      category: 'Italian',
      location: 'Fitzroy',
      distance: '1.2km away',
      rating: 4.8,
      bookings: 44,
      time: '7PM',
      spots: 6,
      whoIsGoing: users,
      othersCount: 4,
      imagePath: 'assets/images/barluna.jpg',
      isOriginal: true,
      isDinner: true,
    );
  }
}