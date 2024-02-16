// To parse this JSON data, do
//
//     final imageResult = imageResultFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'image_result.freezed.dart';
part 'image_result.g.dart';

ImageResult imageResultFromJson(String str) =>
    ImageResult.fromJson(json.decode(str));

String imageResultToJson(ImageResult data) => json.encode(data.toJson());

@freezed
class ImageResult with _$ImageResult {
  const factory ImageResult({
    @JsonKey(name: "data") required List<ImageDatum> data,
  }) = _ImageResult;

  factory ImageResult.fromJson(Map<String, dynamic> json) =>
      _$ImageResultFromJson(json);
}

@freezed
class ImageDatum with _$ImageDatum {
  const factory ImageDatum({
    @JsonKey(name: "_id") required String id,
    @JsonKey(name: "title") required String title,
    @JsonKey(name: "image") required String image,
    @JsonKey(name: "desc") required String desc,
    @JsonKey(name: "user") required User? user,
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
