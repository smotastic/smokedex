import 'package:json_annotation/json_annotation.dart';
import 'package:smokeapi/src/models/base_resource.dart';

part 'item_resource.g.dart';

@JsonSerializable()
class ItemResource extends BaseResource {
  final int id;
  final String name;
  ItemResource(this.id, this.name);

  factory ItemResource.fromJson(Map<String, dynamic> json) {
    return _$ItemResourceFromJson(json);
  }
}
