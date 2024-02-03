import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/common/utils/colors.dart';
import 'package:flutter_ecommerce/helpers/access_token_validator.dart';
import 'package:flutter_ecommerce/home.dart';
import 'package:flutter_ecommerce/screens/auth/login_screen.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: AccessTokenValidator.isValidToken(context),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator(color: COLORS.primary,);
        } else if (snapshot.hasError) {
          return const Scaffold(
            body: Center(
              child:   CircularProgressIndicator(color: COLORS.primary,),
            ),
          );
        } else {
          if (snapshot.hasData) {
            if (snapshot.data == true) {
              return const Home();
            } else {
              return const LoginScreen();
            }
          } else {
            return const Scaffold(
              body: Center(
                child:   CircularProgressIndicator(color: COLORS.primary,),
              ),
            );
          }
        }
      },
    );
  }
}
