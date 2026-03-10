import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:users_list/core/theme/my_colors.dart';
import 'package:users_list/core/theme/my_styles.dart';
import 'package:users_list/features/home/data/models/users_response_model.dart';
import 'package:users_list/features/home/logic/cubit/users_cubit.dart';
import 'package:users_list/features/home/logic/cubit/users_state.dart';
import 'package:users_list/features/home/ui/widgets/custom_list_tile.dart';
import 'package:users_list/features/home/ui/widgets/users_skeleton.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.oceanBlue,
        leading: BackButton(color: MyColors.white),
        centerTitle: true,
        title: Text("Users", style: MyStyles.font40LuckiestGuyWhiteBold),
      ),
      backgroundColor: MyColors.oceanBlue,
      body: SafeArea(
        child: BlocBuilder<UsersCubit, UsersState>(
          builder: (context, state) {
            final cubit = context.read<UsersCubit>();
            return PagingListener<int, UserRecord>(
              controller: cubit.pagingController,
              builder: (context, pagingState, fetchNextPage) {
                return Padding(
                  padding: EdgeInsets.only(top: 20.h),
                  child: PagedListView(
                    state: pagingState,
                    fetchNextPage: fetchNextPage,
                    builderDelegate: PagedChildBuilderDelegate<UserRecord>(
                      itemBuilder: (context, item, index) {
                        return CustomListTile(item: item);
                      },
                      firstPageProgressIndicatorBuilder: (context) =>
                          UsersSkeleton(),
                      newPageProgressIndicatorBuilder: (context) =>
                          const Center(
                            child: CircularProgressIndicator.adaptive(),
                          ),
                      noItemsFoundIndicatorBuilder: (context) =>
                          const Center(child: Text('No users found.')),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
