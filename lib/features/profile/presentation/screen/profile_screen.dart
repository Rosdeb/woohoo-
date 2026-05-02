import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/components/AppText/appText.dart';
import '../../../../core/components/IOSTappEffect/iosTapEffect.dart';
import '../../../../core/theme/app_color.dart';
import '../../../../core/components/WoohooLogo/woohooLogo.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F110C),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 10),
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Hidden back button to balance the row and keep Logo centered
                  IosTapEffect(
                    onTap: () {
                      if (context.canPop()) {
                        context.pop();
                      }
                    },
                    child: Container(
                      width: 40,
                      height: 40,
                      color: Colors.transparent, // Invisible but clickable
                    ),
                  ),
                  const WoohooLogo(),
                  IosTapEffect(
                    onTap: () {},
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: const Color(0xFF1E2124),
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white.withValues(alpha: 0.05)),
                      ),
                      child: const Icon(Icons.settings_outlined, color: Colors.white, size: 20),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),

              // Avatar
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: const LinearGradient(
                    colors: [Color(0xFFC7E547), Color(0xFFE99320)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFFC7E547).withValues(alpha: 0.1),
                      blurRadius: 30,
                      spreadRadius: 10,
                      offset: const Offset(0, 0),
                    ),
                  ],
                ),
                child: const Center(
                  child: AppText(
                    'J',
                    fontSize: 48,
                    fontWeight: FontWeight.w900,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Name
              const AppText('Jess Chen', fontSize: 28, fontWeight: FontWeight.w800, color: Colors.white),
              const SizedBox(height: 6),

              // Location / Stats
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('📍', style: TextStyle(fontSize: 12)),
                  const SizedBox(width: 6),
                  AppText('Fitzroy • 142 places • 38 friends', fontSize: 13, color: Colors.white.withValues(alpha: 0.6)),
                ],
              ),
              const SizedBox(height: 20),

              // Badges
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Row(
                      children: [
                        Text('🔥', style: TextStyle(fontSize: 12)),
                        SizedBox(width: 4),
                        AppText('STREAK • 12', fontSize: 12, fontWeight: FontWeight.w800, color: Colors.black),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: const Color(0xFFED7D31),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const AppText('ORIGINAL', fontSize: 12, fontWeight: FontWeight.w800, color: Colors.black),
                  ),
                ],
              ),
              const SizedBox(height: 35),

              // Tabs
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF1E2124),
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
                ),
                padding: const EdgeInsets.all(4),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(26),
                        ),
                        child: const Center(
                          child: AppText('Visited', fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                      ),
                    ),
                    const Expanded(
                      child: Center(
                        child: AppText('Saved', fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white54),
                      ),
                    ),
                    const Expanded(
                      child: Center(
                        child: AppText('Reviews', fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white54),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25),

              // Grid View
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.88,
                children: [
                  _buildPlaceCard('Bar Lune', 'Mar 14', const Color(0xFFAB4532)),
                  _buildPlaceCard('Cibi', 'Mar 11', const Color(0xFFE98522), showStripes: true),
                  _buildPlaceCard('Night Cat', 'Mar 9', const Color(0xFFB59325)),
                  _buildPlaceCard('Black Pearl', 'Mar 6', const Color(0xFFAD3B29)),
                ],
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPlaceCard(String title, String date, Color color, {bool showStripes = false}) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1A1D1F),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withValues(alpha: 0.05)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 4,
            child: Container(
              decoration: BoxDecoration(
                color: color,
                borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
              ),
              child: showStripes ? _buildStripes(color) : null,
            ),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppText(title, fontSize: 16, fontWeight: FontWeight.w800, color: Colors.white),
                  const SizedBox(height: 4),
                  AppText(date, fontSize: 12, color: Colors.white.withValues(alpha: 0.5)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStripes(Color baseColor) {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
      child: CustomPaint(
        painter: StripePainter(),
        child: Container(),
      ),
    );
  }
}

class StripePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black.withValues(alpha: 0.15)
      ..strokeWidth = 15
      ..style = PaintingStyle.stroke;

    for (double i = -size.height * 2; i < size.width * 2; i += 30) {
      canvas.drawLine(
        Offset(i, 0),
        Offset(i + size.height * 2, size.height * 2),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
