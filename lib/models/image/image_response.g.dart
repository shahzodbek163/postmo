// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ImageResponseImpl _$$ImageResponseImplFromJson(Map<String, dynamic> json) =>
    _$ImageResponseImpl(
      data: (json['data'] as List<dynamic>)
          .map((e) => ImageDatum.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ImageResponseImplToJson(_$ImageResponseImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

_$ImageDatumImpl _$$ImageDatumImplFromJson(Map<String, dynamic> json) =>
    _$ImageDatumImpl(
      id: json['_id'] as String,
      title: json['title'] as String,
      image: json['image'] as String,
      desc: json['desc'] as String,
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      v: json['__v'] as int,
    );

Map<String, dynamic> _$$ImageDatumImplToJson(_$ImageDatumImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
      'image': instance.image,
      'desc': instance.desc,
      'user': instance.user,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      '__v': instance.v,
    };

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      id: $enumDecode(_$IdEnumMap, json['_id']),
      name: $enumDecode(_$NameEnumMap, json['name']),
      username: $enumDecode(_$UsernameEnumMap, json['username']),
      v: json['__v'] as int,
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      '_id': _$IdEnumMap[instance.id]!,
      'name': _$NameEnumMap[instance.name]!,
      'username': _$UsernameEnumMap[instance.username]!,
      '__v': instance.v,
    };

const _$IdEnumMap = {
  Id.THE_65_C8_AE167_C09_A351_D1_E5_C257: '65c8ae167c09a351d1e5c257',
  Id.THE_65_C8_AEB97_C09_A351_D1_E5_C26_B: '65c8aeb97c09a351d1e5c26b',
  Id.THE_65_C9_F5_D49_D2_B10_BB09_D06_D3_E: '65c9f5d49d2b10bb09d06d3e',
  Id.THE_65_C9_FCE19_D2_B10_BB09_D06_D9_D: '65c9fce19d2b10bb09d06d9d',
};

const _$NameEnumMap = {
  Name.AHMADILLO: 'Ahmadillo',
  Name.MUHAMMADALI: 'Muhammadali',
  Name.MUHAMMADSIRIN: 'Muhammadsirin',
  Name.SHAHZOD: 'Shahzod',
};

const _$UsernameEnumMap = {
  Username.AHMADJON: 'ahmadjon',
  Username.MODEVCO: 'modevco',
  Username.SHOHAJON: 'shohajon',
  Username.THE_1234_MUHAMMAD: '1234muhammad',
};
