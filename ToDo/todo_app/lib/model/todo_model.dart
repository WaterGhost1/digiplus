import 'package:hive/hive.dart';

part 'todo_model.g.dart';

@HiveType(typeId: 0)
class TodoModel extends HiveObject {
    @HiveField(0)
    String description;

    @HiveField(1)
    bool isCompleted;

    TodoModel({required this.description, required this.isCompleted});
    
}
