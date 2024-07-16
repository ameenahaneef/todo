import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/application/bloc/theme_bloc.dart';
import 'package:todo/core/routes.dart';
import 'package:todo/presentation/screens/main_screen/bloc/todo_bloc.dart';

class button extends StatelessWidget {
  const button({
    super.key,
    required this.descriptionController,
    required this.pickedDate,
    required this.pickedTime,
    required this.backgroundColor,
    required this.textColor,
  });

  final TextEditingController descriptionController;
  final DateTime? pickedDate;
  final String? pickedTime;
  final Color backgroundColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        final description = descriptionController.text;
        if (description.isEmpty) {
          message(context, 'Description is needed');
          return;
        }
        context.read<TodoBloc>().add(AddTodo(
            description: description,
            date: pickedDate,
            time: pickedTime,
            isDone: false));
      },
      style: ElevatedButton.styleFrom(
        shape: BeveledRectangleBorder(
            borderRadius: BorderRadius.circular(10)),
        backgroundColor: backgroundColor,
      ),
      child: Text(
        'Add Task',
        style: TextStyle(color: textColor),
      ),
    );
  }
}
IconButton themebutton(BuildContext context) {
    return IconButton(
            onPressed: () {
              context.read<ThemeBloc>().add(ToggleTheme());
            },
            icon: const Icon(Icons.brightness_6));
  }
