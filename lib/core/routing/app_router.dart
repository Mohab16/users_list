import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users_list/core/routing/routes.dart';
import 'package:users_list/features/home/logic/cubit/users_cubit.dart';
import 'package:users_list/features/home/ui/screens/home_screen.dart';
import 'package:users_list/features/home/ui/screens/user_details_screen.dart';
import 'package:users_list/features/login/logic/cubit/login_cubit.dart';
import 'package:users_list/features/login/logic/cubit/verification_cubit.dart';
import 'package:users_list/features/login/ui/screens/login_screen.dart';
import 'package:users_list/core/di/dependency_injection.dart';
import 'package:users_list/features/login/ui/screens/verification_screen.dart';

class AppRouter {
  Route<dynamic>? generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;
    switch (settings.name) {
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: LoginScreen(),
          ),
        );
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<UsersCubit>(),
            child: HomeScreen(),
          ),
        );
      case Routes.verificationScreen:
        final email = arguments as String;
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => getIt<LoginCubit>()),
              BlocProvider(create: (context) => getIt<VerificationCubit>()),
            ],
            child: VerificationScreen(email: email),
          ),
        );
      case Routes.userDetailsScreen:
        final item = arguments;
        return MaterialPageRoute(
          builder: (context) => UserDetailsScreen(item: item),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: LoginScreen(),
          ),
        );
    }
  }
}
