import 'package:deeraj/core/components/AppText/appText.dart';
import 'package:deeraj/core/theme/app_color.dart';
import 'package:flutter/material.dart';

class ChallengeHeroCard extends StatelessWidget {
  final int current;
  final int total;

  const ChallengeHeroCard({super.key, required this.current, required this.total});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.primary, // Lime green
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AppText(
            'SEASONAL PROGRESS',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
              fontSize: 12,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 12),
          RichText(
            text: TextSpan(
              style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w900, fontSize: 48),
              children: [
                TextSpan(text: '$current '),
                TextSpan(
                  text: '/ $total',
                  style: const TextStyle(color: Colors.black38, fontSize: 24),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          LinearProgressIndicator(
            value: current / total,
            backgroundColor: Colors.black.withOpacity(0.1),
            color: Colors.black,
            minHeight: 8,
            borderRadius: BorderRadius.circular(10),
          ),
        ],
      ),
    );
  }
}