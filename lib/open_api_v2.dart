import 'package:openapi_types/openapi_types.dart';

/// OpenAPI 2.0 (Swagger) Document
class DocumentV2<T extends Map<String, dynamic>>
    extends OpenAPIDocument<Map<String, dynamic>> {
  /// The base path for the API.
  final String? basePath;

  /// The MIME types accepted by the API.
  final List<String>? consumes;

  /// The definitions of the API's data models.
  final Map<String, SchemaObjectV2> definitions;

  /// Additional external documentation for the API.
  final ExternalDocumentationObjectV2? externalDocs;

  /// The host (name or IP) serving the API.
  final String? host;

  /// The Swagger version (should be "2.0").
  final String swagger;

  /// The transfer protocols supported by the API.
  final List<String>? schemes;

  /// The MIME types produced by the API.
  final List<String>? produces;

  /// The list of tags used by the API with additional metadata.
  final List<TagObjectV2>? tags;

  /// The available responses for the API.
  final Map<String, ResponseObjectV2>? responses;

  /// The available parameters for the API.
  final Map<String, ParameterObjectV2>? parameters;

  /// A declaration of which security schemes are applied for the API as a whole.
  final Map<String, Map<String, List<String>>>? security;

  /// The security definitions (authentication schemes) for the API.
  final Map<String, SecuritySchemeObjectV2>? securityDefinitions;

  /// The available paths and operations for the API.
  final Map<String, PathItemObjectV2> paths;

  /// Creates a [DocumentV2] with the given parameters.
  DocumentV2({
    this.basePath,
    this.consumes,
    required this.definitions,
    this.externalDocs,
    this.host,
    required super.info,
    this.swagger = '2.0',
    this.schemes,
    this.produces,
    this.tags,
    this.responses,
    this.parameters,
    this.security,
    this.securityDefinitions,
    required this.paths,
  }) {
    if (swagger != '2.0') {
      throw ArgumentError('Only Swagger version 2.0 is supported');
    }
  }

  /// Creates a [DocumentV2] from a map.
  factory DocumentV2.fromMap(Map map) {
    return DocumentV2(
      swagger: map['swagger'],
      info: InfoObject.fromMap(map['info']),
      paths: {
        for (final entry in map['paths'].entries)
          entry.key: PathItemObjectV2.fromMap(entry.value),
      },
      definitions: {
        for (final entry in (map['definitions'] ?? {}).entries)
          entry.key: SchemaObjectV2.fromMap(entry.value),
      },
      schemes: map['schemes'] != null
          ? List<String>.from(map['schemes'])
          : null,
      host: map['host'],
      basePath: map['basePath'],
      consumes: map['consumes'] != null
          ? List<String>.from(map['consumes'])
          : null,
      produces: map['produces'] != null
          ? List<String>.from(map['produces'])
          : null,
      tags: map['tags'] != null
          ? List<TagObjectV2>.from(
              map['tags'].map((tag) => TagObjectV2.fromMap(tag)),
            )
          : null,
      responses: {
        for (final entry in (map['responses'] ?? {}).entries)
          entry.key: ResponseObjectV2.fromMap(entry.value),
      },
      parameters: {
        for (final entry in (map['parameters'] ?? {}).entries)
          entry.key: ParameterObjectV2.fromMap(entry.value),
      },
      security: map['security'],
      securityDefinitions: {
        for (final entry in (map['securityDefinitions'] ?? {}).entries)
          entry.key: SecuritySchemeObjectV2.fromMap(entry.value),
      },
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'swagger': swagger,
      if (host != null) 'host': host,
      if (basePath != null) 'basePath': basePath,
      if (schemes != null) 'schemes': schemes,
      if (consumes != null) 'consumes': consumes,
      if (produces != null) 'produces': produces,
      'paths': paths.map((key, value) => MapEntry(key, value.toMap())),
      if (definitions.isNotEmpty)
        'definitions': definitions.map(
          (key, value) => MapEntry(key, value.toMap()),
        ),
      if (parameters != null && parameters!.isNotEmpty)
        'parameters': parameters!.map(
          (key, value) => MapEntry(key, value.toMap()),
        ),
      if (responses != null && responses!.isNotEmpty)
        'responses': responses!.map(
          (key, value) => MapEntry(key, value.toMap()),
        ),
      if (securityDefinitions != null && securityDefinitions!.isNotEmpty)
        'securityDefinitions': securityDefinitions!.map(
          (key, value) => MapEntry(key, value.toMap()),
        ),
      if (security != null && security!.isNotEmpty) 'security': security,
      if (tags != null && tags!.isNotEmpty)
        'tags': tags!.map((tag) => tag.toMap()).toList(),
      if (externalDocs != null) 'externalDocs': externalDocs!.toMap(),
      ...super.toMap(),
    };
  }
}

