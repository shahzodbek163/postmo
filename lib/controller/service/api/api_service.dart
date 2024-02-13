import 'package:dio/dio.dart';
import 'package:postmo/controller/service/api/app_ip.dart';
import 'package:postmo/models/image/image_response.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: "${AppIp.ip}/api")
abstract class ApiService {
  factory ApiService(Dio dio) = _ApiService;
  @GET("/post/image/get/all")
  Future<ImageResponse> getAllImage();
}
