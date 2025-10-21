import 'package:openapi_types/openapi_types.dart';

/// Structure to hold paths, webhooks, and components as per OpenAPI 3.1 specification.
class PathsWebhooksComponentsV31<T extends Map<String, dynamic>> {
  /// Creates a [PathsWebhooksComponentsV31] with the given parameters.
  const PathsWebhooksComponentsV31({this.paths, this.webhooks, this.components})
    : assert(
        paths != null || webhooks != null || components != null,
        'At least one of paths, webhooks or components must be provided.',
      );

  /// A map of available paths and operations for the API.
  final Map<String, PathItemObjectV31>? paths;

  /// A map of available webhooks for the API.
  final Map<String, PathItemObjectV31>? webhooks;

  /// An object to hold reusable components for different aspects of the OAS.
  final ComponentsObjectV31? components;

  /// Creates a copy of the [PathsWebhooksComponentsV31] with the given parameters.
  PathsWebhooksComponentsV31<T> copyWith({
    Map<String, PathItemObjectV31>? paths,
    Map<String, PathItemObjectV31>? webhooks,
    ComponentsObjectV31? components,
  }) {
    return PathsWebhooksComponentsV31<T>(
      paths: paths ?? this.paths,
      webhooks: webhooks ?? this.webhooks,
      components: components ?? this.components,
    );
  }

  /// Converts the [PathsWebhooksComponentsV31] to a map.
  Map<String, dynamic> toMap() {
    return {
      if (paths != null)
        'paths': {
          for (final entry in paths!.entries) entry.key: entry.value.toMap(),
        },
      if (webhooks != null)
        'webhooks': {
          for (final entry in webhooks!.entries) entry.key: entry.value.toMap(),
        },
      if (components != null) 'components': components!.toMap(),
    };
  }
}

/// Components object as per OpenAPI 3.1 specification.
class ComponentsObjectV31 extends ComponentsObjectV3 {
  /// A map of reusable [PathItemObjectV31]s.
  final Map<String, OpenApiObject>? pathItems;

  /// Creates a [ComponentsObjectV31] with the given parameters.
  ComponentsObjectV31({
    super.schemas,
    super.responses,
    super.parameters,
    super.examples,
    super.requestBodies,
    super.headers,
    super.securitySchemes,
    super.links,
    super.callbacks,
    this.pathItems,
  });