/// Represents a security scheme in the API.
sealed class SecuritySchemeObjectV2 {
  /// The type of the security scheme.
  final String type;

  /// A description of the security scheme.
  final String? description;

  /// Creates a [SecuritySchemeObjectV2] with the given parameters.
  SecuritySchemeObjectV2({required this.type, this.description});

  /// Converts the [SecuritySchemeObjectV2] to a map.
  Map<String, dynamic> toMap() {
    return {'type': type, if (description != null) 'description': description};
  }

  /// Creates a [SecuritySchemeObjectV2] from a map.
  /// Throws an [ArgumentError] if the type is not recognized.
  factory SecuritySchemeObjectV2.fromMap(Map map) {
    final type = map['type'];
    switch (type) {
      case 'basic':
        return SecuritySchemeBasicV2(description: map['description']);
      case 'apiKey':
        return SecuritySchemeApiKeyV2(
          name: map['name'],
          in_: map['in'],
          description: map['description'],
        );
      case 'oauth':
        return SecuritySchemeOAuth2V2.fromMap(map);
      default:
        throw ArgumentError('Unsupported security scheme type: $type');
    }
  }
}

/// Basic authentication security scheme.
class SecuritySchemeBasicV2 extends SecuritySchemeObjectV2 {
  /// Creates a [SecuritySchemeBasicV2] with an optional [description].
  SecuritySchemeBasicV2({super.description}) : super(type: 'basic');
}

/// API key security scheme.
class SecuritySchemeApiKeyV2 extends SecuritySchemeObjectV2 {
  /// The name of the header or query parameter to be used.
  final String name;

  /// The location of the API key (e.g., "header" or "query").
  final String in_;

  /// Creates a [SecuritySchemeApiKeyV2] with the given [name], [in_], and optional [description].
  SecuritySchemeApiKeyV2({
    required this.name,
    required this.in_,
    super.description,
  }) : super(type: 'apiKey');

  @override
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'in': in_,
      if (description != null) 'description': description,
      'type': type,
      ...super.toMap(),
    };
  }
}

/// OAuth2 security scheme.

sealed class SecuritySchemeOAuth2V2 extends SecuritySchemeObjectV2 {
  /// The OAuth2 flow type (e.g., "implicit", "password", "application", "accessCode").
  final String flow;

  /// The available scopes for the OAuth2 security scheme.
  final Map<String, String> scopes;

  SecuritySchemeOAuth2V2({
    required this.flow,
    required this.scopes,
    super.description,
  }) : super(type: 'oauth2');

  @override
  Map<String, dynamic> toMap() {
    return {
      'flow': flow,
      'scopes': scopes,
      if (description != null) 'description': description,
      'type': type,
      ...super.toMap(),
    };
  }

  /// Creates a [SecuritySchemeOAuth2V2] from a map.
  /// Throws an [ArgumentError] if the flow is not recognized.
  factory SecuritySchemeOAuth2V2.fromMap(Map map) {
    final flow = map['flow'];
    switch (flow) {
      case 'implicit':
        return SecuritySchemeOAuth2ImplicitV2(
          authorizationUrl: map['authorizationUrl'],
          scopes: Map<String, String>.from(map['scopes']),
          description: map['description'],
        );
      case 'password':
        return SecuritySchemeOAuth2PasswordV2(
          tokenUrl: map['tokenUrl'],
          scopes: Map<String, String>.from(map['scopes']),
          description: map['description'],
        );
      case 'application':
        return SecuritySchemeOAuth2ApplicationV2(
          tokenUrl: map['tokenUrl'],
          scopes: Map<String, String>.from(map['scopes']),
          description: map['description'],
        );
      case 'accessCode':
        return SecuritySchemeOAuth2AccessCodeV2(
          authorizationUrl: map['authorizationUrl'],
          tokenUrl: map['tokenUrl'],
          scopes: Map<String, String>.from(map['scopes']),
          description: map['description'],
        );
      default:
        throw ArgumentError('Unsupported OAuth2 flow type: $flow');
    }
  }
}

