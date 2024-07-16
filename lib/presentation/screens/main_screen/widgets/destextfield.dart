import 'package:flutter/material.dart';

class Descriptiontextfield extends StatelessWidget {
  const Descriptiontextfield({
    super.key,
    required this.descriptionController,
  });

  final TextEditingController descriptionController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: descriptionController,
      maxLines: null,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
      ),
    );
  }
}