  /// Creates a [ComponentsObjectV31] from a map.
  factory ComponentsObjectV31.fromMap(Map map) {
    return ComponentsObjectV31(
      schemas: map['schemas'] != null
          ? {
              for (final entry in (map['schemas'] as Map).entries)
                entry.key: entry.value is Map
                    ? SchemaObjectV3.fromMap(entry.value)
                    : ReferenceObject(entry.value['\$ref']),
            }
          : null,
      responses: map['responses'] != null
          ? {
              for (final entry in (map['responses'] as Map).entries)
                entry.key: entry.value is Map
                    ? ResponseObjectV3.fromMap(entry.value)
                    : ReferenceObject(entry.value['\$ref']),
            }
          : null,
      parameters: map['parameters'] != null
          ? {
              for (final entry in (map['parameters'] as Map).entries)
                entry.key: entry.value is Map
                    ? ParameterObjectV3.fromMap(entry.value)
                    : ReferenceObject(entry.value['\$ref']),
            }
          : null,
      examples: map['examples'] != null
          ? {
              for (final entry in (map['examples'] as Map).entries)
                entry.key: entry.value is Map
                    ? ExampleObjectV3.fromMap(entry.value)
                    : ReferenceObject(entry.value['\$ref']),
            }
          : null,
      requestBodies: map['requestBodies'] != null
          ? {
              for (final entry in (map['requestBodies'] as Map).entries)
                entry.key: entry.value is Map
                    ? RequestBodyV3.fromMap(entry.value)
                    : ReferenceObject(entry.value['\$ref']),
            }
          : null,
      headers: map['headers'] != null
          ? {
              for (final entry in (map['headers'] as Map).entries)
                entry.key: entry.value is Map
                    ? HeaderObjectV3.fromMap(entry.value)
                    : ReferenceObject(entry.value['\$ref']),
            }
          : null,
      securitySchemes: map['securitySchemes'] != null
          ? {
              for (final entry in (map['securitySchemes'] as Map).entries)
                entry.key: entry.value is Map
                    ? SecuritySchemeObjectV3.fromMap(entry.value)
                    : ReferenceObject(entry.value['\$ref']),
            }
          : null,
      links: map['links'] != null
          ? {
              for (final entry in (map['links'] as Map).entries)
                entry.key: entry.value is Map
                    ? LinkObjectV3.fromMap(entry.value)
                    : ReferenceObject(entry.value['\$ref']),
            }
          : null,
      callbacks: map['callbacks'] != null
          ? {
              for (final entry in (map['callbacks'] as Map).entries)
                entry.key: entry.value is Map
                    ? PathItemObjectV31.fromMap(entry.value)
                    : ReferenceObject(entry.value['\$ref']),
            }
          : null,
      pathItems: map['pathItems'] != null
          ? {
              for (final entry in (map['pathItems'] as Map).entries)
                entry.key: entry.value is Map
                    ? PathItemObjectV31.fromMap(entry.value)
                    : ReferenceObject(entry.value['\$ref']),
            }
          : null,
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      if (schemas != null)
        'schemas': {
          for (final entry in schemas!.entries) entry.key: entry.value.toMap(),
        },
      if (responses != null)
        'responses': {
          for (final entry in responses!.entries)
            entry.key: entry.value.toMap(),
        },
      if (parameters != null)
        'parameters': {
          for (final entry in parameters!.entries)
            entry.key: entry.value.toMap(),
        },
      if (examples != null)
        'examples': {
          for (final entry in examples!.entries) entry.key: entry.value.toMap(),
        },
      if (requestBodies != null)
        'requestBodies': {
          for (final entry in requestBodies!.entries)
            entry.key: entry.value.toMap(),
        },
      if (headers != null)
        'headers': {
          for (final entry in headers!.entries) entry.key: entry.value.toMap(),
        },
      if (securitySchemes != null)
        'securitySchemes': {
          for (final entry in securitySchemes!.entries)
            entry.key: entry.value.toMap(),
        },
      if (links != null)
        'links': {
          for (final entry in links!.entries) entry.key: entry.value.toMap(),
        },
      if (callbacks != null)
        'callbacks': {
          for (final entry in callbacks!.entries)
            entry.key: entry.value.toMap(),
        },
      if (pathItems != null)
        'pathItems': {
          for (final entry in pathItems!.entries)
            entry.key: entry.value.toMap(),
        },
    };
  }
}

/// OpenAPI 3.1 document as per the OpenAPI 3.1 specification.
class DocumentV31 extends OpenAPIDocument<Map<String, dynamic>> {
  /// Creates a [DocumentV31] with the given parameters.
  DocumentV31({
    this.openapi = '3.1.0',
    required super.info,
    this.jsonSchemaDialect,
    this.servers,
    PathsWebhooksComponentsV31<Map<String, dynamic>>? structure,
    this.security,
    this.tags,
    this.externalDocs,
    super.extensions,
  }) : paths = structure?.paths,
       webhooks = structure?.webhooks,
       components = structure?.components;

  /// The OpenAPI version string.
  final String openapi;

  /// The default JSON Schema dialect.
  final String? jsonSchemaDialect;

  /// An array of server objects, which provide connectivity information to a target server.
  final List<ServerObjectV3>? servers;

  /// The available paths and operations for the API.
  final Map<String, PathItemObjectV31>? paths;

  /// The available webhooks for the API.
  final Map<String, PathItemObjectV31>? webhooks;

  /// An object to hold reusable components for different aspects of the OAS.
  final ComponentsObjectV31? components;

  /// A declaration of which security mechanisms can be used across the API.
  final List<Map<String, List<String>>>? security;

  /// A list of tags used by the specification with additional metadata.
  final List<TagObjectV3>? tags;

  /// Additional external documentation.
  final ExternalDocumentationObjectV3? externalDocs;

