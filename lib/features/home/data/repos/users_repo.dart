import 'package:users_list/core/networking/api_error_handler.dart';
import 'package:users_list/core/networking/api_result.dart';
import 'package:users_list/core/networking/api_service.dart';
import 'package:users_list/features/home/data/models/users_response_model.dart';

class UsersRepo {
  final ApiService _apiService;

  UsersRepo(this._apiService);

  Future<ApiResult<UsersResponseModel>> fetchUsers(int page, int limit) async {
    try {
      final response = await _apiService.fetchUsers(page, limit);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
