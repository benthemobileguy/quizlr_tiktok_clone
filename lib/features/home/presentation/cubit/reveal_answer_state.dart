part of 'reveal_answer_cubit.dart';

@immutable
abstract class RevealAnswerState {}

class RevealAnswerInitial extends RevealAnswerState {
  final Answer answer;
  RevealAnswerInitial({required this.answer}) : super();
}

class RevealAnswerLoading extends RevealAnswerState {}

class RevealAnswerError extends RevealAnswerState {}