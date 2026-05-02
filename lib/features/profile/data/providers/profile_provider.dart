import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import '../repository/profile_repository.dart';

// Repository provider
final profileRepositoryProvider = Provider<ProfileRepository>((ref) {
  return ProfileRepository();
});

// Selected tab provider
final profileTabIndexProvider = StateProvider<int>((ref) => 0);

// Profile data provider
final profileDataProvider = Provider<ProfileData>((ref) {
  return ref.watch(profileRepositoryProvider).fetchProfile();
});