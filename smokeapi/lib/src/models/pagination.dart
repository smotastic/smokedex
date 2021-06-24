import 'package:json_annotation/json_annotation.dart';

part 'pagination.g.dart';

@JsonSerializable()
class PaginationEntry {
  final String name;
  final String url;

  PaginationEntry(this.name, this.url);
  factory PaginationEntry.fromJson(Map<String, dynamic> json) {
    return _$PaginationEntryFromJson(json);
  }
}

@JsonSerializable()
class Pagination {
  final int count;
  final String? next;
  final String? previous;

  final List<PaginationEntry> results;

  Pagination(this.count, this.next, this.previous, this.results);

  factory Pagination.fromJson(Map<String, dynamic> json) {
    return _$PaginationFromJson(json);
  }
}
