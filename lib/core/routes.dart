import 'package:flutter/material.dart';

void message(BuildContext context,String text){
 ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
}
void navigatePop(BuildContext context){
  Navigator.of(context).pop();
}