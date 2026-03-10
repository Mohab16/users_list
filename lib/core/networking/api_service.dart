import 'package:dio/dio.dart';
import 'package:users_list/features/home/data/models/users_response_model.dart';
import 'package:users_list/features/login/data/models/login_request_body_model.dart';
import 'package:users_list/features/login/data/models/login_response_model.dart';
import 'package:users_list/features/login/data/models/verification_request_body_model.dart';
import 'package:users_list/features/login/data/models/verification_response_model.dart';
import 'api_constants.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(ApiConstants.login)
  Future<LoginResponseModel> login(
    @Body() LoginRequestBodyModel loginRequestBodyModel,
  );

  @POST(ApiConstants.verify)
  Future<VerificationResponseModel> verify(
    @Body() VerificationRequestBodyModel verifyRequestBodyModel,
  );

  @GET("https://reqres.in/api/collections/users_data/records")
  Future<UsersResponseModel> fetchUsers(
    @Query("page") int page,
    @Query("limit") int limit,
  );
}