/// OAuth2 Implicit flow security scheme.
class SecuritySchemeOAuth2ImplicitV2 extends SecuritySchemeOAuth2V2 {
  /// The URL to redirect the user to for authorization.
  final String authorizationUrl;

  /// Creates a [SecuritySchemeOAuth2ImplicitV2] with the given [authorizationUrl], [scopes], and optional [description].
  SecuritySchemeOAuth2ImplicitV2({
    required this.authorizationUrl,
    required super.scopes,
    super.description,
  }) : super(flow: 'implicit');

  @override
  Map<String, dynamic> toMap() {
    return {
      'authorizationUrl': authorizationUrl,
      'scopes': scopes,
      if (description != null) 'description': description,
      'flow': flow,
      ...super.toMap(),
    };
  }
}

//// OAuth2 Password flow security scheme.
class SecuritySchemeOAuth2PasswordV2 extends SecuritySchemeOAuth2V2 {
  /// The URL to obtain the access token.
  final String tokenUrl;

  /// Creates a [SecuritySchemeOAuth2PasswordV2] with the given [tokenUrl], [scopes], and optional [description].
  SecuritySchemeOAuth2PasswordV2({
    required this.tokenUrl,
    required super.scopes,
    super.description,
  }) : super(flow: 'password');

  @override
  Map<String, dynamic> toMap() {
    return {
      'tokenUrl': tokenUrl,
      'scopes': scopes,
      if (description != null) 'description': description,
      'flow': flow,
      ...super.toMap(),
    };
  }
}

/// OAuth2 Client Credentials (Application) flow security scheme.
class SecuritySchemeOAuth2ApplicationV2 extends SecuritySchemeOAuth2V2 {
  /// The URL to obtain the access token.
  final String tokenUrl;

  /// Creates a [SecuritySchemeOAuth2ApplicationV2] with the given [tokenUrl], [scopes], and optional [description].
  SecuritySchemeOAuth2ApplicationV2({
    required this.tokenUrl,
    required super.scopes,
    super.description,
  }) : super(flow: 'application');

  @override
  Map<String, dynamic> toMap() {
    return {
      'tokenUrl': tokenUrl,
      'scopes': scopes,
      if (description != null) 'description': description,
      'flow': flow,
      ...super.toMap(),
    };
  }
}

/// OAuth2 Authorization Code flow security scheme.
class SecuritySchemeOAuth2AccessCodeV2 extends SecuritySchemeOAuth2V2 {
  /// The URL to redirect the user to for authorization.
  final String authorizationUrl;

  /// The URL to obtain the access token.
  final String tokenUrl;

  /// Creates a [SecuritySchemeOAuth2AccessCodeV2] with the given [authorizationUrl], [tokenUrl], [scopes], and optional [description].
  SecuritySchemeOAuth2AccessCodeV2({
    required this.authorizationUrl,
    required this.tokenUrl,
    required super.scopes,
    super.description,
  }) : super(flow: 'accessCode');

  @override
  Map<String, dynamic> toMap() {
    return {
      'authorizationUrl': authorizationUrl,
      'tokenUrl': tokenUrl,
      'scopes': scopes,
      if (description != null) 'description': description,
      'flow': flow,
      ...super.toMap(),
    };
  }
}

/// Path item object representing the operations available on a single path.
class PathItemObjectV2
    extends
        OpenApiPathItem<
          Map<String, dynamic>,
          ParameterObjectV2,
          OperationObjectV2
        > {
  /// Creates a [PathItemObjectV2] with the given parameters.
  PathItemObjectV2({super.ref, super.parameters, required super.operations});

  /// Creates a [PathItemObjectV2] from a map.
  factory PathItemObjectV2.fromMap(Map map) {
    return PathItemObjectV2(
      ref: map[r'$ref'],
      parameters: map['parameters'] != null
          ? List<ParameterObjectV2>.from(
              map['parameters'].map((p) => ParameterObjectV2.fromMap(p)),
            )
          : null,
      operations: Map<String, OperationObjectV2>.fromEntries(
        map.entries
            .where(
              (entry) => [
                'get',
                'put',
                'post',
                'delete',
                'options',
                'head',
                'patch',
                'trace',
              ].contains(entry.key),
            )
            .map(
              (entry) =>
                  MapEntry(entry.key, OperationObjectV2.fromMap(entry.value)),
            ),
      ),
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      if (ref != null) r'$ref': ref,
      if (parameters != null && parameters!.isNotEmpty)
        'parameters': parameters!.map((p) => p.toMap()),
      if (operations.isNotEmpty)
        ...operations.map((key, value) => MapEntry(key, value.toMap())),
    };
  }
}

