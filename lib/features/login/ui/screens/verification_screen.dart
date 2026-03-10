import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:users_list/core/helpers/spacing.dart';
import 'package:users_list/core/theme/my_colors.dart';
import 'package:users_list/core/theme/my_styles.dart';
import 'package:users_list/features/login/data/models/login_request_body_model.dart';
import 'package:users_list/features/login/logic/cubit/login_cubit.dart';
import 'package:users_list/features/login/ui/widgets/custom_pin_put.dart';
import 'package:users_list/features/login/ui/widgets/verification_bloc_listener.dart';

class VerificationScreen extends StatefulWidget {
  final String email;
  const VerificationScreen({super.key, required this.email});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  int _timerSeconds = 30;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timerSeconds = 60;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_timerSeconds == 0) {
        setState(() {
          timer.cancel();
        });
      } else {
        setState(() {
          _timerSeconds--;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

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
              child: Text(
                "Verification",
                style: MyStyles.font40LuckiestGuyWhiteBold,
              ),
            ),
            verticalSpacing(20),
            CustomPinPut(),
            verticalSpacing(20),
            Center(
              child: _timerSeconds > 0
                  ? Text(
                      "Please wait $_timerSeconds sec before resend",
                      style: MyStyles.font16RobotoMediumGreyMedium.copyWith(
                        color: MyColors.white,
                      ),
                    )
                  : ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: MyColors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                        fixedSize: Size(250.w, 30.h),
                      ),
                      onPressed: () {
                        setState(() {
                          _startTimer();
                          context.read<LoginCubit>().emitLoginStates(
                            LoginRequestBodyModel(email: widget.email),
                          );
                        });
                      },
                      child: Text(
                        "Resend verification code",
                        style: MyStyles.font16RobotoOceanBlueSemiBold,
                      ),
                    ),
            ),
            verticalSpacing(70),
            VerificationBlocListener(),
          ],
        ),
      ),
    );
  }
}
