part of 'landing_bloc_bloc.dart';

@immutable
sealed class LandingBlocEvent {}

class TabChange extends LandingBlocEvent {
  final int tabIndex;

  TabChange({required this.tabIndex});
}

//this is mine
class ScreenChange extends LandingBlocEvent {
  final int screenIndex;

  ScreenChange({required this.screenIndex});
}

class Increment extends LandingBlocEvent {}

class Decrement extends LandingBlocEvent {}
