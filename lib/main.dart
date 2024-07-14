import 'package:firebase_auth/constant/colors.dart';
import 'package:firebase_auth/constant/text_styles.dart';
import 'package:firebase_auth/models/boid/boid.dart';
import 'package:firebase_auth/view/home_page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';

//locally saved boid data
final box = Provider<List<Boid>>((ref) => []);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(BoidAdapter());
  final boidData = await Hive.openBox<Boid>('boidBox');

  runApp(ProviderScope(
    overrides: [
      box.overrideWithValue(boidData.values.toList()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(MediaQuery.of(context).size.width,
          MediaQuery.of(context).size.height),
      builder: (context, child) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              scaffoldBackgroundColor: Colors.white,
              // colorScheme: const ColorScheme.light(
              //   primary: primaryColor,
              // ),
              appBarTheme: AppBarTheme(
                  // systemOverlayStyle: const SystemUiOverlayStyle(
                  //   statusBarColor: primaryColor,
                  // ),
                  centerTitle: true,
                  backgroundColor: primaryColor,
                  titleTextStyle: TextStyles.appBarStyle,
                  elevation: 0,
                  iconTheme: const IconThemeData(color: Colors.white)),
                  
            ),
            home: HomePage());
      },
    );
  }
}
