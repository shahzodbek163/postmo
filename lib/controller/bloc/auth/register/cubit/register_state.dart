part of 'register_cubit.dart';

@freezed
class RegisterState with _$RegisterState {
  const factory RegisterState.initial() = _Initial;
  const factory RegisterState.sending() = _Sending;
  const factory RegisterState.sent(RegisterResponse response) = _Sent;
  const factory RegisterState.error() = _Error;
}
