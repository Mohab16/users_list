import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users_list/core/helpers/extensions.dart';
import 'package:users_list/core/routing/routes.dart';
import 'package:users_list/features/login/logic/cubit/login_cubit.dart';
import 'package:users_list/features/login/logic/cubit/login_state.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:users_list/core/theme/my_colors.dart';
import 'package:users_list/core/theme/my_styles.dart';

class LoginBlocListener extends StatelessWidget {
  final TextEditingController emailController;
  const LoginBlocListener({super.key, required this.emailController});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            showDialog(
              context: context,
              builder: (context) =>
                  Center(child: CircularProgressIndicator.adaptive()),
            );
          },
          success: (loginResponse) {
            context.pop();
            context.pushNamed(
              Routes.verificationScreen,
              arguments: emailController.text,
            );
          },
          error: (error) {
            context.pop();
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  backgroundColor: MyColors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  title: Text(
                    "Error",
                    style: MyStyles.font16RobotoOceanBlueSemiBold.copyWith(
                      fontSize: 20.sp,
                    ),
                  ),
                  content: Text(error, style: MyStyles.font16RobotoBlackMedium),
                  actions: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: MyColors.oceanBlue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                      ),
                      onPressed: () {
                        context.pop();
                      },
                      child: Text(
                        "OK",
                        style: MyStyles.font16RobotoOceanBlueSemiBold.copyWith(
                          color: MyColors.white,
                        ),
                      ),
                    ),
                  ],
                );
              },
            );
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
