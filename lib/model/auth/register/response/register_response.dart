// To parse this JSON data, do
//
//     final registerResponse = registerResponseFromJson(jsonString);

import 'package:meta/meta.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'register_response.freezed.dart';
part 'register_response.g.dart';

RegisterResponse registerResponseFromJson(String str) => RegisterResponse.fromJson(json.decode(str));

String registerResponseToJson(RegisterResponse data) => json.encode(data.toJson());

@freezed
class RegisterResponse with _$RegisterResponse {
    const factory RegisterResponse({
        @JsonKey(name: "status")
        required bool status,
        @JsonKey(name: "message")
        required String message,
    }) = _RegisterResponse;

    factory RegisterResponse.fromJson(Map<String, dynamic> json) => _$RegisterResponseFromJson(json);
}
