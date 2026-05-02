import 'package:deeraj/core/components/AppText/appText.dart';
import 'package:deeraj/core/components/IOSTappEffect/iosTapEffect.dart';
import 'package:deeraj/core/constants/app_constants.dart';
import 'package:deeraj/core/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TipoOoScreen extends StatelessWidget {
  const TipoOoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final topPadding = MediaQuery.of(context).padding.top;

    return Scaffold(
      backgroundColor: const Color(0xFF0F110C),
      body: Stack(
        children: [
          // Background Image
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: size.height * 0.35,
            child: Image.asset("assets/images/tipoo.jpg"),
          ),

          // Scrollable Content
          Positioned.fill(
            child: SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: Column(
                children: [
                  SizedBox(height: size.height * 0.30),
                  Container(
                    constraints: BoxConstraints(
                      minHeight: size.height * 0.70,
                    ),
                    decoration: const BoxDecoration(
                      color: Color(0xFF0F110C),
                      borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 30.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// Labels
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                              decoration: BoxDecoration(
                                color: AppColors.primary,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const AppText('ORIGINAL', fontSize: 13, fontWeight: FontWeight.bold, color: Colors.black),
                            ),
                            const SizedBox(width: 12),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                              decoration: BoxDecoration(
                                color: const Color(0xFF3E1F0F),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const AppText('DINNER', fontSize: 13, fontWeight: FontWeight.bold, color: Color(0xFFE27C21)),
                            ),
                          ],
                        ),
                        const SizedBox(height: 14),

                        // Title
                        const AppText('Tipo 00', fontSize: 40, fontWeight: FontWeight.w800, color: Colors.white),
                        const SizedBox(height: 3),

                        // Subtitle
                        AppText('Italian • Fitzroy • 1.2km away', fontSize: 16, color: Colors.white.withValues(alpha: 0.6)),
                        const SizedBox(height: 16),

                        // Info boxes
                        Row(
                          children: [
                            Expanded(child: _buildInfoBox('4.8', 'RATING')),
                            const SizedBox(width: 5),
                            Expanded(child: _buildInfoBox('\$\$', 'PRICE')),
                            const SizedBox(width: 5),
                            Expanded(child: _buildInfoBox('7PM', 'BOOKED')),
                            const SizedBox(width: 5),
                            Expanded(child: _buildInfoBox('6', 'GOING')),
                          ],
                        ),
                        const SizedBox(height: 16),

                        // Who's going
                        AppText("WHO'S GOING", fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white.withValues(alpha: 0.6)),
                        const SizedBox(height: 14),
                        Row(
                          children: [
                            SizedBox(
                              width: 140,
                              height: 36,
                              child: Stack(
                                children: [
                                  _buildAvatar('J', const Color(0xFFF1A832), 0),
                                  _buildAvatar('K', const Color(0xFF4AC2A4), 25),
                                  _buildAvatar('M', const Color(0xFFDD5346), 50),
                                  _buildAvatar('A', const Color(0xFFEE8A25), 75),
                                  _buildAvatar('S', AppColors.primary, 100),
                                ],
                              ),
                            ),
                            const SizedBox(width: 8),
                            RichText(
                              text: TextSpan(
                                style: const TextStyle(fontSize: 14, fontFamily: AppConstants.FONT_FAMILY),
                                children: [
                                  const TextSpan(text: 'Jess ', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                                  TextSpan(text: '& 4 others', style: TextStyle(color: Colors.white.withValues(alpha: 0.6))),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),

                        // Join Button
                        IosTapEffect(
                          onTap: () {},
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                            decoration: BoxDecoration(
                              color: AppColors.primary,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const AppText('Join dinner', fontSize: 20, fontWeight: FontWeight.w800, color: Colors.black),
                                    AppText('Tonight • 7:00 PM', fontSize: 13, color: Colors.black.withValues(alpha: 0.6), fontWeight: FontWeight.w600),
                                  ],
                                ),
                                const Icon(Icons.arrow_forward, color: Colors.black, size: 28),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),



          // App Bar Overlay
          Positioned(
            top: topPadding + 10,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IosTapEffect(
                  onTap: () {
                    if (context.canPop()) {
                      context.pop();
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(alpha: 0.35),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 20),
                  ),
                ),
                IosTapEffect(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(alpha: 0.35),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.favorite_border, color: Colors.white, size: 20),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoBox(String text, String subtext) {
    return Container(
      width: double.infinity,
      height: 75,
      decoration: BoxDecoration(
        color: const Color(0xFF1A1D1F),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.grey,
          width: 0.5,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppText(text, color: AppColors.primary, fontSize: 22, fontWeight: FontWeight.bold),
          const SizedBox(height: 2),
          AppText(subtext, color: Colors.white54, fontSize: 11, fontWeight: FontWeight.bold),
        ],
      ),
    );
  }

  Widget _buildAvatar(String letter, Color color, double leftOffset) {
    return Positioned(
      left: leftOffset,
      child: Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          border: Border.all(color: const Color(0xFF0F110C), width: 2),
        ),
        alignment: Alignment.center,
        child: AppText(letter, color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }
}
