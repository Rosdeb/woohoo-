import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import '../repository/discovery_repository.dart';

final discoveryRepositoryProvider = Provider<DiscoveryRepository>(
      (ref) => DiscoveryRepository(),
);

final selectedCategoryProvider = StateProvider<String>((ref) => 'all');

final discoverySearchQueryProvider = StateProvider<String>((ref) => '');

final featuredVenuesProvider = Provider<List<DiscoveryVenue>>((ref) {
  return ref.watch(discoveryRepositoryProvider).fetchFeatured();
});

final nearbyVenuesProvider = Provider<List<DiscoveryVenue>>((ref) {
  final all = ref.watch(discoveryRepositoryProvider).fetchNearby();
  final category = ref.watch(selectedCategoryProvider);
  final query = ref.watch(discoverySearchQueryProvider).toLowerCase();

  var filtered = all;

  if (category != 'all') {
    filtered = filtered
        .where((v) => v.category.toLowerCase().contains(category))
        .toList();
  }

  if (query.isNotEmpty) {
    filtered = filtered
        .where((v) =>
    v.name.toLowerCase().contains(query) ||
        v.category.toLowerCase().contains(query) ||
        v.location.toLowerCase().contains(query))
        .toList();
  }

  return filtered;
});

final categoriesProvider = Provider<List<DiscoveryCategory>>((ref) {
  return ref.watch(discoveryRepositoryProvider).fetchCategories();
});