  /// Creates a [DocumentV31] from a map.
  factory DocumentV31.fromMap(Map map) {
    return DocumentV31(
      info: InfoObject.fromMap(map['info']),
      openapi: map['openapi'] ?? '3.1.0',
      jsonSchemaDialect: map['jsonSchemaDialect'],
      servers: map['servers'] != null
          ? List<ServerObjectV3>.from(
              map['servers'].map((server) => ServerObjectV3.fromMap(server)),
            )
          : null,
      structure: PathsWebhooksComponentsV31(
        paths: map['paths'] != null
            ? {
                for (final entry in (map['paths'] as Map).entries)
                  entry.key: PathItemObjectV31.fromMap(entry.value),
              }
            : null,
        webhooks: map['webhooks'] != null
            ? {
                for (final entry in (map['webhooks'] as Map).entries)
                  entry.key: PathItemObjectV31.fromMap(entry.value),
              }
            : null,
        components: map['components'] != null
            ? ComponentsObjectV31.fromMap(map['components'])
            : null,
      ),
      security: map['security'] != null
          ? List<Map<String, List<String>>>.from(
              map['security'].map(
                (item) => Map<String, List<String>>.from(item),
              ),
            )
          : null,
      tags: map['tags'] != null
          ? List<TagObjectV3>.from(
              map['tags'].map((tag) => TagObjectV3.fromMap(tag)),
            )
          : null,
    );
  }

  /// Creates a copy of the [DocumentV31] with the given parameters.
  DocumentV31 copyWith({
    String? openapi,
    InfoObject? info,
    String? jsonSchemaDialect,
    List<ServerObjectV3>? servers,
    PathsWebhooksComponentsV31<Map<String, dynamic>>? structure,
    List<Map<String, List<String>>>? security,
    List<TagObjectV3>? tags,
    ExternalDocumentationObjectV3? externalDocs,
    Map<String, dynamic>? extensions,
  }) {
    final effectiveStructure =
        structure ??
        PathsWebhooksComponentsV31<Map<String, dynamic>>(
          paths: paths,
          webhooks: webhooks,
          components: components,
        );
    return DocumentV31(
      openapi: openapi ?? this.openapi,
      info: info ?? this.info,
      jsonSchemaDialect: jsonSchemaDialect ?? this.jsonSchemaDialect,
      servers: servers ?? this.servers,
      structure: effectiveStructure,
      security: security ?? this.security,
      tags: tags ?? this.tags,
      externalDocs: externalDocs ?? this.externalDocs,
      extensions: extensions ?? this.extensions,
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'openapi': openapi,
      if (jsonSchemaDialect != null) 'jsonSchemaDialect': jsonSchemaDialect,
      if (servers != null)
        'servers': servers!.map((server) => server.toMap()).toList(),
      if (paths != null)
        'paths': {
          for (final entry in paths!.entries) entry.key: entry.value.toMap(),
        },
      if (webhooks != null)
        'webhooks': {
          for (final entry in webhooks!.entries) entry.key: entry.value.toMap(),
        },
      if (components != null) 'components': components!.toMap(),
      if (security != null) 'security': security,
      if (tags != null) 'tags': tags!.map((tag) => tag.toMap()).toList(),
      if (externalDocs != null) 'externalDocs': externalDocs!.toMap(),
      ...super.toMap()
    };
  }
}

/// Info object as per OpenAPI 3.1 specification.
class InfoObjectV31 extends InfoObject {
  /// A short summary of the API.
  final String? summary;

  /// Creates an [InfoObjectV31] with the given parameters.
  const InfoObjectV31({
    required super.title,
    required super.version,
    this.summary,
    super.description,
    super.contact,
    super.license,
  });

  /// Creates an [InfoObjectV31] from a map.
  factory InfoObjectV31.fromMap(Map map) {
    if (!map.containsKey('title') ||
        !map.containsKey('version') ||
        map['title'] == null ||
        map['version'] == null) {
      throw Exception(
        'InfoObject must contain title and version fields and they cannot be null. Found: $map',
      );
    }
    return InfoObjectV31(
      title: map['title'],
      version: map['version'],
      summary: map['summary'],
      description: map['description'],
      contact: map['contact'] != null
          ? ContactObject.fromMap(map['contact'])
          : null,
      license: map['license'] != null
          ? LicenseObjectV31.fromMap(map['license'])
          : null,
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {if (summary != null) 'summary': summary, ...super.toMap()};
  }
}

/// License object as per OpenAPI 3.1 specification.
class LicenseObjectV31 extends LicenseObject {
  /// The SPDX license identifier.
  final String? identifier;

  /// Creates a [LicenseObjectV31] with the given parameters.
  const LicenseObjectV31({required super.name, super.url, this.identifier});

