
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';


String formatDateTime(DateTime dateTime) {
  // Format the date
  String formattedDate = DateFormat.d().add_MMM().add_y().format(dateTime);

  // Format the time
  String formattedTime = DateFormat.jm().format(dateTime);

  // Combine date and time
  String formattedDateTime = '$formattedDate $formattedTime';

  return formattedDateTime;
}



class AppConstant{
  static SizedBox heightSpace({double? height }) =>  SizedBox(height:height ?? 15,);
}



class AppTheme {


  static TextStyle textFieldStyle(BuildContext context) => TextStyle(
        fontSize: 16,
        color:  Theme.of(context).brightness == Brightness.dark ? Colors.white:Colors.black,
        fontWeight: FontWeight.w500,
      );

  static TextStyle hintStyle(BuildContext context) => TextStyle(
        fontSize: 16,
        color:  Theme.of(context).brightness == Brightness.dark ? Colors.white:Colors.black,
        fontWeight: FontWeight.w500,
      );
}