/// Operation object representing a single API operation on a path.
class OperationObjectV2 extends OpenApiOperation<Map<String, dynamic>> {
  /// A list of tags for API documentation control.
  final List<String>? tags;

  /// A short summary of what the operation does.
  final String? summary;

  /// A verbose explanation of the operation behavior.
  final String? description;

  /// Additional details about the operation.
  final ExternalDocumentationObjectV2? externalDocs;

  /// A unique identifier for the operation.
  final String? operationId;

  /// A list of parameters for the operation.
  final List<ParameterObjectV2>? parameters;

  /// The list of possible responses as they are returned from executing this operation.
  final Map<String, ResponseObjectV2> responses;

  /// A list of MIME types the operation can consume.
  final List<String>? consumes;

  /// A list of MIME types the operation can produce.
  final List<String>? produces;

  /// A declaration of which security schemes are applied for this operation.
  final List<Map<String, List<String>>>? security;

  /// Creates an [OperationObjectV2] with the given parameters.
  OperationObjectV2({
    this.tags,
    this.summary,
    this.description,
    this.externalDocs,
    this.operationId,
    this.parameters,
    required this.responses,
    this.consumes,
    this.produces,
    this.security,
    super.extensions,
  });

  /// Creates an [OperationObjectV2] from a map.
  factory OperationObjectV2.fromMap(Map map) {
    return OperationObjectV2(
      tags: map['tags'] != null ? List<String>.from(map['tags']) : null,
      summary: map['summary'],
      description: map['description'],
      externalDocs: map['externalDocs'] != null
          ? ExternalDocumentationObjectV2.fromMap(map['externalDocs'])
          : null,
      operationId: map['operationId'],
      parameters: map['parameters'] != null
          ? List<ParameterObjectV2>.from(
              map['parameters'].map((p) => ParameterObjectV2.fromMap(p)),
            )
          : null,
      responses: {
        for (final entry in map['responses'].entries)
          entry.key: ResponseObjectV2.fromMap(entry.value),
      },
      consumes: map['consumes'] != null
          ? List<String>.from(map['consumes'])
          : null,
      produces: map['produces'] != null
          ? List<String>.from(map['produces'])
          : null,
      security: map['security'] != null
          ? List<Map<String, List<String>>>.from(
              map['security'].map((s) => Map<String, List<String>>.from(s)),
            )
          : null,
      extensions: Map<String, dynamic>.fromEntries(
        map.entries
            .where((entry) => entry.key.startsWith('x-'))
            .map((entry) => MapEntry(entry.key, entry.value)),
      ),
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      if (tags != null) 'tags': tags,
      if (summary != null) 'summary': summary,
      if (description != null) 'description': description,
      if (externalDocs != null) 'externalDocs': externalDocs!.toMap(),
      if (operationId != null) 'operationId': operationId,
      if (parameters != null && parameters!.isNotEmpty)
        'parameters': parameters!.map((p) => p.toMap()).toList(),
      'responses': responses.map((key, value) => MapEntry(key, value.toMap())),
      if (consumes != null) 'consumes': consumes,
      if (produces != null) 'produces': produces,
      if (security != null && security!.isNotEmpty) 'security': security,
      ...super.toMap(),
    };
  }
}

/// Parameter object representing a single operation parameter.
class ParameterObjectV2 extends OpenApiParameter<Map<String, dynamic>> {
  /// The name of the parameter.
  final String name;

  /// The location of the parameter (e.g., "query", "header", "path", "formData", "body").
  final String in_;

  /// A brief description of the parameter.
  final String? description;

  /// Determines whether this parameter is mandatory.
  final bool? required;

  /// The type of the parameter (e.g., "string", "number", "integer", "boolean", "array", "file").
  final String? type;

  /// The extending format for the parameter type (e.g., "int32", "int64", "float", "double", "byte", "binary", "date", "date-time", "password").
  final String? format;

  /// The schema defining the type used for the body parameter.
  final Object? schema;

  /// Creates a [ParameterObjectV2] with the given parameters.
  const ParameterObjectV2({
    required this.name,
    required this.in_,
    this.description,
    this.type,
    this.format,
    this.schema,
    this.required,
    super.extensions,
  });