  /// Creates a [LicenseObjectV31] from a map.
  factory LicenseObjectV31.fromMap(Map map) {
    if (!map.containsKey('name') || map['name'] == null) {
      throw Exception(
        'LicenseObject must contain name field and it cannot be null. Found: $map',
      );
    }
    return LicenseObjectV31(
      name: map['name'],
      url: map['url'],
      identifier: map['identifier'],
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {...super.toMap(), if (identifier != null) 'identifier': identifier};
  }
}

/// Path item object as per OpenAPI 3.1 specification.
class PathItemObjectV31 extends PathItemObjectV3 {
  /// An alternative server array to service all operations in this path.
  final List<ServerObjectV3>? servers;

  /// Creates a [PathItemObjectV31] with the given parameters.
  PathItemObjectV31({
    required super.operations,
    this.servers,
    super.summary,
    super.description,
    super.parameters,
    super.extensions,
    super.externalDocs,
    super.ref,
  });

  /// Creates a [PathItemObjectV31] from a map.
  factory PathItemObjectV31.fromMap(Map map) {
    final operations = <String, OperationObjectV3>{};
    for (final entry in map.entries) {
      final key = entry.key;
      if ([
        'get',
        'put',
        'post',
        'delete',
        'options',
        'head',
        'patch',
        'trace',
      ].contains(key)) {
        operations[key] = OperationObjectV31.fromMap(entry.value);
      }
    }
    return PathItemObjectV31(
      operations: operations,
      servers: map['servers'] != null
          ? List<ServerObjectV3>.from(
              map['servers'].map((server) => ServerObjectV3.fromMap(server)),
            )
          : null,
      summary: map['summary'],
      description: map['description'],
      externalDocs: map['externalDocs'] != null
          ? ExternalDocumentationObjectV3.fromMap(map['externalDocs'])
          : null,
      parameters: map['parameters'] != null
          ? List<OpenApiParameter>.from(
              map['parameters'].map(
                (param) => param is Map
                    ? ParameterObjectV3.fromMap(param)
                    : ReferenceObject(param['\$ref']),
              ),
            )
          : null,
      extensions: {
        for (final entry in map.entries)
          if (entry.key.startsWith('x-')) entry.key: entry.value,
      },
      ref: map[r'$ref'],
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      if (summary != null) 'summary': summary,
      if (description != null) 'description': description,
      if (externalDocs != null) 'externalDocs': externalDocs!.toMap(),
      if (servers != null)
        'servers': servers!.map((server) => server.toMap()).toList(),
      for (final entry in operations.entries) entry.key: entry.value.toMap(),
      if (parameters != null)
        'parameters': [for (final parameter in parameters!) parameter.toMap()],
      if (extensions != null) ...extensions!,
      if (ref != null) '\$ref': ref,
    };
  }
}

/// Operation object as per OpenAPI 3.1 specification.
class OperationObjectV31 extends OperationObjectV3 {
  /// A map of possible out-of-band callbacks related to the parent operation.
  final Map<String, Object>? callbacks;

  /// Creates an [OperationObjectV31] with the given parameters.
  OperationObjectV31({
    super.servers,
    super.tags,
    super.summary,
    super.description,
    super.externalDocs,
    super.operationId,
    super.parameters,
    super.requestBody,
    super.responses,
    this.callbacks,
    super.deprecated,
    super.security,
    super.extensions,
  }) {
    if (callbacks != null) {
      for (final entry in callbacks!.entries) {
        final value = entry.value;
        if (value is! PathItemObjectV31 && value is! ReferenceObject) {
          throw ArgumentError(
            'Callback values must be either PathItemObjectV31 or ReferenceObject.',
          );
        }
      }
    }
  }

