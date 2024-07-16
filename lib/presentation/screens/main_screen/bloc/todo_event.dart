part of 'todo_bloc.dart';

@immutable
sealed class TodoEvent {}


class AddTodo extends TodoEvent{
  final String description;
  final DateTime? date;
  final String? time;
  final bool isDone;
  AddTodo({
    required this.description,
     this.isDone=false,
    this.date,
    this.time
  });

  
}

class UpdateCheckBox extends TodoEvent{
  final bool isDone;
  UpdateCheckBox(this.isDone);
}

class GetAllTodos extends TodoEvent{}

class DeleteTodo extends TodoEvent {
  final int index;

  DeleteTodo(this.index);
}

class EditTodo extends TodoEvent{
  final int index;
  final String description;
  final DateTime? date;
  final String? time;
  final bool? isDone;
  EditTodo({
    required this.index,
    required this.description,
    this.date,
    this.time,
    this.isDone
  });
}