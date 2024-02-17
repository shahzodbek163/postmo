// To parse this JSON data, do
//
//     final userResult = userResultFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'user_result.freezed.dart';
part 'user_result.g.dart';

UserResult userResultFromJson(String str) =>
    UserResult.fromJson(json.decode(str));

String userResultToJson(UserResult data) => json.encode(data.toJson());

@freezed
class UserResult with _$UserResult {
  const factory UserResult({
    @JsonKey(name: "_id") required String id,
    @JsonKey(name: "name") required String name,
    @JsonKey(name: "username") required String username,
    @JsonKey(name: "__v") required int v,
  }) = _UserResult;

  factory UserResult.fromJson(Map<String, dynamic> json) =>
      _$UserResultFromJson(json);
}
