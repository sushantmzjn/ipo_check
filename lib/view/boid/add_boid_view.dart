import 'package:firebase_auth/constant/colors.dart';
import 'package:firebase_auth/constant/font_styles.dart';
import 'package:firebase_auth/constant/toast_alert.dart';
import 'package:firebase_auth/constant/widgets/custom_textform.dart';
import 'package:firebase_auth/models/boid/boid.dart';
import 'package:firebase_auth/provider/boid/boid_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_validation/form_validation.dart';

class AddBoidView extends ConsumerStatefulWidget {
  const AddBoidView({super.key});

  @override
  ConsumerState<AddBoidView> createState() => _AddBoidViewState();
}

class _AddBoidViewState extends ConsumerState<AddBoidView> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController boidNumberController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final addBoid = ref.watch(boidAddProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Boid'),
        leading: IconButton(
          icon: const Icon(CupertinoIcons.back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
          child: Column(
            children: [
              CustomTextform(
                  controller: nameController,
                  hintText: 'Name',
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  validator: (val) {
                    final validator = Validator(validators: [
                      const RequiredValidator(),
                    ]);
                    return validator.validate(
                      label: 'This field',
                      value: val,
                    );
                  }),
              SizedBox(height: 16.h),
              CustomTextform(
                  controller: boidNumberController,
                  hintText: 'Boid Number',
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.done,
                  validator: (val) {
                    final validator = Validator(validators: [
                      const RequiredValidator(),
                      const MinLengthValidator(length: 16),
                      const MaxLengthValidator(length: 16)
                    ]);
                    return validator.validate(
                      label: 'This field',
                      value: val,
                    );
                  }),
              SizedBox(height: 35.h),
              InkWell(
                onTap: () {
                  _formKey.currentState!.save();
                  FocusScope.of(context).unfocus();
                  if (_formKey.currentState!.validate()) {
                    final res = ref.read(boidAddProvider.notifier).add(Boid(
                        name: nameController.text.trim(),
                        boidNumber: boidNumberController.text.trim()));

                    if (res == 'added') {
                      Navigator.of(context).pop();
                      Toasts.showSuccess('Save Successfull');
                    } else {
                      Toasts.showSuccess('Save Failed');
                    }
                  }
                },
                child: Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  height: 45.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: primaryColor,
                  ),
                  child: Text(
                    'Submit',
                    style: TextStyle(
                        fontSize: 24.sp,
                        color: whiteColor,
                        fontFamily: FontStyles.caveatSemibold),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
