part of 'user_get_info_cubit.dart';

@freezed
class UserGetInfoState with _$UserGetInfoState {
  const factory UserGetInfoState.initial() = _Initial;
  const factory UserGetInfoState.loading() = _Loading;
  const factory UserGetInfoState.get(UserResult response) = _Get;
  const factory UserGetInfoState.error() = _Error;
}
