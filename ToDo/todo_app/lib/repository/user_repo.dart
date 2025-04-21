import 'package:hive/hive.dart';
import 'package:todo_app/model/user_model.dart';

class UserRepo {
  final Box<UserModel> userBox = Hive.box<UserModel>('userBox');

  List<UserModel> getUsers(){
    return userBox.values.toList();
  }

  Future<void> addUser(UserModel user) async{
    await userBox.add(user);
  }

  bool isValid (String username, String password){
    return userBox.values.any((user) => 
    user.username == username && user.password == password); 
  }

}