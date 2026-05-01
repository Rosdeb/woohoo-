import 'package:deeraj/core/components/AppText/appText.dart';
import 'package:deeraj/core/components/WoohooLogo/woohooLogo.dart';
import 'package:deeraj/core/constants/app_constants.dart';
import 'package:deeraj/core/theme/app_color.dart';
import 'package:deeraj/features/notification/presentation/widgets/notificationTile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../data/providers/notification_provider.dart';

class NotificationPage extends ConsumerWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notificationsAsync = ref.watch(notificationsProvider);
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFF0F110C),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Column(
          children: [
            SizedBox(height: size.height * 0.04),
            WoohooLogo(),
            SizedBox(height: size.height * 0.01),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // For the "Notifications" Header
                // Text(
                //   'Notifications',
                //   style: GoogleFonts.fredoka(
                //     fontSize: 28,
                //     fontWeight: FontWeight.bold,
                //     color: Colors.white,
                //     letterSpacing: -0.5,
                //   ),
                // ),
                AppText(
                  "Notifications",
                  color: AppColors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  style: GoogleFonts.fredoka(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: -0.5,
                  ),),
                AppText(
                  "Mark all",
                  style: GoogleFonts.fredoka(
                    color: AppColors.primary,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    )
                ),
              ],
            ),
            notificationsAsync.when(
              data: (list) => Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.only(top: 5),
                  itemCount: list.length,
                  itemBuilder: (context, index) =>
                      NotificationTile(notification: list[index]),
                ),
              ),
              loading: () => const Center(child: CupertinoActivityIndicator()),
              error: (err, stack) => Center(child: Text('Error: $err')),
            ),
          ],
        ),
      ),
    );
  }
}