  /// Creates a [ParameterObjectV2] from a map.
  factory ParameterObjectV2.fromMap(Map map) {
    return ParameterObjectV2(
      format: map['format'],
      type: map['type'],
      name: map['name'],
      in_: map['in'],
      description: map['description'],
      required: map['required'],
      schema: map['schema'] != null
          ? (map['schema']['\$ref'] != null
                ? ReferenceObject(map['schema']['\$ref'])
                : SchemaObjectV2.fromMap(map['schema']))
          : null,
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'in': in_,
      if (format != null) 'format': format,
      if (type != null) 'type': type,
      if (description != null) 'description': description,
      if (required != null) 'required': required,
      if (schema != null)
        'schema': schema is SchemaObjectV2
            ? (schema as SchemaObjectV2).toMap()
            : (schema as ReferenceObject).toMap(),
      ...super.toMap(),
    };
  }
}

/// Tag object representing a tag for API documentation control.
class TagObjectV2 {
  /// The name of the tag.
  final String name;

  /// A short description of the tag.
  final String? description;

  /// Additional external documentation for the tag.
  final ExternalDocumentationObjectV2? externalDocs;

  /// Creates a [TagObjectV2] with the given parameters.
  TagObjectV2({required this.name, this.description, this.externalDocs});

  /// Creates a [TagObjectV2] from a map.
  factory TagObjectV2.fromMap(Map map) {
    return TagObjectV2(
      name: map['name'],
      description: map['description'],
      externalDocs: map['externalDocs'] != null
          ? ExternalDocumentationObjectV2.fromMap(map['externalDocs'])
          : null,
    );
  }

  /// Converts the [TagObjectV2] to a map.
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      if (description != null) 'description': description,
      if (externalDocs != null) 'externalDocs': externalDocs!.toMap(),
    };
  }
}

/// Response object representing a single response from an API operation.
class ResponseObjectV2 extends OpenApiObject<Map<String, dynamic>> {
  /// A short description of the response.
  String description;

  /// The HTTP status code of the response.
  Map<String, HeaderObjectV2>? headers;

  /// The schema defining the type used for the response body.
  Object? schema;

  /// Examples of the response body.
  Map<String, dynamic>? examples;

  /// Creates a [ResponseObjectV2] with the given parameters.
  ResponseObjectV2({
    required this.description,
    this.headers,
    this.schema,
    this.examples,
  }) {
    if (schema != null &&
        schema is! SchemaObjectV2 &&
        schema is! ReferenceObject) {
      throw ArgumentError(
        'Schema must be a SchemaObjectV2 or a ReferenceObject',
      );
    }
  }

  /// Creates a [ResponseObjectV2] from a map.
  factory ResponseObjectV2.fromMap(Map map) {
    return ResponseObjectV2(
      description: map['description'],
      headers: map['headers'] != null
          ? Map<String, HeaderObjectV2>.fromEntries(
              map['headers'].entries.map(
                (entry) =>
                    MapEntry(entry.key, HeaderObjectV2.fromMap(entry.value)),
              ),
            )
          : null,
      schema: map['schema'] != null
          ? (map['schema']['\$ref'] != null
                ? ReferenceObject(map['schema']['\$ref'])
                : SchemaObjectV2.fromMap(map['schema']))
          : null,
      examples: map['examples'],
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'description': description,
      if (headers != null && headers!.isNotEmpty)
        'headers': headers!.map((key, value) => MapEntry(key, value.toMap())),
      if (schema != null)
        'schema': schema is SchemaObjectV2
            ? (schema as SchemaObjectV2).toMap()
            : (schema as ReferenceObject).toMap(),
      if (examples != null) 'examples': examples,
    };
  }
}

/// Header object representing a single header in a response.
class HeaderObjectV2 extends ItemsObjectV2 {
  /// A brief description of the header.
  final String? description;

  /// Creates a [HeaderObjectV2] with the given parameters.
  HeaderObjectV2({
    this.description,
    required super.type,
    super.items,
    super.collectionFormat,
    super.defaultValue,
    super.maximum,
    super.exclusiveMaximum,
    super.minimum,
    super.exclusiveMinimum,
    super.maxLength,
    super.minLength,
    super.pattern,
    super.maxItems,
    super.minItems,
    super.uniqueItems,
    super.enumValues,
    super.multipleOf,
    super.ref,
  });

