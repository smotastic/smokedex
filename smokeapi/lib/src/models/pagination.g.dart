// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaginationEntry _$PaginationEntryFromJson(Map<String, dynamic> json) {
  return PaginationEntry(
    json['name'] as String,
    json['url'] as String,
  );
}

Map<String, dynamic> _$PaginationEntryToJson(PaginationEntry instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };

Pagination _$PaginationFromJson(Map<String, dynamic> json) {
  return Pagination(
    json['count'] as int,
    json['next'] as String?,
    json['previous'] as String?,
    (json['results'] as List<dynamic>)
        .map((e) => PaginationEntry.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$PaginationToJson(Pagination instance) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.results,
    };
