import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:quizlr_tiktok_clone/core/failures_successes/failures.dart';
import 'package:quizlr_tiktok_clone/core/services/services_locator.dart';
import 'package:quizlr_tiktok_clone/features/home/domain/entities/for_you.dart';
import 'package:quizlr_tiktok_clone/features/home/domain/usecases/fetch_for_you.dart';

part 'for_you_state.dart';


class ForYouCubit extends Cubit<ForYouState> {
  ForYouCubit() : super(ForYouCubitInitial(forYou: ForYou()));
  final FetchForYouUseCase _fetchForYouUseCase =
      locator<FetchForYouUseCase>();
  void fetchForYou() async {
    emit(ForYouCubitLoading());
    final Either<Failure, ForYou> fetchForYouResult =
        await _fetchForYouUseCase.fetchForYou();
    fetchForYouResult.fold(
      (failure) {
        emit(ForYouCubitError());
      },
      (forYou) {
        emit(ForYouCubitInitial(forYou: forYou));
      },
    );
  }
}
