import 'package:deeraj/core/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/components/WoohooLogo/woohooLogo.dart';
import '../../data/providers/challenge_provider.dart';
import '../widgets/ChallengeItemTile.dart';
import '../widgets/challenges_card_hero.dart';

class ChallengesScreen extends ConsumerWidget {
  const ChallengesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final challengesAsync = ref.watch(autumnChallengesProvider);
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFF0F110C),
      body: SafeArea(
        child: challengesAsync.when(
          loading: () => const Center(
            child: CircularProgressIndicator(color: Color(0xFFA6FF4D)),
          ),
          error: (err, stack) => Center(
            child: Text(
              'Error: $err',
              style: const TextStyle(color: Colors.white),
            ),
          ),
          data: (challenges) {
            // Calculate total seasonal progress
            final totalCompleted = challenges
                .where((c) => c.isCompleted)
                .length;

            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(child: WoohooLogo()),
                  SizedBox(height: size.height * 0.02),

                  RichText(
                    text: TextSpan(
                      style: AppTextStyle.heading,
                      children: const [
                        TextSpan(text: 'Autumn '),
                        TextSpan(
                          text: 'Challenges',
                          style: TextStyle(color: Color(0xFFA6FF4D)),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: size.height * 0.02),

                  ChallengeHeroCard(
                    current: totalCompleted,
                    total: challenges.length,
                  ),
                  const SizedBox(height: 32),

                  // Use ListView.builder or Column for mapping
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: challenges.length,
                    itemBuilder: (context, index) {
                      final challenge = challenges[index];
                      return ChallengeItemTile(
                        title: challenge.title,
                        description: challenge.description,
                        progressText:
                            '${challenge.currentProgress}/${challenge.totalGoal}',
                        iconColor: challenge.themeColor,
                        totalSegments: challenge.totalGoal,
                        completedSegments: challenge.currentProgress,
                        icon: challenge.isCompleted
                            ? const Icon(Icons.check, size: 20)
                            : Text(
                                '${challenge.currentProgress}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                      );
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class AppTextStyle {
  static const heading = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w600,
    fontFamily: AppConstants.FONT_FAMILY,
    color: Colors.white,
  );
}
