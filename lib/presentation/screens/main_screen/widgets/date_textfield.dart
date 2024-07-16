import 'package:flutter/material.dart';

TextField datetextfield(BuildContext context) {
  final TextEditingController dateController = TextEditingController();
  DateTime? pickedDate;
  return TextField(
    controller: dateController,
    onTap: () async {
      pickedDate = await showDatePicker(
          context: context,
          firstDate: DateTime.now(),
          lastDate: DateTime(2030));
      if (pickedDate != null) {
        dateController.text =
            "${pickedDate!.day}/${pickedDate!.month}/${pickedDate!.year}";
      }
    },
    readOnly: true,
    decoration: InputDecoration(
        hintText: 'Pick Date',
        prefixIcon: const Icon(Icons.calendar_month),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
  );
}
