import 'package:flutter/material.dart';

import '../models/challenge_models.dart';

class ChallengeRepository {
  Future<List<ChallengeModel>> fetchAutumnChallenges() async {
    // Simulating network delay
    await Future.delayed(const Duration(milliseconds: 800));

    return [
      ChallengeModel(
        id: '1',
        title: 'Autumn Explorer',
        description: 'Visit 5 new neighbourhoods',
        currentProgress: 3,
        totalGoal: 5,
        themeColor: const Color(0xFFA6FF4D),
      ),
      ChallengeModel(
        id: '2',
        title: 'Dinner Club',
        description: 'Host or join 3 group dinners',
        currentProgress: 1,
        totalGoal: 3,
        themeColor: Colors.orange,
      ),
      ChallengeModel(
        id: '3',
        title: 'Live & Loud',
        description: 'Catch 4 gigs this month',
        currentProgress: 4,
        totalGoal: 4,
        themeColor: const Color(0xFFB08C5B),
      ),
    ];
  }
}