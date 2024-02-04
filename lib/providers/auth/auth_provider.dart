import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/api/api.dart';
import 'package:flutter_ecommerce/common/widgets/navigation.dart';
import 'package:flutter_ecommerce/helpers/access_token_validator.dart';
import 'package:flutter_ecommerce/helpers/sharedpreferences_manager.dart';
import 'package:flutter_ecommerce/models/auth/login_model.dart';
import 'package:flutter_ecommerce/providers/auth/auth_repository.dart';


class AuthServices extends ChangeNotifier implements AuthRepository{
  final Dio _dio = Dio();


  @override
  Future<String?> getAccessToken(BuildContext context) async {
    final SharedPreferencesManager? manager = await SharedPreferencesManager.getInstance();
    await AccessTokenValidator.isValidToken(context).then((value)async{
      if(!value){
        // AccessTokenValidator.refreshAccessTokenAfterExpiry(context);
      }
    });
    final accessToken = manager!.getString(SharedPreferencesManager.accessToken);
    return accessToken;
  }

  @override
  Future<void> login({required BuildContext context, required String email,required String pass})async {
    try {
      Map<String, dynamic> data ={
        "email":"manish@wearetechtonic.com",
        "password":"Test@123"
      };

      var response = await _dio.post(
       Api.login() ,
        options: Options(
          headers: {
            "Content-Type": "application/json",
          },
        ),
        data: json.encode(data),
      );

      if (response.statusCode == 200) {
        final res = LoginModel.fromJson(response.data);
        AccessTokenValidator.saveUserCredentials(
          accessToken: res.data.accessToken,
          refreshToken: res.data.refreshToken,
          accessTokenDuration: res.data.accessExpiry,
          refreshTokenDuration: res.data.refreshExpiry,
          name: res.data.data.name,
          userID: res.data.data.id,
        );
        AccessTokenValidator.setUserEmailAddress(email);
        Navigation.moveToLandingScreenAndRemoveAllTheRoutes(context);
      }

    } on DioException catch (e) {
      print(e);
      print("error");

    }
  }

  @override
  Future<void> logout(BuildContext context) async {

    final manager = await SharedPreferencesManager.getInstance();
    await manager!.clearKey(
      SharedPreferencesManager.accessToken,
    );
    await manager.clearKey(
      SharedPreferencesManager.refreshToken,
    );
    await manager.clearKey(
      SharedPreferencesManager.expiryTimeAccessToken,
    );
    await manager.clearKey(
      SharedPreferencesManager.expiryTimeRefreshToken,
    );
  }
}
