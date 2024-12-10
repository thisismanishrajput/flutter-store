import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/common/utils/colors.dart';
import 'package:flutter_ecommerce/common/utils/theme_constants.dart';
import 'package:flutter_ecommerce/providers/account/profile_repository.dart';
import 'package:flutter_ecommerce/providers/account/profile_services.dart';
import 'package:flutter_ecommerce/providers/auth/auth_provider.dart';
import 'package:flutter_ecommerce/providers/auth/auth_repository.dart';
import 'package:flutter_ecommerce/providers/products/product_services.dart';
import 'package:flutter_ecommerce/providers/products/products_repository.dart';
import 'package:flutter_ecommerce/screens/auth/landing_page.dart';
import 'package:flutter_ecommerce/screens/auth/login_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    print("qedbwqkfwef");
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthRepository>(create: (_) => AuthServices()),
        ChangeNotifierProvider<ProductRepository>(create: (_) => ProductServices()),
        ChangeNotifierProvider<ProfileRepository>(create: (_) => ProfileServices()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: lightTheme,
        home: const LandingPage(),
      ),
    );
  }
}

