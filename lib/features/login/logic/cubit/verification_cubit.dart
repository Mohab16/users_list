import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users_list/core/networking/api_result.dart';
import 'package:users_list/features/login/data/models/verification_request_body_model.dart';
import 'package:users_list/features/login/data/repos/verification_repo.dart';
import 'package:users_list/features/login/logic/cubit/verification_state.dart';

class VerificationCubit extends Cubit<VerificationState> {
  final VerifyRepo verifyRepo;
  VerificationCubit(this.verifyRepo) : super(VerificationState.initial());
  void emitVerifyStates(
    VerificationRequestBodyModel verifyRequestBodyModel,
  ) async {
    emit(VerificationState.loading());
    final response = await verifyRepo.verify(verifyRequestBodyModel);
    response.when(
      success: (data) {
        emit(VerificationState.success(data));
      },
      failure: (error) {
        emit(VerificationState.error(error: error.apiErrorModel.message));
      },
    );
  }
}
