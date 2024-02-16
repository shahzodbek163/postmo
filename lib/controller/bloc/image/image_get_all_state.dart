part of 'image_get_all_cubit.dart';

@freezed
class ImageGetAllState with _$ImageGetAllState {
  const factory ImageGetAllState.initial() = _Initial;
  const factory ImageGetAllState.loading() = _Loading;
  const factory ImageGetAllState.get(ImageResult response) = _Get;
  const factory ImageGetAllState.error() = _Error;
}