  /// Creates an [OperationObjectV31] from a map.
  factory OperationObjectV31.fromMap(Map map) {
    return OperationObjectV31(
      servers: map['servers'] != null
          ? List<ServerObjectV3>.from(
              map['servers'].map((server) => ServerObjectV3.fromMap(server)),
            )
          : null,
      tags: map['tags'] != null ? List<String>.from(map['tags']) : null,
      summary: map['summary'],
      description: map['description'],
      externalDocs: map['externalDocs'] != null
          ? ExternalDocumentationObjectV3.fromMap(map['externalDocs'])
          : null,
      operationId: map['operationId'],
      parameters: map['parameters'] != null
          ? List<OpenApiParameter>.from(
              map['parameters'].map(
                (param) => param is Map
                    ? ParameterObjectV3.fromMap(param)
                    : ReferenceObject(param['\$ref']),
              ),
            )
          : null,
      requestBody: map['requestBody'] != null
          ? (map['requestBody'] is Map
                ? RequestBodyV3.fromMap(map['requestBody'])
                : ReferenceObject(map['requestBody']['\$ref']))
          : null,
      responses: map['responses'] != null
          ? ResponsesV31(
              map['responses'] is Map
                  ? {
                      for (final entry in (map['responses'] as Map).entries)
                        entry.key: entry.value is Map
                            ? ResponseObjectV3.fromMap(entry.value)
                            : ReferenceObject(entry.value['\$ref']),
                    }
                  : throw Exception(
                      'Responses must be a map. Found: ${map['responses']}',
                    ),
            )
          : null,
      callbacks: map['callbacks'] != null
          ? {
              for (final entry in (map['callbacks'] as Map).entries)
                entry.key: entry.value is Map
                    ? PathItemObjectV31.fromMap(entry.value)
                    : ReferenceObject(entry.value['\$ref']),
            }
          : null,
      deprecated: map['deprecated'],
      security: map['security'] != null
          ? [
              for (final secReq in (map['security'] as List))
                SecurityRequirementsV3(
                  Map<String, List<String>>.from(
                    secReq.map(
                      (key, value) => MapEntry(key, List<String>.from(value)),
                    ),
                  ),
                ),
            ]
          : null,
      extensions: {
        for (final entry in map.entries)
          if (entry.key.startsWith('x-')) entry.key: entry.value,
      },
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
      if (parameters != null)
        'parameters': [for (final parameter in parameters!) parameter.toMap()],
      if (requestBody != null) 'requestBody': requestBody!.toMap(),
      if (responses != null) 'responses': responses!.toMap(),
      if (callbacks != null)
        'callbacks': {
          for (final entry in callbacks!.entries)
            entry.key: entry.value is PathItemObjectV31
                ? (entry.value as PathItemObjectV31).toMap()
                : entry.value,
        },
      if (super.deprecated != null) 'deprecated': super.deprecated,
      if (security != null) 'security': security,
      if (extensions != null) ...extensions!,
    };
  }
}

/// Responses object as per OpenAPI 3.1 specification.
class ResponsesV31 extends ResponsesV3<String> {
  /// Creates a [ResponsesV31] with the given parameters.
  ResponsesV31(super.responses);

  @override
  Map<String, dynamic> toMap() {
    return {
      for (final entry in responses.entries)
        entry.key.toString(): entry.value is ReferenceObject
            ? (entry.value as ReferenceObject).toMap()
            : entry.value is ResponseObjectV3
            ? (entry.value as ResponseObjectV3).toMap()
            : entry.value,
    };
  }
}

/// JSON Schema object as per OpenAPI 3.1 specification.
class SchemaObjectV31 extends SchemaObjectV3 {
  /// The constant value for the schema.
  final Object? $const;

  /// The JSON Schema dialect URL.
  final String? $schema;

  /// Examples of the schema.
  final List<Object>? examples;

  /// The media type for the schema when used in content (e.g., "application/json").
  final String? contentMediaType;

  /// Creates a [SchemaObjectV31] with the given parameters.
  SchemaObjectV31({
    super.title,
    super.description,
    super.defaultValue,
    super.multipleOf,
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
    super.maxProperties,
    super.minProperties,
    super.required,
    super.enumValues,
    super.not,
    super.allOf,
    super.oneOf,
    super.anyOf,
    super.properties,
    super.additionalProperties,
    super.discriminator,
    super.readOnly,
    super.writeOnly,
    super.deprecated,
    super.externalDocs,
    super.xml,
    this.$schema,
    this.examples,
    this.$const,
    this.contentMediaType,
  });

  @override
  Map<String, dynamic> toMap() {
    return {
      ...super.toMap(),
      if ($schema != null) '\$schema': $schema,
      if ($const != null) 'const': $const,
      if (examples != null) 'examples': examples,
      if (contentMediaType != null) 'contentMediaType': contentMediaType,
    };
  }
}
