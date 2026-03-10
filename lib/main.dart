import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:users_list/core/di/dependency_injection.dart';
import 'package:users_list/core/routing/app_router.dart';
import 'package:users_list/users_list_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupGetIt();
  await ScreenUtil.ensureScreenSize();
  runApp(UsersListApp(appRouter: AppRouter()));
}
