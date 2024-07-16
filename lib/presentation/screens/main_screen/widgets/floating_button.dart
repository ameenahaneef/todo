import 'package:flutter/material.dart';
import 'package:todo/core/constants.dart';
import 'package:todo/presentation/screens/main_screen/pages/task_adding.dart';

class Floatingbutton extends StatelessWidget {
  const Floatingbutton({
    super.key,
    required this.floatColor,
  });

  final Color floatColor;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: floatColor,
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return MyTasks();
        }));
      },
      child:  Icon(
        Icons.add,
        color: pink,
      ),
    );
  }
}
