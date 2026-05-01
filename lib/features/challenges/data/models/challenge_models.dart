import 'package:flutter/material.dart';

class ChallengeModel {
  final String id;
  final String title;
  final String description;
  final int currentProgress;
  final int totalGoal;
  final Color themeColor;
  final bool isCompleted;

  ChallengeModel({
    required this.id,
    required this.title,
    required this.description,
    required this.currentProgress,
    required this.totalGoal,
    required this.themeColor,
  }) : isCompleted = currentProgress >= totalGoal;

  // Helper to calculate progress percentage for the Hero card
  double get progressPercentage => currentProgress / totalGoal;
}