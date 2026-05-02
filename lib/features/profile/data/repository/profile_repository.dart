class PlaceVisit {
  final String title;
  final String date;
  final String imagePath;
  final bool hasOverlay;

  const PlaceVisit({
    required this.title,
    required this.date,
    required this.imagePath,
    this.hasOverlay = false,
  });
}

class ProfileData {
  final String name;
  final String avatarInitial;
  final String location;
  final int placesCount;
  final int friendsCount;
  final int streakCount;
  final String badge;
  final List<PlaceVisit> visitedPlaces;

  const ProfileData({
    required this.name,
    required this.avatarInitial,
    required this.location,
    required this.placesCount,
    required this.friendsCount,
    required this.streakCount,
    required this.badge,
    required this.visitedPlaces,
  });
}

class ProfileRepository {
  ProfileData fetchProfile() {
    return const ProfileData(
      name: 'Jess Chen',
      avatarInitial: 'J',
      location: 'Fitzroy',
      placesCount: 142,
      friendsCount: 38,
      streakCount: 12,
      badge: 'ORIGINAL',
      visitedPlaces: [
        PlaceVisit(
          title: 'Bar Lune',
          date: 'Mar 14',
          imagePath: 'assets/images/barluna.jpg',
        ),
        PlaceVisit(
          title: 'Cibi',
          date: 'Mar 11',
          imagePath: 'assets/images/night_club.jpg',
          hasOverlay: true,
        ),
        PlaceVisit(
          title: 'Night Cat',
          date: 'Mar 9',
          imagePath: 'assets/images/barluna.jpg',
          hasOverlay: true,
        ),
        PlaceVisit(
          title: 'Black Pearl',
          date: 'Mar 6',
          imagePath: 'assets/images/night_club.jpg',
        ),
      ],
    );
  }
}