import 'dart:ui';

class ConnectionUser {
  final String id;
  final String name;
  final String avatarInitial;
  final Color avatarColor;
  final String location;
  final int mutualCount;
  final bool isFollowing;

  const ConnectionUser({
    required this.id,
    required this.name,
    required this.avatarInitial,
    required this.avatarColor,
    required this.location,
    required this.mutualCount,
    this.isFollowing = false,
  });

  ConnectionUser copyWith({bool? isFollowing}) {
    return ConnectionUser(
      id: id,
      name: name,
      avatarInitial: avatarInitial,
      avatarColor: avatarColor,
      location: location,
      mutualCount: mutualCount,
      isFollowing: isFollowing ?? this.isFollowing,
    );
  }
}