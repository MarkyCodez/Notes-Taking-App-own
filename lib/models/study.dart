import 'package:hive/hive.dart';

part 'study.g.dart';

@HiveType(typeId: 2)
class Study {
  Study({
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