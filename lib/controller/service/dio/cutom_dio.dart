import 'package:dio/dio.dart';
import 'package:go_router/go_router.dart';
import 'package:postmo/controller/service/api/app_token.dart';
import 'package:postmo/controller/service/dialogs/custom_snack_bar.dart';
import 'package:postmo/controller/service/dio/secure_storage.dart';
import 'package:postmo/controller/service/navigation/navigation_service.dart';
import 'package:postmo/view/screen/start/screen/start_screen.dart';

class CustomDio {
  static Dio _dio = Dio();
  static final CustomSnackBar _snackBar = CustomSnackBar();

  CustomDio() {
    final token = SecureStorage().getAccess();

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
        baseUrl: '',
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
        onRequest: (options, handler) {
          options.headers["token"] = token;
          return handler.next(options);
        },
        onResponse: (response, handler) {
          switch (response.statusCode) {
            case 401:
              {
                NavigationService.navigatorKey.currentState!.context
                    .pushReplacement(StartScreen.routeName);
              }
              break;
          }
          handler.next(response);
        },
        onError: (DioException e, handler) async {
          if (e.response!.statusCode == 400) {}
          _snackBar.showError(e.response!.data["message"]);
          handler.next(e);
        },
      ),
    );
  }

  Dio get get => _dio;
}
