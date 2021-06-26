import 'package:json_annotation/json_annotation.dart';
import 'package:smokeapi/src/models/named_resource.dart';

part 'pagination.g.dart';

// @JsonSerializable()
// class PaginationEntry {
//   static int idMapper(String url) {
//     final uri = Uri.parse(url);
//     return int.parse(
//         uri.pathSegments.lastWhere((element) => element.isNotEmpty));
//   }

//   final String name;
//   @JsonKey(name: 'url', fromJson: idMapper)
//   final int id;

//   PaginationEntry(this.name, this.id);
//   factory PaginationEntry.fromJson(Map<String, dynamic> json) {
//     return _$PaginationEntryFromJson(json);
//   }
// }

@JsonSerializable()
class Pagination {
  final int count;
  final String? next;
  final String? previous;

  final List<NamedResourceModel> results;

  Pagination(this.count, this.next, this.previous, this.results);

  factory Pagination.fromJson(Map<String, dynamic> json) {
    return _$PaginationFromJson(json);
  }
}
