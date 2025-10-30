import 'package:openapi_types/commons.dart';

const _openApiV3SchemaTypes = [int, double, String, bool, List, Map, num];

/// Extension to check if an object is not a known OpenAPI v3 schema type.
extension IsOpenApiType on Object? {
  /// Returns true if the object is not a known OpenAPI v3 schema type.
  bool get isNotOpenApiV3Schema {
    return this != null &&
        (runtimeType != ReferenceObject &&
            (!_openApiV3SchemaTypes.contains(runtimeType) && !_openApiV3SchemaTypes.contains(this)) &&
            (this is! List && this is! Map));
  }
}
