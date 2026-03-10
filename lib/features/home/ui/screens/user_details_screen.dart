import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:users_list/core/theme/my_colors.dart';
import 'package:users_list/core/theme/my_styles.dart';

class UserDetailsScreen extends StatelessWidget {
  final dynamic item;
  const UserDetailsScreen({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.oceanBlue,
      appBar: AppBar(
        backgroundColor: MyColors.oceanBlue,
        leading: BackButton(color: MyColors.white),
        centerTitle: true,
        title: Text("User details", style: MyStyles.font40LuckiestGuyWhiteBold),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.w),
          child: Container(
            height: 120.h,
            width: double.infinity,
            padding: EdgeInsets.all(15.w),
            decoration: BoxDecoration(
              color: MyColors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Name:  ${item.data.name}",
                  style: MyStyles.font16RobotoBlackSemiBold,
                ),
                Text(
                  "Email:  ${item.data.email}",
                  style: MyStyles.font16RobotoBlackSemiBold,
                ),
                Text(
                  "Role:  ${item.data.role}",
                  style: MyStyles.font16RobotoBlackSemiBold,
                ),
                Text(
                  "Created at: ${item.createdAt}",
                  style: MyStyles.font16RobotoBlackSemiBold,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
