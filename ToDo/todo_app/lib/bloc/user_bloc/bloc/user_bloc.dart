import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:todo_app/model/user_model.dart';
import 'package:todo_app/repository/user_repo.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepo userRepo;
  
  UserBloc(this.userRepo) : super(UserInitial()) {
    on<GetUsers>((event, emit) {
      final users = userRepo.getUsers();
      emit(UserLoaded(users));

    });

    on<AddUser>((event, emit) async{
      await userRepo.addUser(event.user);
      add(GetUsers());

    });
    on<IsValid>((event, emit) async{
      final isValid = userRepo.isValid(event.username, event.password);
      if (isValid){
        emit(UserValid());
      } else{ emit(UserInvalid());}
      
    },);
  }
}
