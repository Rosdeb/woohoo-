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
        color: AppColors.orange,
        isUnread: true,
      ),
      AppNotification(
        id: '2',
        title: 'Challenge unlocked: Live & Loud complete',
        timeLabel: '1h',
        emoji: 'R',
        color: AppColors.orange,
        type: NotificationType.challenge,
        isUnread: true,
      ),
    ];
  }
}