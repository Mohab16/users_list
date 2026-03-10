import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:users_list/core/routing/app_router.dart';
import 'package:users_list/core/routing/routes.dart';

class UsersListApp extends StatelessWidget {
  final AppRouter appRouter;
  const UsersListApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: (settings) => appRouter.generateRoute(settings),
        initialRoute: Routes.loginScreen,
      ),
    );
  }
}
