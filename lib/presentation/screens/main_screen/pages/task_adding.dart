import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/core/constants.dart';
import 'package:todo/core/routes.dart';
import 'package:todo/presentation/screens/main_screen/bloc/todo_bloc.dart';
import 'package:todo/presentation/screens/main_screen/widgets/button_save.dart';
import 'package:todo/presentation/screens/main_screen/widgets/date_textfield.dart';
import 'package:todo/presentation/screens/main_screen/widgets/destextfield.dart';
import 'package:todo/presentation/screens/main_screen/widgets/row.dart';
import 'package:todo/presentation/screens/main_screen/widgets/text.dart';
import 'package:todo/presentation/screens/main_screen/widgets/time_textfield.dart';

// ignore: must_be_immutable
class MyTasks extends StatelessWidget {
  MyTasks({super.key});
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController timeController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  String? pickedTime;
  DateTime? pickedDate;
  @override
  Widget build(BuildContext context) {
    final colors = getColors(context);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 60.0, left: 20, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Rows(),
              height10,
              text(
                  alignment: Alignment.centerLeft,
                  text: 'What are you planning😊'),
              height40,
              Descriptiontextfield(
                  descriptionController: descriptionController),
              height10,
              text(alignment: Alignment.topLeft, text: '📝Add Note'),
              height20,
              timetextfield(context),
              height20,
              datetextfield(context),
              height40,
              BlocConsumer<TodoBloc, TodoState>(
                listener: (context, state) {
                  if (state is TodoAdded) {
                    message(context, 'Tasks added successfully');
                    navigatePop(context);
                  } else {
                    if (state is TodoError) {
                      message(context, 'Failed to add tasks');
                    }
                  }
                },
                builder: (context, state) {
                  return button(
                      descriptionController: descriptionController,
                      pickedDate: pickedDate,
                      pickedTime: pickedTime,
                      backgroundColor: colors['backgroundColor']!,
                      textColor: colors['textColor']!);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
