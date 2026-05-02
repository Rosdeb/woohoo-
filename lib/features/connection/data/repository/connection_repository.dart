import 'dart:ui';

import '../models/connection_model.dart';

class ConnectionRepository {
  List<ConnectionUser> fetchConnections() {
    return const [
      ConnectionUser(
        id: '1',
        name: 'Alex Rivera',
        avatarInitial: 'A',
        avatarColor: Color(0xFFB94A2C),
        location: 'Fitzroy · 89 places',
        mutualCount: 12,
        isFollowing: true,
      ),
      ConnectionUser(
        id: '2',
        name: 'Mia Tanaka',
        avatarInitial: 'M',
        avatarColor: Color(0xFFD4A017),
        location: 'Collingwood · 54 places',
        mutualCount: 7,
        isFollowing: false,
      ),
      ConnectionUser(
        id: '3',
        name: 'Sam Okafor',
        avatarInitial: 'S',
        avatarColor: Color(0xFF2A7A4B),
        location: 'Richmond · 120 places',
        mutualCount: 3,
        isFollowing: true,
      ),
      ConnectionUser(
        id: '4',
        name: 'Priya Nair',
        avatarInitial: 'P',
        avatarColor: Color(0xFF5B3FA6),
        location: 'Brunswick · 67 places',
        mutualCount: 9,
        isFollowing: false,
      ),
      ConnectionUser(
        id: '5',
        name: 'Leo Marchetti',
        avatarInitial: 'L',
        avatarColor: Color(0xFFD45E1A),
        location: 'Northcote · 31 places',
        mutualCount: 5,
        isFollowing: false,
      ),
      ConnectionUser(
        id: '6',
        name: 'Zara Mensah',
        avatarInitial: 'Z',
        avatarColor: Color(0xFF1A6B8A),
        location: 'Fitzroy · 98 places',
        mutualCount: 14,
        isFollowing: true,
      ),
    ];
  }

  List<ConnectionUser> fetchSuggestions() {
    return const [
      ConnectionUser(
        id: '7',
        name: 'Kai Yamamoto',
        avatarInitial: 'K',
        avatarColor: Color(0xFFB8902A),
        location: 'Carlton · 45 places',
        mutualCount: 6,
      ),
      ConnectionUser(
        id: '8',
        name: 'Isla Brown',
        avatarInitial: 'I',
        avatarColor: Color(0xFF8A3A5A),
        location: 'St Kilda · 78 places',
        mutualCount: 2,
      ),
      ConnectionUser(
        id: '9',
        name: 'Omar Hassan',
        avatarInitial: 'O',
        avatarColor: Color(0xFF3A7A2A),
        location: 'Prahran · 55 places',
        mutualCount: 8,
      ),
    ];
  }
}