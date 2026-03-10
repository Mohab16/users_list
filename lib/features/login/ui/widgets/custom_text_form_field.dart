import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:users_list/core/helpers/app_regex.dart';
import 'package:users_list/core/theme/my_colors.dart';
import 'package:users_list/core/theme/my_styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({super.key, required this.emailController});

  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty || !AppRegex.isEmailValid(value)) {
          return "Please enter a valid email";
        }
        return null;
      },
      controller: emailController,
      style: MyStyles.font16RobotoBlackMedium,
      decoration: InputDecoration(
        filled: true,
        fillColor: MyColors.white,
        hint: Text(
          "Enter your email",
          style: MyStyles.font14RobotoMediumGreyMedium,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: MyColors.oceanBlue, width: 1.w),
          borderRadius: BorderRadius.circular(16.r),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: MyColors.white, width: 1.w),
          borderRadius: BorderRadius.circular(16.r),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: MyColors.oceanBlue, width: 1.w),
          borderRadius: BorderRadius.circular(16.r),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: MyColors.oceanBlue, width: 1.w),
          borderRadius: BorderRadius.circular(16.r),
        ),
      ),
    );
  }
}
