import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/common/utils/colors.dart';
import 'package:flutter_ecommerce/common/utils/constant.dart';
import 'package:flutter_ecommerce/common/widgets/primaryButton.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 18.0, right: 18),
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
         children: [
         
          FadeInLeft(
            child: Container(
              width: MediaQuery.sizeOf(context).width,
              height: 56,
              decoration: const BoxDecoration(
                  color: Colors.white10,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: TextFormField(
                style: AppTheme.textFieldStyle(),
                controller: _emailController,
                keyboardType: TextInputType.name,
                autocorrect: false,
                onChanged: (value) {},
                decoration:   InputDecoration(
                  border: InputBorder.none,
                  contentPadding:const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 16,
                  ),
                  hintText: "Enter email address",
                   hintStyle: AppTheme.hintStyle()
                ),
                textInputAction: TextInputAction.next,
                validator: (value) {},
              ),
            ),
          ),
          AppConstant.heightSpace(),
          FadeInLeft(
            delay: const Duration(milliseconds: 900),
            child: Container(
              width: MediaQuery.sizeOf(context).width,
              height: 56,
              decoration: const BoxDecoration(
                  color: Colors.white10,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: TextFormField(
                style: AppTheme.textFieldStyle(),
                controller: _passwordController,
                keyboardType: TextInputType.name,
                autocorrect: false,
                onChanged: (value) {},
                decoration:   InputDecoration(
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 16,
                  ),
                  hintText: "Password*",
                  hintStyle: AppTheme.hintStyle()
                ),
                textInputAction: TextInputAction.next,
                validator: (value) {},
              ),
            ),
          ),
          AppConstant.heightSpace(),
          FadeInLeft(
             duration:const Duration(milliseconds: 1000),
            child: Align(
              alignment: Alignment.topRight,
              child: Text("Forgot Password?",style: GoogleFonts.roboto(color: Colors.white,))),
          ),
          AppConstant.heightSpace(),
          FadeInLeft(
            duration:const Duration(milliseconds: 1100),
            child: PrimaryButton(title: "Login", press: () {}))
        ]),
      ),
    );
  }
}
