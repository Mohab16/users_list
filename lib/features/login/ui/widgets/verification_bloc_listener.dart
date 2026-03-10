import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users_list/core/helpers/extensions.dart';
import 'package:users_list/core/routing/routes.dart';
import 'package:users_list/features/login/logic/cubit/verification_cubit.dart';
import 'package:users_list/features/login/logic/cubit/verification_state.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:users_list/core/theme/my_colors.dart';
import 'package:users_list/core/theme/my_styles.dart';

class VerificationBlocListener extends StatelessWidget {
  const VerificationBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<VerificationCubit, VerificationState>(
      listenWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      listener: (context, state) {
        state.whenOrNull(
          loading: () => showDialog(
            context: context,
            builder: (context) =>
                Center(child: CircularProgressIndicator(color: MyColors.white)),
          ),
          success: (data) {
            context.pop();
            context.pushNamedAndRemoveUntil(
              Routes.homeScreen,
              predicate: (route) => false,
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
                  content: Text(
                    error == "Token not found"
                        ? "Incorrect verification code"
                        : error,
                    style: MyStyles.font16RobotoBlackMedium,
                  ),
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
      child: SizedBox.shrink(),
    );
  }
}
