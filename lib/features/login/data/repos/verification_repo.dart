import 'package:users_list/core/networking/api_error_handler.dart';
import 'package:users_list/core/networking/api_result.dart';
import 'package:users_list/core/networking/api_service.dart';
import 'package:users_list/features/login/data/models/verification_request_body_model.dart';
import 'package:users_list/features/login/data/models/verification_response_model.dart';

class VerifyRepo {
  final ApiService _apiService;

  VerifyRepo(this._apiService);
  Future<ApiResult<VerificationResponseModel>> verify(
    VerificationRequestBodyModel verifyRequestBodyModel,
  ) async {
    try {
      final response = await _apiService.verify(verifyRequestBodyModel);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
