import 'package:deeraj/core/components/AppText/appText.dart';
import 'package:flutter/material.dart';

import '../../../core/theme/app_color.dart';

class TopPickCard extends StatelessWidget {
  final String title;
  final String location;
  final String category;

  const TopPickCard({
    super.key,
    required this.title,
    required this.location,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1D1F),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
                color: AppColors.primary,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const AppText('ORIGINAL',fontSize: 12, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 25,),
          AppText(title,color: AppColors.white, fontSize: 18, fontWeight: FontWeight.bold),
          AppText(location,color: AppColors.white.withValues(alpha: 0.5), fontSize: 12),
          AppText(category, color: AppColors.white.withValues(alpha: 0.5), fontSize: 12),
        ],
      ),
    );
  }
}