import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:todo/core/routes.dart';
import 'package:todo/data/model/todomodel.dart';
import 'package:todo/presentation/screens/main_screen/bloc/todo_bloc.dart';

Future<dynamic> dialog(BuildContext context, TodoModel todo, int index) {
  return showDialog(
    context: context,
    builder: (context) {
      final descriptionController =
          TextEditingController(text: todo.description);
      final timeController = TextEditingController(
          text: todo.time != null ? todo.time : 'Pick Time');
      final dateController = TextEditingController(
          text: todo.date != null
              ? DateFormat('dd/MM/yyyy').format(todo.date!)
              : 'Pick Date');
      String? pickedTime;
      DateTime? pickedDate;
      return AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Make edits here'),
            TextField(
              controller: descriptionController,
              maxLines: null,
            ),
            TextField(
              onTap: () async {
                TimeOfDay? pickedTimeOfDay = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );
                if (pickedTimeOfDay != null) {
                  pickedTime = pickedTimeOfDay.format(context);
                  timeController.text = pickedTime!;
                }
              },
              controller: timeController,
              maxLines: null,
            ),
            TextField(
              onTap: () async {
                pickedDate = await showDatePicker(
                    context: context,
                    initialDate: todo.date ?? DateTime.now(),
                    firstDate: DateTime(2024),
                    lastDate: DateTime(2030));
                if (pickedDate != null) {
                  dateController.text =
                      DateFormat('dd/MM/yyyy').format(pickedDate!);
                }
              },
              controller: dateController,
              maxLines: null,
            ),
            TextButton(
                onPressed: () {
                  DateTime? parsedData;
                  if (dateController.text.isNotEmpty) {
                    parsedData =
                        DateFormat('dd/MM/yyyy').parse(dateController.text);
                  }
                  context.read<TodoBloc>().add(EditTodo(
                      index: index,
                      description: descriptionController.text,
                      time: timeController.text,
                      date: parsedData));
                  Navigator.of(context).pop();
                  message(context, 'Edited Successfully');
                },
                child: const Text('Save'))
          ],
        ),
      );
    },
  );
}
