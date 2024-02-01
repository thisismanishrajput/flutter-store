import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/common/utils/colors.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    Key? key,
    required this.title,
    required this.press,
    this.width,
    this.height,
    this.color = AppColors.primary,
    this.margin = const EdgeInsets.all(8.0), // Adjust margin as needed
  }) : super(key: key);

  final String title;
  final VoidCallback press;
  final double? width, height;
  final Color? color;
  final EdgeInsetsGeometry margin;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Container(
        width: width,
        height: height ?? 44,
        decoration: BoxDecoration(
            color:color,
            borderRadius:const BorderRadius.all(Radius.circular(5))),
        child: Center(
          child: Text(
            title
          ),
        ),
      ),
    );
  }
}

class PrimaryOutlineButton extends StatelessWidget {
  const PrimaryOutlineButton({
    Key? key,
    required this.title,
    required this.press,
    this.width,
    this.height,
    this.color = AppColors.primary,
    this.margin = const EdgeInsets.all(8.0), // Adjust margin as needed
  }) : super(key: key);

  final String title;
  final VoidCallback press;
  final double? width, height;
  final Color? color;
  final EdgeInsetsGeometry margin;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Container(
        width: width,
        height: height ?? 44,
        decoration: BoxDecoration(
          border: Border.all(
            color: color ?? AppColors.primary,
            width: 1.5
            ),
          borderRadius:const BorderRadius.all(Radius.circular(5))),
        child: Center(
          child: Text(
            title
          ),
        ),
      ),
    );
  }
}
