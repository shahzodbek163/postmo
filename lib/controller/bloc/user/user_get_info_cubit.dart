import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:postmo/controller/service/api/api_service.dart';
import 'package:postmo/controller/service/dio/cutom_dio.dart';
import 'package:postmo/models/user/user_result.dart';

part 'user_get_info_state.dart';
part 'user_get_info_cubit.freezed.dart';

class UserGetInfoCubit extends Cubit<UserGetInfoState> {
  final apiServis = ApiService(CustomDio().get);
  UserGetInfoCubit() : super(const UserGetInfoState.initial());
  void getUserInfo() async {
    emit(const UserGetInfoState.loading());
    UserResult result = await apiServis.getUserInfo();
    emit(UserGetInfoState.get(result));
  }
}
