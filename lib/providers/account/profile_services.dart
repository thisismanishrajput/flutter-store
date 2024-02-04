import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/api/api.dart';
import 'package:flutter_ecommerce/models/profile/profile_model.dart';
import 'package:flutter_ecommerce/providers/account/profile_repository.dart';
import 'package:flutter_ecommerce/providers/auth/auth_repository.dart';
import 'package:provider/provider.dart';

class ProfileServices extends ProfileRepository {
  final Dio _dio = Dio();

  Profile _profile = Profile(name: "", email: "", phone: 0, isEmailVerified: false);
  bool _isProfileLoading = false;

  @override
  Profile get userProfile => _profile;

  @override
  bool get isProfileLoading => _isProfileLoading;


  @override
  Future<void> profile(BuildContext context)async {
    try {
      _isProfileLoading = true;
      final accessToken = Provider.of<AuthRepository>(context,listen: false).getAccessToken(context);

      var response = await _dio.get(
        Api.userProfile(),
        options: Options(
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $accessToken"
          }
        )
      );

      if(response.statusCode == 200){
        _profile = ProfileModel.fromJson(response.data).profile;
        _isProfileLoading = false;
        notifyListeners();
      }
    }on DioException {

    }finally {
      _isProfileLoading = false;
    }
  }

}