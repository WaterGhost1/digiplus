part of 'landing_bloc_bloc.dart';

@immutable
sealed class LandingBlocState {
  final int tabIndex;
  final int count;

  const LandingBlocState({required this.tabIndex, required this.count});
}

final class LandingBlocInitial extends LandingBlocState {
  const LandingBlocInitial({required super.tabIndex, required super.count});
}

final class CounterState extends LandingBlocState {
  const CounterState({required super.count, required super.tabIndex});
}
