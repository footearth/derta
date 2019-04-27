import "package:test/test.dart" show
  test
, expect
, equals
, setUp
;
import 'package:path/path.dart' as
  p
;
import 'dart:io' show
  File
;
import 'package:yaml/yaml.dart' show
  loadYaml
, YamlMap
;
import 'dart:convert' show
  json
;
import "package:derta/data/package.dart" show
  Package
, yamlMapToMap
;

import 'dart:mirrors';
class _TestFile {}
final String testDirectory =
  p.dirname(
    (
      reflectClass(_TestFile)
      .owner as LibraryMirror
    ).uri.path
  )
;

const pkgFile = '../../../package.yaml'
;
var filePath = 
  p.relative(
    p.join(
      testDirectory
    , pkgFile
    )
  )
;

void main() {

  YamlMap yamlMap
  ;

  setUp(() async {
    var fileStr = await
      File(filePath)
      .readAsString()
    ;
    yamlMap = loadYaml(fileStr)
    ;
  }
  )
  ;

  test(
    "Check type of 'yamlMap' must be 'YamlMap'"
  , () {
    expect(
      yamlMap is YamlMap
    , equals( true )
    )
    ;
  }
  )
  ;

  test(
    'Check yamlMap can be encode by json'
  , () {
      expect(
        json.encode(
          yamlMap
        ) is String
      , equals( true )
      )    
      ;
    }
  )
  ;

  test(
    'Check length that keys of yamlMapToMap'
  , () {

    var yamlStrMap = yamlMapToMap(yamlMap)
    ;

    expect(
      yamlStrMap is Map<String, dynamic>
    , equals( true )
    )
    ;

    expect(
      yamlMap
      .keys.toList().length
    , equals(
        yamlStrMap
        .keys.toList().length
      )
    )
    ;

    expect(
      Package.fromJson(yamlStrMap) is Package
    , equals( true )
    )
    ;

    expect(
      Package.fromJson(yamlStrMap)
      .toJson() is Map
    , equals( true )
    )
    ;

    }
  )
  ;

}
