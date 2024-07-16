
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import 'package:todo/data/model/todomodel.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(TodoInitial()) {
    on<AddTodo>((event, emit) async {
      try {
        final box=await Hive.openBox<TodoModel>('todos');
        final newTodo = TodoModel(
            description: event.description,
            date: event.date,
            time: event.time,
            isDone: event.isDone);
            await box.add(newTodo);
             print('Task added successfully: ${newTodo.description}');
            emit(TodoAdded(description: event.description,date: event.date,time: event.time, isDone: event.isDone));
            final List<TodoModel> todos=box.values.toList();
    emit(GetAllTodo(todos));
      } catch (e) {
        emit(TodoError(message: e.toString()));
        print(e.toString());
      }
    });
on<GetAllTodos>((event, emit) async{
  try {
    final box=await Hive.openBox<TodoModel>('todos');
    final List<TodoModel> todos=box.values.toList();
    emit(GetAllTodo(todos));
  } catch (e) {
    emit(TodoError(message: e.toString()));
    print(e.toString());
  }
});

    // on<UpdateCheckBox>((event, emit)async{
    //   try {
        
    //   } catch (e) {
        
    //   }
    //   emit(TodoCheckBoxUpdated(event.isDone));
    // });


    on<DeleteTodo>((event, emit)async{
      final box=await Hive.openBox<TodoModel>('todos');
      await box.deleteAt(event.index);
          final List<TodoModel> todos=box.values.toList();

      emit(GetAllTodo(todos));
    });

    on<EditTodo>((event, emit)async{
try {
  final box=await Hive.openBox<TodoModel>('todos');
  final todo=box.getAt(event.index);
  if(todo!=null){
    final updatedTodo=todo.copyWith(
      description: event.description,
      date: event.date,
      time: event.time,
      isDone: event.isDone
    );
    await box.putAt(event.index, updatedTodo);
    emit(TodoAdded(description: updatedTodo.description,date: updatedTodo.date,time: updatedTodo.time, isDone: updatedTodo.isDone));
    final List<TodoModel> todos=box.values.toList();
    emit(GetAllTodo(todos));
  }
} catch (e) {
  emit(TodoError(message: e.toString()));
  print(e.toString());
}
    });
  }
}
