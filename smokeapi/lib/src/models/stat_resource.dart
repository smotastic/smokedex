import 'package:json_annotation/json_annotation.dart';
import 'package:smokeapi/src/models/base_resource.dart';

part 'stat_resource.g.dart';

@JsonSerializable()
class StatResource extends BaseResource {
  final int id;
  final String name;
  StatResource(this.id, this.name);

  factory StatResource.fromJson(Map<String, dynamic> json) {
    return _$StatResourceFromJson(json);
  }
}
