import 'package:deeraj/core/components/AppText/appText.dart';
import 'package:deeraj/core/components/IOSTappEffect/iosTapEffect.dart';
import 'package:deeraj/core/router/route_names.dart';
import 'package:deeraj/core/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ChallengeProgressBar extends StatelessWidget {
  const ChallengeProgressBar({super.key});

  @override
  Widget build(BuildContext context) {
    return IosTapEffect(
      onTap: (){
        context.push(AppPath.challenges_screen);
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColors.grey.withValues(alpha: 0.40),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            width: 1,
            color: AppColors.white.withValues(alpha: 0.40),
          )
        ),
        child: Row(
          children: [
            const AppText(
              'Seasonal challenges',
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: LinearProgressIndicator(
                  value: 4 / 15,
                  backgroundColor: AppColors.primary.withValues(alpha: 0.20),
                  color: AppColors.primary,
                  minHeight: 8,
                ),
              ),
            ),
            const SizedBox(width: 12),
            const AppText(
              '4/15',
              style: TextStyle( color: AppColors.primary, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}