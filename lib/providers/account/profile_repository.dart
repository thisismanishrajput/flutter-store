import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/models/profile/profile_model.dart';

abstract class ProfileRepository extends ChangeNotifier {
  bool get isProfileLoading;
  Profile get userProfile;
  Future<void> profile(BuildContext context);
}