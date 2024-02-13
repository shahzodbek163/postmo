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
    @JsonKey(name: "_id") required Id id,
    @JsonKey(name: "name") required Name name,
    @JsonKey(name: "username") required Username username,
    @JsonKey(name: "__v") required int v,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

enum Id {
  @JsonValue("65c8ae167c09a351d1e5c257")
  THE_65_C8_AE167_C09_A351_D1_E5_C257,
  @JsonValue("65c8aeb97c09a351d1e5c26b")
  THE_65_C8_AEB97_C09_A351_D1_E5_C26_B,
  @JsonValue("65c9f5d49d2b10bb09d06d3e")
  THE_65_C9_F5_D49_D2_B10_BB09_D06_D3_E,
  @JsonValue("65c9fce19d2b10bb09d06d9d")
  THE_65_C9_FCE19_D2_B10_BB09_D06_D9_D
}

final idValues = EnumValues({
  "65c8ae167c09a351d1e5c257": Id.THE_65_C8_AE167_C09_A351_D1_E5_C257,
  "65c8aeb97c09a351d1e5c26b": Id.THE_65_C8_AEB97_C09_A351_D1_E5_C26_B,
  "65c9f5d49d2b10bb09d06d3e": Id.THE_65_C9_F5_D49_D2_B10_BB09_D06_D3_E,
  "65c9fce19d2b10bb09d06d9d": Id.THE_65_C9_FCE19_D2_B10_BB09_D06_D9_D
});

enum Name {
  @JsonValue("Ahmadillo")
  AHMADILLO,
  @JsonValue("Muhammadali")
  MUHAMMADALI,
  @JsonValue("Muhammadsirin")
  MUHAMMADSIRIN,
  @JsonValue("Shahzod")
  SHAHZOD
}

final nameValues = EnumValues({
  "Ahmadillo": Name.AHMADILLO,
  "Muhammadali": Name.MUHAMMADALI,
  "Muhammadsirin": Name.MUHAMMADSIRIN,
  "Shahzod": Name.SHAHZOD
});

enum Username {
  @JsonValue("ahmadjon")
  AHMADJON,
  @JsonValue("modevco")
  MODEVCO,
  @JsonValue("shohajon")
  SHOHAJON,
  @JsonValue("1234muhammad")
  THE_1234_MUHAMMAD
}

final usernameValues = EnumValues({
  "ahmadjon": Username.AHMADJON,
  "modevco": Username.MODEVCO,
  "shohajon": Username.SHOHAJON,
  "1234muhammad": Username.THE_1234_MUHAMMAD
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
