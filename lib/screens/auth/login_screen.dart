import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/common/utils/colors.dart';
import 'package:flutter_ecommerce/common/utils/constant.dart';
import 'package:flutter_ecommerce/common/utils/fade_page_route.dart';
import 'package:flutter_ecommerce/common/widgets/primaryButton.dart';
import 'package:flutter_ecommerce/providers/auth/auth_repository.dart';
import 'package:provider/provider.dart';

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
        padding: const EdgeInsets.only(left: 22.0, right: 22,top: 60),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
         children: [
            const SizedBox(height: 80,),
            Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           mainAxisAlignment: MainAxisAlignment.start,
           children:  [
             FadeInLeft(
               child:const Row(
                 crossAxisAlignment: CrossAxisAlignment.end,
                 children: [
                   Text("Hi,There",style: TextStyle(
                     fontSize: 36,
                     fontWeight: FontWeight.w500
                   ),),
                   SizedBox(width: 4,),
                   Padding(
                     padding: EdgeInsets.only(bottom: 14.0),
                     child: CircleAvatar(
                       radius: 4,
                       backgroundColor: COLORS.primary,
                     ),
                   ),
                 ],
               ),
             ),
             const SizedBox(height: 4),
             FadeInLeft(
               delay:const Duration(milliseconds: 120),
               child: const Text("Welcome back, happy to see you again",style: TextStyle(
                   fontSize: 16,
               ),),
             ),
           ],
         ),
         SizedBox(height: MediaQuery.sizeOf(context).height*0.10),
         FadeInLeft(
           delay:const Duration(milliseconds: 220),
           child: Container(
             width: MediaQuery.sizeOf(context).width,
             height: 56,
             decoration: const BoxDecoration(
                 color: Colors.white10,
                 borderRadius: BorderRadius.all(Radius.circular(10))),
             child: TextFormField(
               style: AppTheme.textFieldStyle(context),
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
                   hintText: "Email*",
                   hintStyle: AppTheme.hintStyle(context)
               ),
               textInputAction: TextInputAction.next,
               validator: (value) {},
             ),
           ),
         ),
         AppConstant.heightSpace(),
         FadeInLeft(
           delay: const Duration(milliseconds: 320),
           child: Container(
             width: MediaQuery.sizeOf(context).width,
             height: 56,
             decoration: const BoxDecoration(
                 color: Colors.white10,
                 borderRadius: BorderRadius.all(Radius.circular(10))),
             child: TextFormField(
               style: AppTheme.textFieldStyle(context),
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
                   hintStyle: AppTheme.hintStyle(context)
               ),
               textInputAction: TextInputAction.next,
               validator: (value) {},
             ),
           ),
         ),
         AppConstant.heightSpace(),
         FadeInLeft(
           delay: const Duration(milliseconds: 420),
           child:const  Align(
               alignment: Alignment.topRight,
               child: Text("Forgot Password?")),
         ),
         AppConstant.heightSpace(height: 40),
         FadeInLeft(
             delay: const Duration(milliseconds: 520),
             child: PrimaryButton(title: "Login", press: () {
               Provider.of<AuthRepository>(context,listen: false).login(context: context, email: "", pass: "");
             })),
         AppConstant.heightSpace(),
         FadeInLeft(
             delay: const Duration(milliseconds: 620),
             child: PrimaryOutlineButton(title: "Register", press: () {
               Navigator.of(context).pushReplacement(FadePageRoute(builder: (context)=>LoginScreen()));
             }))
        ]),
      ),
    );
  }
}
