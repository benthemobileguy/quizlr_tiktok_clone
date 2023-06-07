part of 'for_you_cubit.dart';

@immutable
abstract class ForYouState {}

@immutable
class ClickableCardState {
  final bool isSelected;

  const ClickableCardState({required this.isSelected});
}
class ForYouCubitInitial extends ForYouState {
  final ForYou forYou;
  ForYouCubitInitial({required this.forYou}) : super();
}

class ForYouCubitLoading extends ForYouState {}

class ForYouCubitError extends ForYouState {}