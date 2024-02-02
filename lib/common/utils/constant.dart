
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppConstant{
  static SizedBox heightSpace() =>const SizedBox(height: 15,);
}



class AppTheme {


  static TextStyle textFieldStyle(BuildContext context) => GoogleFonts.roboto(
        fontSize: 16,
        color:  Theme.of(context).brightness == Brightness.dark ? Colors.white:Colors.black,
        fontWeight: FontWeight.w500,
      );

  static TextStyle hintStyle(BuildContext context) => GoogleFonts.roboto(
        fontSize: 16,
        color:  Theme.of(context).brightness == Brightness.dark ? Colors.white:Colors.black,
        fontWeight: FontWeight.w500,
      );
}
