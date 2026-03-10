import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:users_list/core/helpers/extensions.dart';
import 'package:users_list/core/helpers/spacing.dart';
import 'package:users_list/core/routing/routes.dart';
import 'package:users_list/core/theme/my_colors.dart';
import 'package:users_list/core/theme/my_styles.dart';

class CustomListTile extends StatelessWidget {
  final dynamic item;
  const CustomListTile({super.key, this.item});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: GestureDetector(
            onTap: () {
              context.pushNamed(Routes.userDetailsScreen, arguments: item);
            },
            child: Container(
              width: double.infinity,
              height: 70.h,
              decoration: BoxDecoration(
                color: MyColors.white,
                borderRadius: BorderRadius.circular(20.r),
                boxShadow: [
                  BoxShadow(
                    color: MyColors.indigo.withOpacity(0.4),
                    spreadRadius: 2,
                    blurRadius: 10,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  item.data!.name!,
                  style: MyStyles.font16RobotoBlackSemiBold,
                ),
              ),
            ),
          ),
        ),
        verticalSpacing(15),
      ],
    );
  }
}
