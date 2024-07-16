import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:todo/core/constants.dart';
import 'package:todo/data/model/todomodel.dart';
import 'package:todo/presentation/screens/main_screen/bloc/todo_bloc.dart';
import 'package:todo/presentation/screens/main_screen/widgets/dialog.dart';

class TodoListItem extends StatelessWidget {
  const TodoListItem({super.key, required this.todo, required this.index});

  final TodoModel todo;
  final int index;
  String formatDate(DateTime? dateTime) {
    return dateTime != null ? DateFormat.yMd().format(dateTime) : '';
  }

  @override
  Widget build(BuildContext context) {
    final colors = getThemeColors(context);
    return Container(
      width: 200,
      decoration: BoxDecoration(
          color: colors['containerColor'],
          borderRadius: BorderRadius.circular(30)),
      child: ListTile(
        leading: Checkbox(
          value: todo.isDone,
          onChanged: (value) {
            context.read<TodoBloc>().add(EditTodo(
                index: index, description: todo.description, isDone: value));
          },
          checkColor: white,
          activeColor: green,
        ),
        title: Text(
          todo.description,
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (todo.date != null)
                  Chip(
                    label: Text(formatDate(todo.date)),
                    backgroundColor: colors['dateChipColor'],
                  ),
                if (todo.time != null)
                  Chip(
                    label: Text(todo.time!),
                    backgroundColor: colors['timeChipColor'],
                  ),
              ],
            ),
          ],
        ),
        trailing: PopupMenuButton<String>(
          onSelected: (value) {
            if (value == 'Edit') {
              dialog(context, todo, index);
            } else if (value == 'Delete') {
              context.read<TodoBloc>().add(DeleteTodo(index));
            }
          },
          itemBuilder: (BuildContext context) {
            return {'Edit', 'Delete'}.map((String choice) {
              return PopupMenuItem<String>(
                value: choice,
                child: Text(choice),
              );
            }).toList();
          },
          icon: const Icon(Icons.more_vert),
        ),
      ),
    );
  }
}
