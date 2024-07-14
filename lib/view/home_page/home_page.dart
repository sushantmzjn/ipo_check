import 'package:firebase_auth/constant/navigation.dart';
import 'package:firebase_auth/view/boid/boid_view.dart';
import 'package:firebase_auth/view/home_page/widgets/card_view.dart';
import 'package:firebase_auth/view/ipo/web_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Container(
        alignment: Alignment.topCenter,
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Wrap(
          spacing: 22.w,
          runAlignment: WrapAlignment.center,
          runSpacing: 12.w,
          alignment: WrapAlignment.start,
          children: [
            CardView(
              onTap: () {
                navigatePush(context, const WebViewSites());
              },
              text: 'Card 1',
              iconData: Icons.abc_sharp,
            ),
            CardView(
              onTap: () {
                navigatePush(context, const BoidView());
              },
              text: 'Card 1',
              iconData: Icons.abc_sharp,
            ),
          ],
        ),
      ),
    );
  }
}
