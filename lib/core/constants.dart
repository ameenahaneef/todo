import 'package:flutter/material.dart';

const height20=SizedBox(height: 20,);
const height10=SizedBox(height: 10,);
const height40=SizedBox(height: 40,);
const height5=SizedBox(height: 5,);

Color black=Colors.black;
Color white=Colors.white;
Color pink= Colors.pink;
Color green=Colors.green;


Map<String, Color> getColors(BuildContext context) {
  Color backgroundColor = Theme.of(context).brightness == Brightness.light
      ? black
      : white;
  Color textColor = Theme.of(context).brightness == Brightness.light
      ? white
      : black;
  return {'backgroundColor': backgroundColor, 'textColor': textColor};
}

 Color getFloatColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light ? black : white;
  }


  Map<String, Color> getThemeColors(BuildContext context) {
  final ThemeData theme = Theme.of(context);
  return {
    'dateChipColor': theme.brightness == Brightness.dark ? Colors.blue.shade700 : Colors.blue.shade100,
    'timeChipColor': theme.brightness == Brightness.dark ? Colors.orange.shade700 : Colors.orange.shade100,
    'containerColor': theme.brightness == Brightness.dark ? Colors.purple.shade800.withOpacity(0.2) : Colors.purple.withOpacity(0.2),
  };
}



  