import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users_list/core/networking/api_result.dart';
import 'package:users_list/features/login/data/models/login_request_body_model.dart';
import 'package:users_list/features/login/data/repos/login_repo.dart';
import 'package:users_list/features/login/logic/cubit/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;
  // final TextEditingController emailCotroller=TextEditingController();
  LoginCubit(this._loginRepo) : super(LoginState.initial());

  void emitLoginStates(LoginRequestBodyModel loginRequestBodyModel) async {
    emit(LoginState.loading());
    final response = await _loginRepo.login(loginRequestBodyModel);
    response.when(
      success: (data) {
        emit(LoginState.success(data));
      },
      failure: (error) {
        emit(LoginState.error(error: error.apiErrorModel.message));
      },
    );
  }
}