  /// Creates a [HeaderObjectV2] from a map.
  factory HeaderObjectV2.fromMap(Map map) {
    return HeaderObjectV2(
      defaultValue: map['default'],
      description: map['description'],
      type: OpenApiType.custom(map['type'], map['format']),
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      if (description != null) 'description': description,
      ...type.toMap(),
      if (items != null)
        'items': items is ItemsObjectV2
            ? (items as ItemsObjectV2).toMap()
            : (items as ReferenceObject).toMap(),
      if (collectionFormat != null) 'collectionFormat': collectionFormat,
      if (defaultValue != null) 'default': defaultValue,
      if (maximum != null) 'maximum': maximum,
      if (exclusiveMaximum != null) 'exclusiveMaximum': exclusiveMaximum,
      if (minimum != null) 'minimum': minimum,
      if (exclusiveMinimum != null) 'exclusiveMinimum': exclusiveMinimum,
      if (maxLength != null) 'maxLength': maxLength,
      if (minLength != null) 'minLength': minLength,
      if (pattern != null) 'pattern': pattern,
      if (maxItems != null) 'maxItems': maxItems,
      if (minItems != null) 'minItems': minItems,
      if (uniqueItems != null) 'uniqueItems': uniqueItems,
      if (enumValues != null) 'enum': enumValues,
      if (multipleOf != null) 'multipleOf': multipleOf,
      if (ref != null) r'$ref': ref,
    };
  }
}

/// Schema object representing a data model in the API.
class SchemaObjectV2 extends JsonSchema<Object> {
  /// The discriminator property name, used to differentiate between different schema types in polymorphic scenarios.
  final String? discriminator;

  /// Indicates whether the property is read-only.
  final bool? readOnly;

  /// Additional XML metadata for the schema.
  final XmlObjectV2? xml;

  /// Additional external documentation for the schema.
  final ExternalDocumentationObjectV2? externalDocs;

  /// An example instance of the schema.
  final Object? example;

  /// The default value of the schema.
  final Object? defaultValue;

  @override
  // ignore: overridden_fields
  final Map<String, SchemaObjectV2>? properties;

  /// Creates a [SchemaObjectV2] with the given parameters.
  SchemaObjectV2({
    super.title,
    super.description,
    super.type,
    super.multipleOf,
    this.defaultValue,
    super.maximum,
    super.exclusiveMaximum,
    super.minimum,
    super.exclusiveMinimum,
    super.maxLength,
    super.minLength,
    super.pattern,
    super.additionalProperties,
    super.hasAdditionalProperties,
    super.maxItems,
    super.minItems,
    super.uniqueItems,
    super.maxProperties,
    super.minProperties,
    super.required,
    super.enumValues,
    this.properties,
    super.allOf,
    super.anyOf,
    super.oneOf,
    super.not,
    this.discriminator,
    this.readOnly,
    this.xml,
    this.externalDocs,
    this.example,
    super.items,
    super.id,
    super.schema,
    super.additionalItems,
    super.definitions,
    super.patternProperties,
    super.dependencies,
    super.ref,
  }) {
    if (items != null && items is! ItemsObjectV2 && items is! ReferenceObject) {
      throw ArgumentError(
        'Items must be an ItemsObjectV2 or a ReferenceObject',
      );
    }
  }

