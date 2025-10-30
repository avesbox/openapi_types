import 'package:openapi_types/commons.dart';

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
  const OpenAPIDocument({this.extensions, required this.info});

  /// Vendor-specific extension fields (`x-*`) merged into the document.
  final T? extensions;

  final InfoObject info;

  /// Converts the [OpenAPIDocument] to a map.
  Map<String, dynamic> toMap() {
    return {if (extensions != null) ...extensions!, 'info': info.toMap()};
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

/// Base class for OpenAPI path items (e.g., [PathItemObjectV2], [PathItemObjectV3], [PathItemObjectV31]).
abstract class OpenApiPathItem<
  T extends Map<String, dynamic>,
  P extends OpenApiObject,
  O extends OpenApiOperation
>
    extends OpenApiObject<T> {
  /// A reference to an external definition of the path item.
  final String? ref;

  /// A list of parameters that are applicable for all the operations described under this path.
  final List<P>? parameters;

  /// A map of HTTP methods to their corresponding operation objects.
  final Map<String, O> operations;

  /// Creates an [OpenApiPathItem] with optional [extensions].
  const OpenApiPathItem({
    required this.operations,
    this.ref,
    this.parameters,
    super.extensions,
  });
}

/// Base class for OpenAPI types (e.g., [OpenApiType]).
class OpenApiType {
  /// The [type] property contains the type of the OpenAPI type.
  final String type;

  /// The [format] property contains the format of the OpenAPI type.
  final String? format;

  /// The [OpenApiType] constructor is used to create a new instance of the [OpenApiType] class.
  const OpenApiType._(this.type, [this.format]);

  /// Converts the [OpenApiType] to a map.
  Map<String, dynamic> toMap() {
    return {'type': type, if (format != null) 'format': format};
  }

  /// Creates a custom OpenAPI type with the given [type] and optional [format].
  factory OpenApiType.custom(String type, [String? format]) =>
      OpenApiType._(type, format);

  /// int32 type
  factory OpenApiType.int32() => const OpenApiType._('integer', 'int32');

  /// int64 type
  factory OpenApiType.int64() => const OpenApiType._('integer', 'int64');

  /// float type
  factory OpenApiType.float() => const OpenApiType._('number', 'float');

  /// double type
  factory OpenApiType.double() => const OpenApiType._('number', 'double');

  /// string type
  factory OpenApiType.string() => const OpenApiType._('string');

  /// byte type
  factory OpenApiType.byte() => const OpenApiType._('string', 'byte');

  /// binary type
  factory OpenApiType.binary() => const OpenApiType._('string', 'binary');

  /// boolean type
  factory OpenApiType.boolean() => const OpenApiType._('boolean');

  /// date type
  factory OpenApiType.date() => const OpenApiType._('string', 'date');

  /// date-time type
  factory OpenApiType.dateTime() => const OpenApiType._('string', 'date-time');

  /// password type
  factory OpenApiType.password() => const OpenApiType._('string', 'password');

  /// object type
  factory OpenApiType.object() => const OpenApiType._('object');

  /// array type
  factory OpenApiType.array() => const OpenApiType._('array');

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is OpenApiType && other.type == type && other.format == format;
  }

  @override
  int get hashCode => Object.hash(type, format);
}
