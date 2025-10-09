import 'package:openapi_types/commons.dart';

const _openApiV3SchemaTypes = [int, double, String, bool, List, Map, num];

extension IsOpenApiType on Object? {
  bool get isOpenApiV3Schema {
    return this != null &&
        runtimeType != ReferenceObject &&
        _openApiV3SchemaTypes.contains(runtimeType) == false;
  }
}
