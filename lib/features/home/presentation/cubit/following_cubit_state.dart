part of 'following_cubit.dart';

@immutable
abstract class FollowingCubitState {}

class FollowingCubitInitial extends FollowingCubitState {
  final Following following;
  FollowingCubitInitial({required this.following}) : super();
}

class FollowingCubitLoading extends FollowingCubitState {}

class FollowingCubitError extends FollowingCubitState {}
