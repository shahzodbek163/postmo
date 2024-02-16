// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ImageResultImpl _$$ImageResultImplFromJson(Map<String, dynamic> json) =>
    _$ImageResultImpl(
      data: (json['data'] as List<dynamic>)
          .map((e) => ImageDatum.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ImageResultImplToJson(_$ImageResultImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

_$ImageDatumImpl _$$ImageDatumImplFromJson(Map<String, dynamic> json) =>
    _$ImageDatumImpl(
      id: json['_id'] as String,
      title: json['title'] as String,
      image: json['image'] as String,
      desc: json['desc'] as String,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
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
      id: json['_id'] as String,
      name: json['name'] as String,
      username: json['username'] as String,
      v: json['__v'] as int,
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'username': instance.username,
      '__v': instance.v,
    };
