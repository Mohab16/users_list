import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:users_list/core/helpers/spacing.dart';
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
        elevation: 0,
        leading: const BackButton(color: Colors.white),
        centerTitle: true,
        title: Text("User Details", style: MyStyles.font40LuckiestGuyWhiteBold),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.w),
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(24.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    item.data.name ?? 'Unknown Name',
                    style: MyStyles.font24RobotoOceanBlueBold,
                  ),
                ),
                Divider(height: 30.h, color: Colors.grey.withOpacity(0.3)),

                _buildInfoRow(Icons.email_outlined, "Email", item.data.email),
                verticalSpacing(16),

                _buildInfoRow(Icons.work_outline, "Role", item.data.role),
                verticalSpacing(16),

                _buildInfoRow(
                  Icons.calendar_today_outlined,
                  "Created at",
                  _formatDate(item.createdAt),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String? value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(8.w),
          decoration: BoxDecoration(
            color: MyColors.oceanBlue.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: MyColors.oceanBlue, size: 20.sp),
        ),
        horizontalSpacing(16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: MyStyles.font16RobotoBlackSemiBold.copyWith(
                  color: Colors.grey[600],
                  fontSize: 14.sp,
                ),
              ),
              verticalSpacing(4),
              Text(
                value ?? 'N/A',
                style: MyStyles.font16RobotoBlackSemiBold.copyWith(
                  fontSize: 16.sp,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  String _formatDate(String? rawDate) {
    if (rawDate == null) return "Unknown";
    return rawDate.split('T').first;
  }
}
