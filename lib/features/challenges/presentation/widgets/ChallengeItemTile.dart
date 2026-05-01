import 'package:deeraj/core/components/AppText/appText.dart';
import 'package:flutter/material.dart';

class ChallengeItemTile extends StatelessWidget {
  final String title;
  final String description;
  final String progressText;
  final Color iconColor;
  final Widget icon;
  final int totalSegments;
  final int completedSegments;

  const ChallengeItemTile({
    super.key,
    required this.title,
    required this.description,
    required this.progressText,
    required this.iconColor,
    required this.icon,
    this.totalSegments = 5,
    this.completedSegments = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1D1F),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: iconColor,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Center(child: icon),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(title,color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                    AppText(description, color: Colors.white54, fontSize: 12),
                  ],
                ),
              ),
              AppText(progressText, style: const TextStyle(color: Colors.white38, fontSize: 12, fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 10),
          // Segmented Progress Bar
          Row(
            children: List.generate(totalSegments, (index) {
              return Expanded(
                child: Container(
                  height: 4,
                  margin: EdgeInsets.only(right: index == totalSegments - 1 ? 0 : 8),
                  decoration: BoxDecoration(
                    color: index < completedSegments ? iconColor : Colors.white.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}