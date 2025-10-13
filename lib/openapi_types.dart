export 'open_api_v2.dart';
export 'open_api_v3.dart';
export 'open_api_v3_1.dart';
export 'open_api_parser.dart';
export 'commons.dart';

/// Base class for OpenAPI objects (e.g., [SchemaObjectV3], [ResponseObjectV31]).
abstract class OpenApiObject<T extends Map> {
  /// Creates an [OpenApiObject] with optional [extensions].
  const OpenApiObject({this.extensions});

  /// Vendor-specific extension fields (`x-*`) merged into the object.
  final T? extensions;

  /// Converts the [OpenApiObject] to a map.
  Map<String, dynamic> toMap() {
    return {if (extensions != null) ...extensions!};
  }
}

/// Base class for the three OpenAPI document flavours exposed by the library.
abstract class OpenAPIDocument<T extends Map<String, dynamic>> {
  /// Creates an [OpenAPIDocument] with optional [extensions].
  const OpenAPIDocument({this.extensions});

  /// Vendor-specific extension fields (`x-*`) merged into the document.
  final T? extensions;

  /// Converts the [OpenAPIDocument] to a map.
  Map<String, dynamic> toMap() {
    return {if (extensions != null) ...extensions!};
  }
}

/// Base class for OpenAPI operations (e.g., [OperationObjectV3], [OperationObjectV31]).
abstract class OpenApiOperation<T extends Map<String, dynamic>> {
  /// Creates an [OpenApiOperation] with optional [extensions].
  const OpenApiOperation({this.extensions});

  /// Vendor-specific extension fields (`x-*`) merged into the operation.
  final T? extensions;

  /// Converts the [OpenApiOperation] to a map.
  Map<String, dynamic> toMap() {
    return {if (extensions != null) ...extensions!};
  }
}

/// Base class for OpenAPI parameters (e.g., [ParameterObjectV3], [ParameterObjectV31]).
abstract class OpenApiParameter<T extends Map<String, dynamic>>
    extends OpenApiObject<T> {
  /// Creates an [OpenApiParameter] with optional [extensions].
  const OpenApiParameter({super.extensions});

  @override
  Map<String, dynamic> toMap() {
    return {...super.toMap()};
  }
}
