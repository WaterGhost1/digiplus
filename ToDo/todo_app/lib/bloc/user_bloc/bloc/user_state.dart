part of 'user_bloc.dart';

@immutable
sealed class UserState {}

final class UserInitial extends UserState {}
class UserLoaded extends UserState{
  final List<UserModel> users;
  UserLoaded(this.users);
}

class UserValid extends UserState {}
class UserInvalid extends UserState {}