import 'package:flutter/material.dart';

class Rows extends StatelessWidget {
  const Rows({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Divider(
          color: Theme.of(context).dividerColor,
          thickness: 1,
        )),
        const Text(
          'Add New Task',
          style: TextStyle(fontSize: 20),
        ),
        Expanded(
            child: Divider(
          color: Theme.of(context).dividerColor,
          thickness: 1,
        )),
      ],
    );
  }
}
