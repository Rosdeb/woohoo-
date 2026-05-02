import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

import '../models/map_user.dart';
import '../repository/map_repository.dart';

final mapRepositoryProvider = Provider<MapRepository>((ref) => MapRepository());

final mapUsersProvider = Provider<List<MapUser>>((ref) {
  return ref.watch(mapRepositoryProvider).fetchMapUsers();
});

final selectedVenueProvider = StateProvider<String?>((ref) => null);

final venueDetailProvider = Provider.family<VenueDetail, String>((ref, id) {
  return ref.watch(mapRepositoryProvider).fetchVenueDetail(id);
});

final customMarkersProvider = StateProvider<Map<String, dynamic>>((ref) => {});