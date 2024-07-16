import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/core/constants.dart';
import 'package:todo/presentation/screens/main_screen/bloc/todo_bloc.dart';
import 'package:todo/presentation/screens/main_screen/widgets/button_save.dart';
import 'package:todo/presentation/screens/main_screen/widgets/floating_button.dart';
import 'package:todo/presentation/screens/main_screen/widgets/to_do_listitem.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    context.read<TodoBloc>().add(GetAllTodos());
    Color floatColor=getFloatColor(context);
    return Scaffold(
      appBar: AppBar(
        title:const Text('To-Do'),
        actions: [
          themebutton(context)
        ],
      ),
      body: Column(
        children: [
          BlocBuilder<TodoBloc, TodoState>(
            builder: (context, state) {
              if (state is GetAllTodo) {
                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 8.0, bottom: 8, left: 15, right: 15),
                    child: ListView.separated(
                        itemBuilder: (context, index) {
                          final todo = state.tasks[index];
                          return TodoListItem(todo: todo,index: index,);
                        },
                        separatorBuilder: (context, index) {
                          return height5;
                        },
                        itemCount: state.tasks.length),
                  ),
                );
              }
              return const SizedBox();
            },
          )
        ],
      ),
      floatingActionButton: Floatingbutton(floatColor: floatColor),
    );
  } 
}

