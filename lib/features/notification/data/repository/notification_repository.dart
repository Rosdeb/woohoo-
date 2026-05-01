import 'package:deeraj/core/theme/app_color.dart';
import 'package:flutter/material.dart';
import '../models/notification_model.dart';

abstract class INotificationRepository {
  Future<List<AppNotification>> getNotifications();
}

class NotificationRepository implements INotificationRepository {
  @override
  Future<List<AppNotification>> getNotifications() async {
    // Simulating network delay
    await Future.delayed(const Duration(milliseconds: 800));
    return [
      AppNotification(
        id: '1',
        title: 'Maya is going to Tipo 00 tonight',
        timeLabel: '2m',
        initial: 'M',
        color: Colors.orange,
        isUnread: true,
      ),
      AppNotification(
        id: '2',
        title: 'Challenge unlocked: Live & Loud complete',
        timeLabel: '1h',
        initial: '🏆',
        color: Colors.yellow,
        isUnread: true,
      ),
      AppNotification(
        id: '3',
        title: 'Alex invited you to Black Pearl',
        timeLabel: '3h',
        initial: 'A',
        color: Colors.red,
        isUnread: true,
      ),
      AppNotification(
        id: '4',
        title: 'Kai saved your place · Cibi',
        timeLabel: 'Yesterday',
        initial: 'K',
        color: Colors.green,
        isUnread: false,
      ),
      AppNotification(
        id: '5',
        title: '12-day streak! Keep exploring',
        timeLabel: 'Yesterday',
        emoji: '🔥',
        color: Colors.lightGreen,
        isUnread: false,
      ),
      AppNotification(
        id: '6',
        title: 'Sam joined the Night Cat hang',
        timeLabel: '2d',
        initial: 'S',
        color: Colors.amber,
        isUnread: false,
      ),
    ];
  }
}