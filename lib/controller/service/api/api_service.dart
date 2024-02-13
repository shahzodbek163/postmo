import 'package:dio/dio.dart';
import 'package:postmo/controller/service/api/app_ip.dart';
import 'package:postmo/model/auth/login/request/login_request.dart';
import 'package:postmo/model/auth/login/response/login_response.dart';
import 'package:postmo/model/auth/register/request/register_request.dart';
import 'package:postmo/model/auth/register/response/register_response.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: "${AppIp.ip}/api")
abstract class ApiService {
  factory ApiService(Dio dio) = _ApiService;

  @POST("/auth/user/login")
  Future<LoginResponse> login(@Body() LoginRequest loginRequest);
  @POST("/user/create")
  Future<RegisterResponse> register(@Body() RegisterRequest registerRequest);
}
