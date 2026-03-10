import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:users_list/core/networking/api_service.dart';
import 'package:users_list/core/networking/dio_factory.dart';
import 'package:users_list/features/home/data/repos/users_repo.dart';
import 'package:users_list/features/home/logic/cubit/users_cubit.dart';
import 'package:users_list/features/login/data/repos/login_repo.dart';
import 'package:users_list/features/login/data/repos/verification_repo.dart';
import 'package:users_list/features/login/logic/cubit/login_cubit.dart';
import 'package:users_list/features/login/logic/cubit/verification_cubit.dart';

final getIt = GetIt.instance;
Future<void> setupGetIt() async {
  // Dio & ApiService
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  // Login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt<ApiService>()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt<LoginRepo>()));

  //verify
  getIt.registerLazySingleton<VerifyRepo>(
    () => VerifyRepo(getIt<ApiService>()),
  );
  getIt.registerFactory<VerificationCubit>(
    () => VerificationCubit(getIt<VerifyRepo>()),
  );

  //users
  getIt.registerLazySingleton<UsersRepo>(() => UsersRepo(getIt<ApiService>()));
  getIt.registerFactory<UsersCubit>(() => UsersCubit(getIt<UsersRepo>()));
}
