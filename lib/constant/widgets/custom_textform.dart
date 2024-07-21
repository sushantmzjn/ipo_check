import 'package:firebase_auth/constant/colors.dart';
import 'package:firebase_auth/constant/font_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextform extends StatelessWidget {
  TextEditingController? controller;
  String hintText;
  TextInputType? keyboardType;
  TextInputAction? textInputAction;
  String? Function(String?)? validator;
  CustomTextform(
      {required this.hintText,
      required this.keyboardType,
      required this.textInputAction,
      required this.controller,
      required this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controller,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      validator: validator,
      cursorRadius: Radius.circular(12.r),
      cursorOpacityAnimates: true,
      cursorColor: primaryColor,
      style: const TextStyle(
        fontFamily: FontStyles.publicSans,
      ),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 0.h, horizontal: 12.w),
        hintText: hintText,
        hintStyle:
            TextStyle(fontFamily: FontStyles.publicSans, fontSize: 12.sp),
        errorStyle:
            TextStyle(fontFamily: FontStyles.publicSans, fontSize: 12.sp),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: primaryColor),
          borderRadius: BorderRadius.circular(8.r),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: const BorderSide(color: Colors.grey),
        ),
      ),
    );
  }
}
