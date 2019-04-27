import 'package:json_annotation/json_annotation.dart' show
  JsonSerializable
;

import 'package:yaml/yaml.dart' show
  YamlMap
;

part 'package.g.dart'
;

@JsonSerializable()
class Package {

  final String name
  ;

  Package(this.name)
  ;

  factory Package.fromJson(
    Map<String, dynamic> json
  ) =>
    _$PackageFromJson(json)
  ;

  Map<String, dynamic> toJson() =>
    _$PackageToJson(this)
  ;

}

Map<String, dynamic> yamlMapToMap (YamlMap yamlMap) {
  var result = <String, dynamic>{}
  ;
  yamlMap.keys.toList()
  .forEach(
    (item) {
      result
      ..addAll({
        item: yamlMap[item]
      })
      ;
      ;
    }
  )
  ;
  return result
  ;
}
