part of 'login_cubit.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState.initial() = _Initial;
  const factory LoginState.sending() = _Sending;
  const factory LoginState.sent(LoginResponse response) = _Sent;
  const factory LoginState.error() = _Error;
}
