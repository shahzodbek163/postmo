// To parse this JSON data, do
//
//     final registerRequest = registerRequestFromJson(jsonString);

import 'package:meta/meta.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'register_request.freezed.dart';
part 'register_request.g.dart';

RegisterRequest registerRequestFromJson(String str) => RegisterRequest.fromJson(json.decode(str));

String registerRequestToJson(RegisterRequest data) => json.encode(data.toJson());

@freezed
class RegisterRequest with _$RegisterRequest {
    const factory RegisterRequest({
        @JsonKey(name: "name")
        required String name,
        @JsonKey(name: "username")
        required String username,
        @JsonKey(name: "password")
        required String password,
    }) = _RegisterRequest;

    factory RegisterRequest.fromJson(Map<String, dynamic> json) => _$RegisterRequestFromJson(json);
}
