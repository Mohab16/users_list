import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:users_list/core/helpers/spacing.dart';
import 'package:users_list/core/theme/my_colors.dart';
import 'package:users_list/core/theme/my_styles.dart';
import 'package:users_list/features/login/data/models/login_request_body_model.dart';
import 'package:users_list/features/login/logic/cubit/login_cubit.dart';
import 'package:users_list/features/login/ui/widgets/custom_text_form_field.dart';
import 'package:users_list/features/login/ui/widgets/login_bloc_listener.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.oceanBlue,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Text("Login", style: MyStyles.font55LuckiestGuyWhiteBold),
            ),
            verticalSpacing(20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Form(
                key: formKey,
                child: CustomTextFormField(emailController: emailController),
              ),
            ),
            verticalSpacing(20),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: MyColors.white,
                  fixedSize: Size(140.w, 30.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                ),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    Text(
                      "Continue",
                      style: MyStyles.font16RobotoOceanBlueSemiBold,
                    ),
                    horizontalSpacing(5),
                    Icon(
                      Icons.arrow_forward,
                      color: MyColors.oceanBlue,
                      size: 20.sp,
                    ),
                  ],
                ),
                onPressed: () {
                  validateThenDoLogin();
                },
              ),
            ),
            verticalSpacing(70),
            LoginBlocListener(emailController: emailController),
          ],
        ),
      ),
    );
  }

  validateThenDoLogin() {
    if (formKey.currentState!.validate()) {
      context.read<LoginCubit>().emitLoginStates(
        LoginRequestBodyModel(email: emailController.text.toLowerCase()),
      );
    }
  }
}
