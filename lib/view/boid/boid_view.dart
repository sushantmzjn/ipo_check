import 'package:firebase_auth/constant/colors.dart';
import 'package:firebase_auth/constant/navigation.dart';
import 'package:firebase_auth/constant/text_styles.dart';
import 'package:firebase_auth/constant/toast_alert.dart';
import 'package:firebase_auth/provider/boid/boid_provider.dart';
import 'package:firebase_auth/view/boid/add_boid_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class BoidView extends ConsumerWidget {
  const BoidView({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final boidList = ref.watch(boidAddProvider);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(CupertinoIcons.back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          IconButton(
            icon: const Icon(CupertinoIcons.add),
            onPressed: () {
              navigatePush(context, const AddBoidView());
            },
          ),
          SizedBox(width: 10.w)
        ],
      ),
      body: ListView.builder(
          itemCount: boidList.length,
          itemBuilder: (ctx, index) {
            final boidData = boidList[index];
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
              child: Slidable(
                endActionPane: ActionPane(
                  motion: const StretchMotion(),
                  children: [
                    SlidableAction(
                      onPressed: ((context) {}),
                      icon: Icons.edit,
                      backgroundColor: primaryColor,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    SlidableAction(
                      onPressed: ((context) {
                        ref.read(boidAddProvider.notifier).delete(boidData);
                      }),
                      icon: CupertinoIcons.delete,
                      backgroundColor: Colors.red,
                      borderRadius: BorderRadius.circular(12.r),
                    )
                  ],
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(color: Colors.grey.withOpacity(0.2)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 2,
                        blurRadius: 3,
                        offset: const Offset(3, 4),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 12.w, vertical: 2.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          boidData.name,
                          style: TextStyles.cardTextStyle,
                        ),
                        Row(
                          children: [
                            Text(
                              boidData.boidNumber,
                              style: TextStyles.subtitleTextStyle,
                            ),
                            IconButton(
                              padding: EdgeInsets.zero,
                              constraints: const BoxConstraints(),
                              icon: Icon(Icons.copy, size: 18.r),
                              onPressed: () {
                                Clipboard.setData(
                                    ClipboardData(text: boidData.boidNumber));
                                Toasts.showSuccess(
                                    'BOID Number copied to clipboard');
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
