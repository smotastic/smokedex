// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'named_resource.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NamedResourceModel _$NamedResourceModelFromJson(Map<String, dynamic> json) {
  return NamedResourceModel(
    json['name'] as String,
    NamedResourceModel.idMapper(json['url'] as String),
  );
}

Map<String, dynamic> _$NamedResourceModelToJson(NamedResourceModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url': instance.id,
    };
