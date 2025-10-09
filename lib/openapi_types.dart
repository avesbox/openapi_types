export 'open_api_v2.dart';
export 'open_api_v3.dart';
export 'open_api_v3_1.dart';
export 'commons.dart';

abstract class OpenApiObject<T extends Map<String, dynamic>> {
  const OpenApiObject({this.extensions});

  /// Vendor-specific extension fields (`x-*`) merged into the object.
  final T? extensions;

  Map<String, dynamic> toMap() {
    return {if (extensions != null) ...extensions!};
  }
}

/// Base class for the three OpenAPI document flavours exposed by the library.
abstract class OpenAPIDocument<T extends Map<String, dynamic>> {
  const OpenAPIDocument({this.extensions});

  /// Vendor-specific extension fields (`x-*`) merged into the document.
  final T? extensions;

  Map<String, dynamic> toMap() {
    return {if (extensions != null) ...extensions!};
  }
}

abstract class OpenApiOperation<T extends Map<String, dynamic>> {
  const OpenApiOperation({this.extensions});

  /// Vendor-specific extension fields (`x-*`) merged into the operation.
  final T? extensions;

  Map<String, dynamic> toMap() {
    return {if (extensions != null) ...extensions!};
  }
}

abstract class OpenApiParameter<T extends Map<String, dynamic>>
    extends OpenApiObject<T> {
  const OpenApiParameter({super.extensions});

  @override
  Map<String, dynamic> toMap() {
    return {...super.toMap()};
  }
}
