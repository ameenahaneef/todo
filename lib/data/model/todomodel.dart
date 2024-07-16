import 'package:hive/hive.dart';

part 'todomodel.g.dart';
@HiveType(typeId: 0)
class TodoModel{
  @HiveField(0)
  String description;

  @HiveField(1)
  DateTime? date;

  @HiveField(2)
  String? time;

  @HiveField(3)
  bool isDone;

  TodoModel({required this.description,required this.isDone, this.date,this.time});

  TodoModel copyWith({
    String? description,
    DateTime? date,
    String? time,
    bool? isDone
  }){
    return TodoModel(description: description??this.description,date: date??this.date,time: time??this.time, isDone: isDone??this.isDone);
  }
}