import 'package:deeraj/features/bottomNavigation/providers/bottom_nav_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/theme/app_color.dart';
import '../connection/presentation/screen/connection_screen.dart';
import '../discovery/presentation/screen/discovery_screen.dart';
import '../profile/presentation/screen/profile_screen.dart';
import 'widgets/custom_bottom_nav.dart';

import '../home/presentation/screen/home_screen.dart';
import '../challenges/presentation/screen/challenges_screen.dart';

class BottomNavWrapper extends ConsumerWidget {
  const BottomNavWrapper({super.key});

  static const List<Widget> _pages = [
    HomePage(),
    DiscoveryScreen(),
    SizedBox(),
    ConnectionsScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(bottomNavIndexProvider);

    return Scaffold(
      backgroundColor: Colors.black,
      body: IndexedStack(
        index: currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: CustomBottomNav(
        currentIndex: currentIndex,
        onTap: (index) {
          if (index == 2) return; // handled by FAB
          ref.read(bottomNavIndexProvider.notifier).state = index;
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        height: 56,
        width: 56,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.primary,
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withOpacity(0.45),
              blurRadius: 16,
              spreadRadius: 2,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          shape: const CircleBorder(),
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            onTap: () {
              // Handle create/post action
            },
            child: const Icon(
              Icons.add_rounded,
              color: Colors.black,
              size: 32,
            ),
          ),
        ),
      ),
    );
  }
}