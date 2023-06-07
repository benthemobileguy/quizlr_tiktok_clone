import 'package:dartz/dartz.dart';
import 'package:quizlr_tiktok_clone/core/failures_successes/failures.dart';
import 'package:quizlr_tiktok_clone/features/home/domain/entities/answer.dart';
import 'package:quizlr_tiktok_clone/features/home/domain/entities/following.dart';
import 'package:quizlr_tiktok_clone/features/home/domain/entities/for_you.dart';

abstract class FetchRepo {
  Future<Either<Failure, ForYou>> fetchForYou();
  Future<Either<Failure, Following>> fetchFollowing();
  Future<Either<Failure, Answer>> revealAnswer(String id);
}