import 'package:deeraj/core/components/AppText/appText.dart';
import 'package:deeraj/core/components/WoohooLogo/woohooLogo.dart';
import 'package:deeraj/core/theme/app_color.dart';
import 'package:deeraj/features/notification/presentation/widgets/notificationTile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/providers/notification_provider.dart';

class NotificationPage extends ConsumerWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notificationsAsync = ref.watch(notificationsProvider);

    return Scaffold(
      backgroundColor: const Color(0xFF0F110C),
      body: Column(
        children: [
          WoohooLogo(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            AppText("Notifications",color: AppColors.white,fontSize: 22,fontWeight: FontWeight.w700,),
            AppText("Mark all",color: AppColors.primary,fontWeight: FontWeight.w500,),
            ],
          ),
          notificationsAsync.when(
            data: (list) => ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) => NotificationTile(notification: list[index]),
            ),
            loading: () => const Center(child: CupertinoActivityIndicator()),
            error: (err, stack) => Center(child: Text('Error: $err')),
          ),
        ],
      ),
    );
  }
}