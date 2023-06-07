import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:quizlr_tiktok_clone/core/failures_successes/failures.dart';
import 'package:quizlr_tiktok_clone/core/services/services_locator.dart';
import 'package:quizlr_tiktok_clone/features/home/domain/entities/answer.dart';
import 'package:quizlr_tiktok_clone/features/home/domain/usecases/reveal_answer.dart';

part 'reveal_answer_state.dart';

class RevealAnswerCubit extends Cubit<RevealAnswerState> {
  RevealAnswerCubit() : super(RevealAnswerInitial(answer: Answer()));
  final FetchRevealAnswerUseCase _fetchRevealAnswerUseCase =
      locator<FetchRevealAnswerUseCase>();
  void fetchAnswer(String? id) async {
    emit(RevealAnswerLoading());
    final Either<Failure, Answer> fetchRevealAnswerResult =
        await _fetchRevealAnswerUseCase.fetchRevealAnswer(id!);
    fetchRevealAnswerResult.fold(
      (failure) {
        emit(RevealAnswerError());
      },
      (answer) {
        emit(RevealAnswerInitial(answer: answer));
      },
    );
  }
}
