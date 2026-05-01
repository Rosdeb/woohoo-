import 'dart:ui';

enum NotificationType { social, challenge, streak, invite }

class AppNotification {
  final String id;
  final String title;
  final String timeLabel; // e.g., "2m", "1h", "Yesterday"
  final String? initial;  // For user-based icons
  final String? emoji;    // For challenge/streak icons
  final Color? color;     // Icon background color
  final NotificationType type;
  final bool isUnread;

  AppNotification({
    required this.id,
    required this.title,
    required this.timeLabel,
    this.initial,
    this.emoji,
    this.color,
    this.type = NotificationType.social,
    this.isUnread = false,
  });

  // Factory to handle different data shapes from a backend or local state
  factory AppNotification.fromJson(Map<String, dynamic> json) {
    return AppNotification(
      id: json['id'],
      title: json['title'],
      timeLabel: json['timeLabel'],
      initial: json['initial'],
      emoji: json['emoji'],
      color: json['color'] != null ? Color(json['color']) : null,
      isUnread: json['isUnread'] ?? false,
      type: NotificationType.values.firstWhere(
            (e) => e.toString() == 'NotificationType.${json['type']}',
        orElse: () => NotificationType.social,
      ),
    );
  }
}