import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:quizlr_tiktok_clone/core/failures_successes/failures.dart';
import 'package:quizlr_tiktok_clone/core/services/services_locator.dart';
import 'package:quizlr_tiktok_clone/features/home/domain/entities/following.dart';
import 'package:quizlr_tiktok_clone/features/home/domain/usecases/fetch_following.dart';

part 'following_cubit_state.dart';

class FollowingCubit extends Cubit<FollowingCubitState> {
  FollowingCubit() : super(FollowingCubitInitial(following: Following()));
  final FetchFollowingUseCase _fetchFollowingUseCase =
      locator<FetchFollowingUseCase>();
  void fetchFollowing() async {
    emit(FollowingCubitLoading());
    final Either<Failure, Following> fetchFollowingResult =
        await _fetchFollowingUseCase.fetchFollowing();
    fetchFollowingResult.fold(
      (failure) {
        emit(FollowingCubitError());
      },
      (following) {
        emit(FollowingCubitInitial(following: following));
      },
    );
  }
}
