import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/screens/auth/login_screen.dart';

class Navigation {

  static moveToLandingScreenAndRemoveAllTheRoutes(BuildContext context){
    return Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context)=>const LoginScreen()),
          (route) => false,
    );
  }

  static home(BuildContext context){
    return Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context)=>const LoginScreen()),
          (route) => false,
    );
  }

  static signinscreen(BuildContext context){
    return Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context)=>const LoginScreen()),
          (route) => false,
    );
  }


}