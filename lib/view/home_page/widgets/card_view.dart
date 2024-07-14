import 'package:firebase_auth/constant/colors.dart';
import 'package:firebase_auth/constant/font_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardView extends StatelessWidget {
  String text;
  IconData? iconData;
  void Function()? onTap;
  CardView(
      {super.key,
      required this.text,
      required this.iconData,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Colors.grey.withOpacity(0.2)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 4,
            offset: const Offset(3, 4),
          ),
        ],
      ),
      child: InkWell(
        onTap: onTap,
        splashColor: primaryColor.withOpacity(0.3),
        // highlightColor: primaryColor.withOpacity(0.3),
        borderRadius: BorderRadius.circular(12.r),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 24.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                iconData,
                size: 45.r,
              ),
              SizedBox(height: 10.h),
              Text(text,
                  style: TextStyle(
                      fontSize: 20.sp,
                      fontFamily: FontStyles.caveat,
                      fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    );
  }
}
