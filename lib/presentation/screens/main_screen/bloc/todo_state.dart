part of 'todo_bloc.dart';

@immutable
sealed class TodoState {}

final class TodoInitial extends TodoState {}


final class TodoAdded extends TodoState{
  final String description;
  final DateTime? date;
  final String? time;
  final bool isDone;
  TodoAdded({required this.description,required this.isDone, this.date,this.time});
}

final class TodoError extends TodoState{
  final String message;
  TodoError({required this.message});
}

class TodoCheckBoxUpdated extends TodoState{
  final bool isDone;
  TodoCheckBoxUpdated(this.isDone);
}

class GetAllTodo extends TodoState{
  final List<TodoModel> tasks;
  GetAllTodo(this.tasks);
}