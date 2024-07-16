import 'package:flutter/material.dart';

TextField timetextfield(BuildContext context) {
  final TextEditingController timeController = TextEditingController();
  String? pickedTime;
  return TextField(
    controller: timeController,
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
    readOnly: true,
    decoration: InputDecoration(
      prefixIcon: const Icon(Icons.alarm),
      hintText: 'Pick Time',
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
    ),
  );
}
