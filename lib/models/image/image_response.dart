// To parse this JSON data, do
//
//     final imageResponse = imageResponseFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'image_response.freezed.dart';
part 'image_response.g.dart';

ImageResponse imageResponseFromJson(String str) =>
    ImageResponse.fromJson(json.decode(str));

String imageResponseToJson(ImageResponse data) => json.encode(data.toJson());

@freezed
class ImageResponse with _$ImageResponse {
  const factory ImageResponse({
    @JsonKey(name: "data") required List<ImageDatum> data,
  }) = _ImageResponse;

  factory ImageResponse.fromJson(Map<String, dynamic> json) =>
      _$ImageResponseFromJson(json);
}

@freezed
class ImageDatum with _$ImageDatum {
  const factory ImageDatum({
    @JsonKey(name: "_id") required String id,
    @JsonKey(name: "title") required String title,
    @JsonKey(name: "image") required String image,
    @JsonKey(name: "desc") required String desc,
    @JsonKey(name: "user") required User user,
    @JsonKey(name: "createdAt") required DateTime createdAt,
    @JsonKey(name: "updatedAt") required DateTime updatedAt,
    @JsonKey(name: "__v") required int v,
  }) = _ImageDatum;

  factory ImageDatum.fromJson(Map<String, dynamic> json) =>
      _$ImageDatumFromJson(json);
}

@freezed
class User with _$User {
  const factory User({
    @JsonKey(name: "_id") required String id,
    @JsonKey(name: "name") required String name,
    @JsonKey(name: "username") required String username,
    @JsonKey(name: "__v") required int v,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
