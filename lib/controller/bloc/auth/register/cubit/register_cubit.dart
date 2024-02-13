import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:postmo/controller/service/api/api_service.dart';
import 'package:postmo/controller/service/dio/auth_dio.dart';
import 'package:postmo/model/auth/register/request/register_request.dart';
import 'package:postmo/model/auth/register/response/register_response.dart';

part 'register_state.dart';
part 'register_cubit.freezed.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final apiService = ApiService(AuthDio().get);
  RegisterCubit() : super(const RegisterState.initial());
  Future<bool> register(RegisterRequest request) async {
    emit(const RegisterState.sending());
    try {
      RegisterResponse response = await apiService.register(request);
      emit(RegisterState.sent(response));
      return true;
    } on DioException catch (e) {
      emit(const RegisterState.error());
      return false;
    }
  }
}
