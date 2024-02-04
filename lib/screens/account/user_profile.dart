import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/common/utils/colors.dart';
import 'package:flutter_ecommerce/common/widgets/navigation.dart';
import 'package:flutter_ecommerce/common/widgets/primaryButton.dart';
import 'package:flutter_ecommerce/models/profile/profile_model.dart';
import 'package:flutter_ecommerce/providers/account/profile_repository.dart';
import 'package:flutter_ecommerce/providers/auth/auth_repository.dart';
import 'package:flutter_ecommerce/screens/account/top_heading.dart';
import 'package:provider/provider.dart';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ProfileRepository>(context,listen: false).profile(context);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Consumer<ProfileRepository>(
        builder: (context, provider, child) {
          if(provider.isProfileLoading){
            return const Center(child: CircularProgressIndicator(color: COLORS.accent,),);
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              topProfileHeading(context, profile: provider.userProfile),
            SizedBox(height: 35,),
            Padding(
              padding: const EdgeInsets.only(left: 18.0,right: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FadeInUp(
                      delay:const Duration(milliseconds: 200),
                      child:const Text("Contact Info",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20),)),
                  SizedBox(height: 10,),
                  FadeInUp(
                    delay: const Duration(milliseconds: 300),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width,
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            infoWidget(title: "Name",value: provider.userProfile.name),
                            infoWidget(title: "Email",value: provider.userProfile.email),
                            infoWidget(title: "Phone",value: provider.userProfile.phone.toString()),
                          ],
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 18,),
                  FadeInUp(
                      delay:const Duration(milliseconds: 400),
                      child:const Text("Address",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20),)),
                  SizedBox(height: 10,),
                  FadeInUp(
                    delay: const Duration(milliseconds: 500),
                    child: Container(
                      height: 100,
                      width: MediaQuery.sizeOf(context).width,
                      decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.sizeOf(context).height*0.16,),
                  Center(child: PrimaryButton(title: 'Logout', press: (){
                    Provider.of<AuthRepository>(context,listen: false).logout(context).then((value) =>Navigation.moveToLandingScreenAndRemoveAllTheRoutes(context));
                  },width: 100,))
                ],
              ),
            )
            ],
          );
        },
      ),
    );
  }
  Widget infoWidget({required String title,required String value}){
    return  Row(
      children: [
        Text(title,style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500
        )),
        SizedBox(width: 10,),
        Text(value,style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400
        )),
      ],
    );
  }
}
