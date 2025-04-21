part of 'user_bloc.dart';

@immutable
sealed class UserEvent {}

class GetUsers extends UserEvent{}

class AddUser extends UserEvent{
  final UserModel user;
  AddUser(this.user);
}

class IsValid extends UserEvent{
  final String username;
  final String password;
  IsValid(this.username, this.password);
}