import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

import '../models/connection_model.dart';
import '../repository/connection_repository.dart';

final connectionRepositoryProvider = Provider<ConnectionRepository>((ref) {
  return ConnectionRepository();
});

final connectionTabProvider = StateProvider<int>((ref) => 0);

final searchQueryProvider = StateProvider<String>((ref) => '');

// Connections list with follow toggle
class ConnectionsNotifier extends StateNotifier<List<ConnectionUser>> {
  ConnectionsNotifier(List<ConnectionUser> initial) : super(initial);

  void toggleFollow(String id) {
    state = state.map((u) {
      return u.id == id ? u.copyWith(isFollowing: !u.isFollowing) : u;
    }).toList();
  }
}

final connectionsProvider =
StateNotifierProvider<ConnectionsNotifier, List<ConnectionUser>>((ref) {
  final repo = ref.watch(connectionRepositoryProvider);
  return ConnectionsNotifier(repo.fetchConnections());
});

// Suggestions with follow toggle
class SuggestionsNotifier extends StateNotifier<List<ConnectionUser>> {
  SuggestionsNotifier(List<ConnectionUser> initial) : super(initial);

  void toggleFollow(String id) {
    state = state.map((u) {
      return u.id == id ? u.copyWith(isFollowing: !u.isFollowing) : u;
    }).toList();
  }
}

final suggestionsProvider =
StateNotifierProvider<SuggestionsNotifier, List<ConnectionUser>>((ref) {
  final repo = ref.watch(connectionRepositoryProvider);
  return SuggestionsNotifier(repo.fetchSuggestions());
});

// Filtered connections based on search
final filteredConnectionsProvider = Provider<List<ConnectionUser>>((ref) {
  final query = ref.watch(searchQueryProvider).toLowerCase();
  final list = ref.watch(connectionsProvider);
  if (query.isEmpty) return list;
  return list.where((u) => u.name.toLowerCase().contains(query)).toList();
});