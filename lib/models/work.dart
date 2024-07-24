import 'package:hive/hive.dart';

part 'work.g.dart';

@HiveType(typeId: 4)
class Work {
  Work({
    required this.taskTitle,
    required this.taskDescription,
    required this.dateTime,
    required this.isCompleted,
  });
  @HiveField(0)
  String taskTitle;

  @HiveField(1)
  String taskDescription;

  @HiveField(2)
  DateTime dateTime;

  @HiveField(3)
  bool isCompleted;
}