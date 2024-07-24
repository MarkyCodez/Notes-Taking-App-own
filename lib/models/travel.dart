import 'package:hive/hive.dart';

part 'travel.g.dart';

@HiveType(typeId: 3)
class Travel {
  Travel({
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