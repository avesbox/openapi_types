import 'dart:convert';

import 'package:openapi_types/openapi_types.dart';
import 'package:yaml/yaml.dart';
import 'package:yaml_writer/yaml_writer.dart';

/// A parser for OpenAPI documents supporting versions 2.0, 3.0.x, and 3.1.x.
class OpenApiParser {
  /// Creates an instance of [OpenApiParser].
  OpenApiParser();

  /// Parses an OpenAPI document from a JSON string.
  OpenAPIDocument parseFromJson(String json) {
    final data = jsonDecode(json);
    final version = _validateOpenApiVersion(data['openapi'] ?? data['swagger']);
    switch (version) {
      case OpenApiVersion.v2:
        return DocumentV2.fromMap(data);
      case OpenApiVersion.v3_0:
        return DocumentV3.fromMap(data);
      case OpenApiVersion.v3_1:
        return DocumentV31.fromMap(data);
    }
  }

  /// Parses an OpenAPI document from a YAML string.
  OpenAPIDocument parseFromYaml(String yaml) {
    final YamlDocument doc = loadYamlDocument(yaml);
    final data = doc.contents.value;
    final version = _validateOpenApiVersion(data['openapi'] ?? data['swagger']);
    switch (version) {
      case OpenApiVersion.v2:
        return DocumentV2.fromMap(data);
      case OpenApiVersion.v3_0:
        return DocumentV3.fromMap(data);
      case OpenApiVersion.v3_1:
        return DocumentV31.fromMap(data);
    }
  }

  final _writer = YamlWriter();

  /// Converts an [OpenAPIDocument] to a JSON or YAML string.
  String stringify(OpenAPIDocument document, {bool toYaml = false}) {
    final map = document.toMap();
    if (toYaml) {
      return _writer.write(map);
    }
    return jsonEncode(
      map,
      toEncodable: (object) {
        if (object is OpenApiObject) {
          return object.toMap();
        }
        return object;
      },
    );
  }

  OpenApiVersion _validateOpenApiVersion(String? version) {
    if (version == null) {
      throw Exception('OpenAPI version is missing.');
    }
    if (version == '2.0') {
      return OpenApiVersion.v2;
    }
    if (RegExp(r'^3\.0\.\d+$').hasMatch(version)) {
      return OpenApiVersion.v3_0;
    }
    if (RegExp(r'^3\.1\.\d+$').hasMatch(version)) {
      return OpenApiVersion.v3_1;
    }
    throw Exception(
      'Unsupported OpenAPI version: $version. Only 2.0, 3.0.x, and 3.1.x are supported.',
    );
  }
}
