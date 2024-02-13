import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:postmo/controller/service/api/api_service.dart';
import 'package:postmo/controller/service/dio/auth_dio.dart';
import 'package:postmo/controller/service/dio/secure_storage.dart';
import 'package:postmo/model/auth/login/request/login_request.dart';
import 'package:postmo/model/auth/login/response/login_response.dart';

part 'login_state.dart';
part 'login_cubit.freezed.dart';

class LoginCubit extends Cubit<LoginState> {
  final apiService = ApiService(AuthDio().get);
  LoginCubit() : super(const LoginState.initial());
  Future<bool> login(LoginRequest request) async {
    emit(const LoginState.sending());
    try {
      LoginResponse response = await apiService.login(request);
      SecureStorage().setAccess(response.token);
      emit(LoginState.sent(response));
      return true;
    } on DioException catch (exception) {
      emit(const LoginState.error());
      return false;
    }
  }
}
