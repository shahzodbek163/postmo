import 'package:dio/dio.dart';
import 'package:postmo/controller/service/api/app_ip.dart';
import 'package:postmo/controller/service/dialogs/custom_snack_bar.dart';

class AuthDio {
  late final Dio _dio;
  static final CustomSnackBar _snackBar = CustomSnackBar();

  AuthDio() {
    _dio = Dio(
      BaseOptions(
        validateStatus: (statusCode) {
          if (statusCode == null) {
            return false;
          }
          if (statusCode == 404) {
            return true;
          }
          if (statusCode == 422) {
            return true;
          } else {
            return statusCode >= 200 && statusCode < 300;
          }
        },
        baseUrl: AppIp.ip,
        connectTimeout: const Duration(seconds: 30),
        sendTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        contentType: 'application/json; charset=utf-8',
        headers: {
          'Access-Control-Allow-Origin': '*',
        },
        extra: {
          'ngrok-skip-browser-warning': true,
        },
      ),
    );
    _dio.interceptors.add(
      LogInterceptor(
        request: true,
        responseBody: true,
      ),
    );

    _dio.interceptors.add(
      InterceptorsWrapper(
        onResponse: (response, handler) {
          handler.next(response);
        },
        onError: (DioException e, handler) async {
          if (e.type == DioExceptionType.connectionError ||
              e.type == DioExceptionType.connectionTimeout) {
            _snackBar.showError("Internet bilan aloqa uzildi");
          } else {
            _snackBar.showError("Nimadir xato");
          }

          handler.next(e);
        },
      ),
    );
  }

  Dio get get => _dio;
}
