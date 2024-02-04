import 'package:flutter/material.dart';

abstract class AuthRepository  extends ChangeNotifier{
  Future<String?> getAccessToken(BuildContext context);

  Future<void> login(
      {required BuildContext context,
        required String email,
        required String pass});

  Future<void> logout(BuildContext context);
}