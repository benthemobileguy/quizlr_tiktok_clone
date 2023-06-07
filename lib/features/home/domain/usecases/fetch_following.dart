import 'package:dartz/dartz.dart';
import 'package:quizlr_tiktok_clone/core/failures_successes/failures.dart';
import 'package:quizlr_tiktok_clone/core/services/services_locator.dart';
import 'package:quizlr_tiktok_clone/features/home/domain/entities/following.dart';
import 'package:quizlr_tiktok_clone/features/home/domain/repositories/fetch_repo_contract.dart';

class FetchFollowingUseCase {
  final FetchRepo fetchRepo = locator<FetchRepo>();

   Future<Either<Failure, Following>> fetchFollowing() async {
    return fetchRepo.fetchFollowing();
  }
}