  /// Creates a [SchemaObjectV2] from a map.
  factory SchemaObjectV2.fromMap(Map map) {
    return SchemaObjectV2(
      id: map['id'],
      schema: map[r'$schema'],
      title: map['title'],
      description: map['description'],
      multipleOf: map['multipleOf'],
      maximum: map['maximum'],
      exclusiveMaximum: map['exclusiveMaximum'],
      minimum: map['minimum'],
      exclusiveMinimum: map['exclusiveMinimum'],
      maxLength: map['maxLength'],
      minLength: map['minLength'],
      pattern: map['pattern'],
      additionalItems: map['additionalItems'],
      items: map['items'] != null
          ? (map['items'][r'$ref'] != null
                ? ReferenceObject(map['items'][r'$ref'])
                : ItemsObjectV2.fromMap(map['items']))
          : null,
      maxItems: map['maxItems'],
      minItems: map['minItems'],
      uniqueItems: map['uniqueItems'],
      maxProperties: map['maxProperties'],
      minProperties: map['minProperties'],
      required: map['required'] != null
          ? List<String>.from(map['required'])
          : null,
      hasAdditionalProperties: map.containsKey('additionalProperties'),
      additionalProperties: map['additionalProperties'],
      definitions: {
        for (final entry in (map['definitions'] ?? {}).entries)
          entry.key: SchemaObjectV2.fromMap(entry.value),
      },
      patternProperties: {
        for (final entry in (map['patternProperties'] ?? {}).entries)
          entry.key: SchemaObjectV2.fromMap(entry.value),
      },
      dependencies: {
        for (final entry in (map['dependencies'] ?? {}).entries)
          entry.key: entry.value is List
              ? List<String>.from(entry.value)
              : SchemaObjectV2.fromMap(entry.value),
      },
      enumValues: map['enum'] != null ? List<Object>.from(map['enum']) : null,
      type: map['type'] != null
          ? OpenApiType.custom(map['type'], map['format'])
          : null,
      allOf: map['allOf'] != null
          ? List<SchemaObjectV2>.from(
              map['allOf'].map((s) => SchemaObjectV2.fromMap(s)),
            )
          : null,
      anyOf: map['anyOf'] != null
          ? List<SchemaObjectV2>.from(
              map['anyOf'].map((s) => SchemaObjectV2.fromMap(s)),
            )
          : null,
      oneOf: map['oneOf'] != null
          ? List<SchemaObjectV2>.from(
              map['oneOf'].map((s) => SchemaObjectV2.fromMap(s)),
            )
          : null,
      not: map['not'] != null ? SchemaObjectV2.fromMap(map['not']) : null,
      ref: map[r'$ref'],
      discriminator: map['discriminator'],
      readOnly: map['readOnly'],
      xml: map['xml'] != null ? XmlObjectV2.fromMap(map['xml']) : null,
      externalDocs: map['externalDocs'] != null
          ? ExternalDocumentationObjectV2.fromMap(map['externalDocs'])
          : null,
      example: map['example'],
      defaultValue: map['default'],
      properties: {
        for (final entry in (map['properties'] ?? {}).entries)
          entry.key: SchemaObjectV2.fromMap(entry.value),
      },
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      if (discriminator != null) 'discriminator': discriminator,
      if (readOnly != null) 'readOnly': readOnly,
      if (xml != null) 'xml': xml!.toMap(),
      if (externalDocs != null) 'externalDocs': externalDocs!.toMap(),
      if (example != null) 'example': example,
      if (defaultValue != null) 'default': defaultValue,
      if (properties != null && properties!.isNotEmpty)
        'properties': properties!.map((k, v) => MapEntry(k, v.toMap())),
      ...super.toMap(),
    };
  }
}

/// Items object representing the type of items in an array.
class ItemsObjectV2 extends OpenApiObject<Map<String, dynamic>> {
  /// The type of the items (e.g., "string", "number", "integer", "boolean", "array").
  final OpenApiType type;

  /// The schema defining the type of items in the array.
  final Object? items;

  /// The format of the array (e.g., "csv", "ssv", "tsv", "pipes", "multi").
  final String? collectionFormat;

  /// The default value of the items.
  final Object? defaultValue;

  /// The maximum value of the items.
  final num? maximum;

  /// Indicates whether the maximum value is exclusive.
  final bool? exclusiveMaximum;

  /// The minimum value of the items.
  final num? minimum;

  /// Indicates whether the minimum value is exclusive.
  final bool? exclusiveMinimum;

  /// The maximum length of the items.
  final int? maxLength;

  /// The minimum length of the items.
  final int? minLength;

  /// A regular expression pattern that the items must match.
  final String? pattern;

  /// The maximum number of items in the array.
  final int? maxItems;

  /// The minimum number of items in the array.
  final int? minItems;

  /// Indicates whether the items in the array must be unique.
  final bool? uniqueItems;

  /// An enumeration of possible values for the items.
  final List<Object>? enumValues;

  /// A number that the items must be a multiple of.
  final num? multipleOf;

  /// A reference to an external definition of the items.
  final String? ref;

  /// Creates an [ItemsObjectV2] with the given parameters.
  ItemsObjectV2({
    required this.type,
    this.items,
    this.collectionFormat,
    this.defaultValue,
    this.maximum,
    this.exclusiveMaximum,
    this.minimum,
    this.exclusiveMinimum,
    this.maxLength,
    this.minLength,
    this.pattern,
    this.maxItems,
    this.minItems,
    this.uniqueItems,
    this.enumValues,
    this.multipleOf,
    this.ref,
  }) {
    if (items != null && items is! ItemsObjectV2 && items is! ReferenceObject) {
      throw ArgumentError(
        'Items must be an ItemsObjectV2 or a ReferenceObject',
      );
    }
  }

