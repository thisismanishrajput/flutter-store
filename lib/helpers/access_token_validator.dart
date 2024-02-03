import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_ecommerce/helpers/sharedpreferences_manager.dart';

class AccessTokenValidator {

  static Future<bool> isValidToken(
      BuildContext context,
      ) async {
    try {
      /// Creating instance of SharedPreferenceManager
      SharedPreferencesManager? manager = await SharedPreferencesManager.getInstance();
      if (kDebugMode) {
        print("Access Token Time ${manager!.getString(SharedPreferencesManager.expiryTimeAccessToken)}");
        print("Refresh Token Time ${manager.getString(SharedPreferencesManager.expiryTimeRefreshToken)}");

      }
      ///Checking that refreshToken is present in local storage or not
      if (manager!.getString(SharedPreferencesManager.refreshToken) != null) {
        /// Now checking refreshToken is expired or not
        var isRefreshTokenValid = DateTime.tryParse(manager.getString(SharedPreferencesManager.expiryTimeRefreshToken)!)!.isAfter(DateTime.now());
        if (isRefreshTokenValid) {
          /// Checking Access Token is present or not in local storage
          if (manager.getString(SharedPreferencesManager.accessToken) != null) {
            /// Now checking accessToken is expired or not
            var isAccessTokenValid = DateTime.tryParse(
                manager.getString(SharedPreferencesManager.expiryTimeAccessToken)!)!.isAfter(DateTime.now());
            if (isAccessTokenValid) {
              return true;
            } else {
              print("Refresh Token is called -------  ");
              return true;
            }
          }
          return false;
        } else {
        }
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  static Future<void> clearStorage(SharedPreferencesManager manager) {
    // print('clearing storage...');
    return Future.wait([
      manager.clearKey(SharedPreferencesManager.accessToken),
      manager.clearKey(SharedPreferencesManager.refreshToken),
      manager.clearKey(SharedPreferencesManager.expiryTimeAccessToken),
      manager.clearKey(SharedPreferencesManager.expiryTimeRefreshToken),
      manager.clearKey(SharedPreferencesManager.name),
      manager.clearKey(SharedPreferencesManager.userID),
    ]);
  }


  static String formattedDuration({required int expiryDuration}) {
    final currentDateTime = DateTime.now();
    final expiryTime = currentDateTime.add(Duration(hours: expiryDuration)).toString();
    return expiryTime;
  }

  static Future<void> saveUserCredentials({
    required String accessToken,
    required String refreshToken,
    required int accessTokenDuration,
    required int refreshTokenDuration,
    required String userID,
    required String name,
  }) async {
    final expiryTimeAccessToken = AccessTokenValidator.formattedDuration(
      expiryDuration: accessTokenDuration,
    );
    final expiryTimeRefreshToken = AccessTokenValidator.formattedDuration(
      expiryDuration: refreshTokenDuration,
    );

    SharedPreferencesManager? _manager = await SharedPreferencesManager.getInstance();
    await Future.wait([
      _manager!.putString(
        SharedPreferencesManager.accessToken,
        accessToken,
      ),
      _manager.putString(
        SharedPreferencesManager.refreshToken,
        refreshToken,
      ),
      _manager.putString(
        SharedPreferencesManager.expiryTimeAccessToken,
        expiryTimeAccessToken,
      ),
      _manager.putString(
        SharedPreferencesManager.expiryTimeRefreshToken,
        expiryTimeRefreshToken,
      ),
      _manager.putString(
        SharedPreferencesManager.name,
        name,
      ),
      _manager.putString(
        SharedPreferencesManager.userID,
        userID,
      )
    ]);
  }

  static Future<void> setUserEmailAddress(email) async {
    final SharedPreferencesManager? _manager =
    await SharedPreferencesManager.getInstance();
    _manager!.putString('email', email);
  }

  static Future<String?> getUserEmailAddress() async {
    final SharedPreferencesManager? _manager =
    await SharedPreferencesManager.getInstance();
    return _manager!.getString('email');
  }



}
