import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'font_styles.dart';

class FontSizes {
  static final s10 = 10.sp;
  static final s12 = 12.7.sp;
  static final s13 = 13.sp;
  static final s14 = 14.sp;
  static final s15 = 15.sp;
  static final s16 = 16.sp;
  static final s17 = 17.sp;
  static final s18 = 18.sp;
  static final s19 = 19.sp;
  static final s20 = 20.sp;
}

class TextStyles {
  static TextStyle appBarStyle = TextStyle(
    fontFamily: FontStyles.publicSans_semiBold,
    fontSize: 20.sp,
  );
  static TextStyle formTxtStyle = TextStyle(
    fontFamily: FontStyles.caveat,
    fontSize: 14.sp,
  );
  static TextStyle headingStyle = TextStyle(
    color: Colors.white,
    fontFamily: FontStyles.caveat,
    fontSize: 20.sp,
    fontWeight: FontWeight.bold,
  );
  static TextStyle titleStyle = TextStyle(
    fontFamily: FontStyles.caveat,
    fontSize: 42.sp,
    fontWeight: FontWeight.bold,
  );
  static TextStyle welcomeStyle = TextStyle(
    color: Colors.white,
    fontFamily: FontStyles.caveat,
    fontSize: 12.sp,
    fontWeight: FontWeight.bold,
  );
  static TextStyle cardTextStyle = TextStyle(
    fontSize: 18.sp,
    fontFamily: FontStyles.publicSans_Medium,
  );

  static TextStyle subtitleTextStyle = const TextStyle(
    fontFamily: FontStyles.publicSans,
  );
}
