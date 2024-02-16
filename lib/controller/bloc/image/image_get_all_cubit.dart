import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:postmo/controller/service/api/api_service.dart';
import 'package:postmo/controller/service/api/app_token.dart';
import 'package:postmo/controller/service/dio/cutom_dio.dart';
import 'package:postmo/models/image/image_result.dart';

part 'image_get_all_state.dart';
part 'image_get_all_cubit.freezed.dart';

class ImageGetAllCubit extends Cubit<ImageGetAllState> {
  final apiService = ApiService(CustomDio().get);
  ImageGetAllCubit() : super(const ImageGetAllState.initial());
  void getAllImage() async {
    emit(const ImageGetAllState.loading());
    ImageResult response = await apiService.getAllImage();
    emit(ImageGetAllState.get(response));
  }
}
