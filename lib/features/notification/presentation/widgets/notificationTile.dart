import 'package:deeraj/core/components/AppText/appText.dart';
import 'package:deeraj/core/theme/app_color.dart';
import 'package:flutter/material.dart';
import '../../data/models/notification_model.dart';

class NotificationTile extends StatelessWidget {
  final AppNotification notification;

  const NotificationTile({super.key, required this.notification});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 14,vertical: 7),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1D1F),
        borderRadius: BorderRadius.circular(10),
        border: notification.isUnread
            ? Border.all(color: const Color(0xFFA6FF4D).withOpacity(0.3))
            : null,
      ),
      child: Row(
        children: [
          _buildLeading(),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(notification.title, color: AppColors.white,fontSize: 14,maxLines: 1,),
                AppText(notification.timeLabel, color: AppColors.white.withValues(alpha: 0.5),fontSize: 12,),
              ],
            ),
          ),
          if (notification.isUnread)
            Icon(Icons.circle, size: 8, color: AppColors.primary),
        ],
      ),
    );
  }

  Widget _buildLeading() {
    if (notification.emoji != null) {
      return Text(notification.emoji!, style: const TextStyle(fontSize: 24));
    }
    return CircleAvatar(
      backgroundColor: notification.color ?? Colors.grey,
      child: Text(notification.initial ?? '', style: const TextStyle(color: Colors.black)),
    );
  }
}