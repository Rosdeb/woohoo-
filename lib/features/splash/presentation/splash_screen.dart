import 'package:deeraj/core/components/AppText/appText.dart';
import 'package:deeraj/core/router/route_names.dart';
import 'package:deeraj/core/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../notification/data/providers/notification_provider.dart';
class SplashScreen extends ConsumerStatefulWidget {
  SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _startAppInitialization();
  }

  Future<void> _startAppInitialization() async {
    // 1. Warm up the providers
    // This starts fetching notifications in the background during the splash
    ref.read(notificationsProvider.future);
    // 2. Wait for 3 seconds
    await Future.delayed(const Duration(seconds: 3));

    // 3. Navigate to Home
    if (mounted) {
      context.goNamed(AppPath.home);
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    Widget angledExclamation(Color color) => Transform.rotate(
      angle: 0.30,
      child: Text(
        '!',
        style: TextStyle(
          fontSize: 44,
          fontWeight: FontWeight.w900,
          color: color,
          letterSpacing: -1,
        ),
      ),
    );

    return Scaffold(
      backgroundColor: const Color(0xFF0F110C),
      body: Container(
        decoration: BoxDecoration(
            gradient: RadialGradient(
              center: Alignment.center,
              radius: 0.8,
              colors: [
                Color(0xFF1A2E05),
                Color(0xFF0F110C),
              ],
            ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: size.height * 0.3),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                decoration: BoxDecoration(
                  color: const Color(0xFFA6FF4D), // Lime green
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: const Color(0xFF4DEFFF), // Cyan top border
                    width: 2,
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0xFFFF00FF), // Magenta bottom shadow
                      offset: Offset(0, 4),
                      blurRadius: 0,
                    ),
                  ],
                ),
                child: IntrinsicWidth(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      // 1. The "Drop Shadow" Text (Shifted down/right)
                      Transform.translate(
                        offset: const Offset(3, 3),
                        child: Text(
                          'WOOHOO!',
                          style: TextStyle(
                            fontSize: 44,
                            fontWeight: FontWeight.w900,
                            color: Colors.black.withOpacity(0.2),
                            letterSpacing: -1,
                          ),
                        ),
                      ),
                      // 2. The Main RichText (The actual visible letters)
                      RichText(
                        text: TextSpan(
                          style: const TextStyle(
                            fontSize: 44,
                            fontWeight: FontWeight.w900,
                            color: Colors.black,
                            letterSpacing: -1,
                          ),
                          children: [
                            const TextSpan(
                              text: 'W',
                              style: TextStyle(color: Color(0xFFFF7A00)), // Vibrant Orange
                            ),
                            const TextSpan(text: 'OOHOO'),
                            const WidgetSpan(child: SizedBox(width: 10)),
                            WidgetSpan(child: angledExclamation(const Color(0xFFFF7A00))),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              AppText(
                'MEET PEOPLE · FIND PLACES · IRL',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.6),
                  letterSpacing: 1.5,
                  fontWeight: FontWeight.w700,
                  fontSize: 12,
                ),
              ),
              const Spacer(),
              CircularProgressIndicator(color: AppColors.Primary,strokeWidth: 1.8,),
              SizedBox(height: size.height * 0.3),

            ],
          ),
        ),
      ),
    );
  }
}
