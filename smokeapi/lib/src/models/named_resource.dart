import 'package:json_annotation/json_annotation.dart';
import 'package:smokeapi/src/models/base_resource.dart';

part 'named_resource.g.dart';

@JsonSerializable()
class NamedResourceModel extends BaseResource {
  static int idMapper(String url) {
    final uri = Uri.parse(url);
    return int.parse(
        uri.pathSegments.lastWhere((element) => element.isNotEmpty));
  }

  final String name;
  @JsonKey(name: 'url', fromJson: idMapper)
  final int id;

  NamedResourceModel(this.name, this.id);

  factory NamedResourceModel.fromJson(Map<String, dynamic> json) {
    return _$NamedResourceModelFromJson(json);
  }
}
