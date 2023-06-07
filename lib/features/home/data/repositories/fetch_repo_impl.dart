import 'package:dartz/dartz.dart';
import 'package:quizlr_tiktok_clone/core/failures_successes/exceptions.dart';
import 'package:quizlr_tiktok_clone/core/failures_successes/failures.dart';
import 'package:quizlr_tiktok_clone/core/services/services_locator.dart';
import 'package:quizlr_tiktok_clone/features/home/data/data_sources/fetch_from_remote_ds.dart';
import 'package:quizlr_tiktok_clone/features/home/domain/entities/answer.dart';
import 'package:quizlr_tiktok_clone/features/home/domain/entities/following.dart';
import 'package:quizlr_tiktok_clone/features/home/domain/entities/for_you.dart';
import 'package:quizlr_tiktok_clone/features/home/domain/repositories/fetch_repo_contract.dart';

class FetchRepoImpl implements FetchRepo {
  final FetchFromRemoteDS fetchFromRemoteDS = locator<FetchFromRemoteDS>();

  @override
  Future<Either<Failure, Following>> fetchFollowing() async {
    try {
      return Right(await fetchFromRemoteDS.fetchFollowing());
    } on FetchException catch (e) {
      return Left(FetchFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, ForYou>> fetchForYou() async {
    try {
      return Right(await fetchFromRemoteDS.fetchForYou());
    } on FetchException catch (e) {
      return Left(FetchFailure(message: e.message));
    }
  }
  
  @override
  Future<Either<Failure, Answer>> revealAnswer(String id) async {
    try {
      return Right(await fetchFromRemoteDS.revealAnswer(id));
    } on FetchException catch (e) {
      return Left(FetchFailure(message: e.message));
    }
  }
}
