import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/challenge_models.dart';
import '../repository/ChallengeRepository.dart';

final challengeRepositoryProvider = Provider((ref) => ChallengeRepository());

final autumnChallengesProvider = FutureProvider<List<ChallengeModel>>((ref) async {
  final repository = ref.watch(challengeRepositoryProvider);
  return repository.fetchAutumnChallenges();
});