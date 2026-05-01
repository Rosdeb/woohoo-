import 'package:deeraj/core/components/AppText/appText.dart';
import 'package:deeraj/core/theme/app_color.dart';
import 'package:flutter/material.dart';

class ChallengeProgressBar extends StatelessWidget {
  const ChallengeProgressBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.black,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          const AppText(
            'Seasonal Challenges',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: LinearProgressIndicator(
                value: 4 / 15,
                backgroundColor: Color(0xFF2A2D2F),
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
    );
  }
}