  /// Creates an [ItemsObjectV2] from a map.
  factory ItemsObjectV2.fromMap(Map value) {
    return ItemsObjectV2(
      type: OpenApiType.custom(value['type'], value['format']),
      items: value['items'] != null
          ? (value['items'] is Map
                ? (value['items'][r'$ref'] != null
                      ? ReferenceObject(value['items'][r'$ref'])
                      : ItemsObjectV2.fromMap(value['items']))
                : null)
          : null,
      collectionFormat: value['collectionFormat'],
      defaultValue: value['default'],
      maximum: value['maximum'],
      exclusiveMaximum: value['exclusiveMaximum'],
      minimum: value['minimum'],
      exclusiveMinimum: value['exclusiveMinimum'],
      maxLength: value['maxLength'],
      minLength: value['minLength'],
      pattern: value['pattern'],
      maxItems: value['maxItems'],
      minItems: value['minItems'],
      uniqueItems: value['uniqueItems'],
      enumValues: value['enum'] != null
          ? List<String>.from(value['enum'])
          : null,
      multipleOf: value['multipleOf'],
      ref: value[r'$ref'],
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      ...type.toMap(),
      if (items != null)
        'items': items is ItemsObjectV2
            ? (items as ItemsObjectV2).toMap()
            : (items as ReferenceObject).toMap(),
      if (collectionFormat != null) 'collectionFormat': collectionFormat,
      if (defaultValue != null) 'default': defaultValue,
      if (maximum != null) 'maximum': maximum,
      if (exclusiveMaximum != null) 'exclusiveMaximum': exclusiveMaximum,
      if (minimum != null) 'minimum': minimum,
      if (exclusiveMinimum != null) 'exclusiveMinimum': exclusiveMinimum,
      if (maxLength != null) 'maxLength': maxLength,
      if (minLength != null) 'minLength': minLength,
      if (pattern != null) 'pattern': pattern,
      if (maxItems != null) 'maxItems': maxItems,
      if (minItems != null) 'minItems': minItems,
      if (uniqueItems != null) 'uniqueItems': uniqueItems,
      if (enumValues != null) 'enum': enumValues,
      if (multipleOf != null) 'multipleOf': multipleOf,
      if (ref != null) r'$ref': ref,
    };
  }
}

/// External documentation object representing additional external documentation.
class ExternalDocumentationObjectV2
    extends OpenApiObject<Map<String, dynamic>> {
  /// The URL of the external documentation.
  final String url;

  /// A brief description of the external documentation.
  final String? description;

  /// Creates an [ExternalDocumentationObjectV2] with the given parameters.
  ExternalDocumentationObjectV2({
    required this.url,
    this.description,
    super.extensions,
  });

  /// Creates an [ExternalDocumentationObjectV2] from a map.
  factory ExternalDocumentationObjectV2.fromMap(Map map) {
    return ExternalDocumentationObjectV2(
      url: map['url'],
      description: map['description'],
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'url': url,
      if (description != null) 'description': description,
      ...super.toMap(),
    };
  }
}

/// XML object representing additional XML metadata.
class XmlObjectV2 extends OpenApiObject<Map<String, dynamic>> {
  /// The name of the XML element.
  final String? name;

  /// The namespace of the XML element.
  final String? namespace;

  /// The prefix of the XML element.
  final String? prefix;

  /// Indicates whether the XML element is an attribute.
  final bool? attribute;

  /// Indicates whether the XML element is wrapped in a container element.
  final bool? wrapped;

  /// Creates an [XmlObjectV2] with the given parameters.
  XmlObjectV2({
    this.name,
    this.namespace,
    this.prefix,
    this.attribute,
    this.wrapped,
    super.extensions,
  });

  /// Creates an [XmlObjectV2] from a map.
  factory XmlObjectV2.fromMap(Map map) {
    return XmlObjectV2(
      name: map['name'],
      namespace: map['namespace'],
      prefix: map['prefix'],
      attribute: map['attribute'],
      wrapped: map['wrapped'],
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      if (name != null) 'name': name,
      if (namespace != null) 'namespace': namespace,
      if (prefix != null) 'prefix': prefix,
      if (attribute != null) 'attribute': attribute,
      if (wrapped != null) 'wrapped': wrapped,
      ...super.toMap(),
    };
  }
}
