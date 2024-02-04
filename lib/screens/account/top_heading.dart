import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/common/utils/colors.dart';
import 'package:flutter_ecommerce/models/profile/profile_model.dart';

Widget topProfileHeading(BuildContext context,{required Profile profile}){
  return Stack(
    children: [
      Container(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height*0.25,
          color: Colors.transparent,
          child: Stack(
            children: [
              Container(
                width: MediaQuery.sizeOf(context).width,
                height: MediaQuery.sizeOf(context).height*0.12,
                color: COLORS.primary,
              ),
              Positioned(
                bottom:0 ,
                child: Container(
                  width: MediaQuery.sizeOf(context).width,
                  height: MediaQuery.sizeOf(context).height*0.13,
                  color: Colors.transparent,
                ),
              ),
            ],
          )
      ),
      Positioned(
        top: 50,
        left: 50,
        right: 50,
        child: CircleAvatar(
          radius: 50,
          backgroundColor: Colors.white,
          child: FadeInDown(
            child: CircleAvatar(
              radius: 42,
              backgroundColor: COLORS.primary,
              child:profile.name.isNotEmpty ? Center(child: Text("${profile.name.split(" ").first[0]}${profile.name.split(" ").last[0]}",
                style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 28
                ),
              )):Text(""),
            ),
          ),
        ),
      ),
      Positioned(
          bottom:0 ,
          left: 50,
          right: 50,
          child: FadeInUp(
            delay: const Duration(milliseconds: 100),
            child: Column(
              children: [
                Text(profile.name,
                  style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(profile.email,
                      style:const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400
                      ),
                    ),
                    const SizedBox(width: 6,),
                    const CircleAvatar(
                      radius: 10,
                      backgroundColor: Colors.green,
                      child: Icon(Icons.done,size: 12,),
                    )
                  ],
                ),
              ],
            ),
          ))
    ],
  );
}