import 'package:openapi_types/openapi_types.dart';

class PathsWebhooksComponentsV31<T extends Map<String, dynamic>> {
  const PathsWebhooksComponentsV31({this.paths, this.webhooks, this.components})
    : assert(
        paths != null || webhooks != null || components != null,
        'At least one of paths, webhooks or components must be provided.',
      );

  final Map<String, PathItemObjectV31>? paths;
  final Map<String, PathItemObjectV31>? webhooks;
  final ComponentsObjectV31? components;

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

class ComponentsObjectV31 extends ComponentsObjectV3 {
  final Map<String, OpenApiObject>? pathItems;

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

class DocumentV31 extends OpenAPIDocument<Map<String, dynamic>> {
  DocumentV31({
    this.openapi = '3.1.0',
    required this.info,
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

  final String openapi;
  final InfoObject info;
  final String? jsonSchemaDialect;
  final List<ServerObjectV3>? servers;
  final Map<String, PathItemObjectV31>? paths;
  final Map<String, PathItemObjectV31>? webhooks;
  final ComponentsObjectV31? components;
  final List<Map<String, List<String>>>? security;
  final List<TagObjectV3>? tags;
  final ExternalDocumentationObjectV3? externalDocs;

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
      'info': info.toMap(),
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
      if (extensions != null) ...extensions!,
    };
  }
}

class InfoObjectV31 extends InfoObject {
  final String? summary;

  InfoObjectV31({
    required super.title,
    required super.version,
    this.summary,
    super.description,
    super.contact,
    super.license,
  });

  @override
  Map<String, dynamic> toMap() {
    return {if (summary != null) 'summary': summary, ...super.toMap()};
  }
}

class LicenseObjectV31 extends LicenseObject {
  final String? identifier;

  LicenseObjectV31({required super.name, super.url, this.identifier});

  @override
  Map<String, dynamic> toMap() {
    return {...super.toMap(), if (identifier != null) 'identifier': identifier};
  }
}

class PathItemObjectV31 extends PathItemObjectV3 {
  final List<ServerObjectV3>? servers;

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

class OperationObjectV31 extends OperationObjectV3 {
  final Map<String, Object>? callbacks;

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

class BaseSchemaV31 extends BaseSchemaV3 {
  final Object? $const;
  final String? $schema;
  final List<Object>? examples;
  final String? contentMediaType;

  BaseSchemaV31({
    super.format,
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
