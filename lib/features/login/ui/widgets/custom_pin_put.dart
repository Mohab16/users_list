import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import 'package:users_list/features/login/data/models/verification_request_body_model.dart';
import 'package:users_list/features/login/logic/cubit/verification_cubit.dart';

class CustomPinPut extends StatefulWidget {
  const CustomPinPut({super.key});

  @override
  State<CustomPinPut> createState() => _CustomPinPutState();
}

class _CustomPinPutState extends State<CustomPinPut> {
  final TextEditingController verificationCodeController =
      TextEditingController();
  @override
  void dispose() {
    super.dispose();
    verificationCodeController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Align(
        alignment: Alignment.topCenter,
        child: Pinput(
          defaultPinTheme: PinTheme(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          onCompleted: (value) {
            context.read<VerificationCubit>().emitVerifyStates(
              VerificationRequestBodyModel(token: value),
            );
          },
          length: 6,
          controller: verificationCodeController,
        ),
      ),
    );
  }
}
