import 'package:openapi_types/openapi_types.dart';
import 'package:openapi_types/utils.dart';

class ServerObjectV3 {
  final String url;
  final String? description;
  final Map<String, ServerVariableObjectV3>? variables;

  const ServerObjectV3({required this.url, this.description, this.variables});

  Map<String, dynamic> toMap() {
    return {
      'url': url,
      if (description != null) 'description': description,
      if (variables != null)
        'variables': {
          for (final entry in variables!.entries)
            entry.key: entry.value.toMap(),
        },
    };
  }
}

class ServerVariableObjectV3 {
  final String defaultValue;
  final List<String>? enumValues;
  final String? description;

  const ServerVariableObjectV3({
    required this.defaultValue,
    this.enumValues,
    this.description,
  });

  Map<String, dynamic> toMap() {
    return {
      'default': defaultValue,
      if (enumValues != null) 'enum': enumValues,
      if (description != null) 'description': description,
    };
  }
}

class ExternalDocumentationObjectV3 {
  final String url;
  final String? description;

  const ExternalDocumentationObjectV3({required this.url, this.description});

  Map<String, dynamic> toMap() {
    return {'url': url, if (description != null) 'description': description};
  }
}

class ParameterBaseObjectV3 {
  final String? description;
  final bool? required;
  final bool? deprecated;
  final bool? allowEmptyValue;
  final String? style;
  final bool? explode;
  final bool? allowReserved;
  final Object? schema;
  final Object? example;
  final Map<String, OpenApiObject>? examples;
  final Map<String, MediaTypeObjectV3>? content;

  ParameterBaseObjectV3({
    this.description,
    this.required,
    this.deprecated,
    this.allowEmptyValue,
    this.style,
    this.explode,
    this.allowReserved,
    this.schema,
    this.example,
    this.examples,
    this.content,
  }) {
    for (final example
        in examples?.entries ?? <MapEntry<String, OpenApiObject>>[]) {
      if (example.value is! ExampleObjectV3 &&
          example.value is! ReferenceObject) {
        throw ArgumentError(
          'Example ${example.key} must be of type ExampleObjectV3 or ReferenceObject',
        );
      }
    }
    if (schema.isOpenApiV3Schema) {
      throw ArgumentError(
        'Schema must be of type int, double, String, bool, List, Map, num or ReferenceV3',
      );
    }
  }

  Map<String, dynamic> toMap() {
    return {
      if (description != null) 'description': description,
      if (required != null) 'required': required,
      if (deprecated != null) 'deprecated': deprecated,
      if (allowEmptyValue != null) 'allowEmptyValue': allowEmptyValue,
      if (style != null) 'style': style,
      if (explode != null) 'explode': explode,
      if (allowReserved != null) 'allowReserved': allowReserved,
      if (schema != null)
        'schema': schema is ReferenceObject
            ? (schema as ReferenceObject).toMap()
            : schema is BaseSchemaV3
            ? (schema as BaseSchemaV3).toMap()
            : schema,
      if (example != null) 'example': example,
      if (examples != null)
        'examples': {
          for (final entry in examples!.entries)
            entry.key: entry.value is ReferenceObject
                ? (entry.value as ReferenceObject).toMap()
                : entry.value is ExampleObjectV3
                ? (entry.value as ExampleObjectV3).toMap()
                : entry.value,
        },
      if (content != null)
        'content': {
          for (final entry in content!.entries) entry.key: entry.value.toMap(),
        },
    };
  }
}

class BaseSchemaV3<E extends Object> {
  final String? title;
  final String? description;
  final String? format;
  final Object? defaultValue;
  final num? multipleOf;
  final num? maximum;
  final bool? exclusiveMaximum;
  final num? minimum;
  final bool? exclusiveMinimum;
  final int? maxLength;
  final int? minLength;
  final String? pattern;
  final bool? additionalProperties;
  final int? maxItems;
  final int? minItems;
  final bool? uniqueItems;
  final int? maxProperties;
  final int? minProperties;
  final List<String>? required;
  final List<Object>? enumValues;
  final Map<String, Object>? properties;
  final List<Object>? allOf;
  final List<Object>? oneOf;
  final List<Object>? anyOf;
  final Object? not;
  final bool? nullable;
  final DiscriminatorObjectV3? discriminator;
  final bool? readOnly;
  final bool? writeOnly;
  final XMLObjectV3? xml;
  final ExternalDocumentationObjectV3? externalDocs;
  final Object? example;
  final bool? deprecated;

  BaseSchemaV3({
    this.title,
    this.description,
    this.format,
    this.defaultValue,
    this.multipleOf,
    this.maximum,
    this.exclusiveMaximum,
    this.minimum,
    this.exclusiveMinimum,
    this.maxLength,
    this.minLength,
    this.pattern,
    this.additionalProperties,
    this.maxItems,
    this.minItems,
    this.uniqueItems,
    this.maxProperties,
    this.minProperties,
    this.required,
    this.enumValues,
    this.properties,
    this.allOf,
    this.oneOf,
    this.anyOf,
    this.not,
    this.nullable,
    this.discriminator,
    this.readOnly,
    this.writeOnly,
    this.xml,
    this.externalDocs,
    this.example,
    this.deprecated,
  }) {
    for (final property
        in properties?.entries ?? <MapEntry<String, Object>>[]) {
      if (property.value.isOpenApiV3Schema) {
        throw ArgumentError(
          'Property ${property.key} must be of type BaseSchemaV3 or ReferenceObject',
        );
      }
    }
    for (final schema in allOf ?? <Object>[]) {
      if (schema.isOpenApiV3Schema) {
        throw ArgumentError(
          'AllOf schema must be of type int, double, String, bool, List, Map, num or ReferenceObject',
        );
      }
    }
    for (final schema in oneOf ?? <Object>[]) {
      if (schema.isOpenApiV3Schema) {
        throw ArgumentError(
          'OneOf schema must be of type int, double, String, bool, List, Map, num or ReferenceObject',
        );
      }
    }
    for (final schema in anyOf ?? <Object>[]) {
      if (schema.isOpenApiV3Schema) {
        throw ArgumentError(
          'AnyOf schema must be of type int, double, String, bool, List, Map, num or ReferenceObject',
        );
      }
    }
    if (not.isOpenApiV3Schema) {
      throw ArgumentError(
        'Not schema must be of type int, double, String, bool, List, Map, num or ReferenceObject',
      );
    }
  }

  Map<String, dynamic> toMap() {
    return {
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (format != null) 'format': format,
      if (defaultValue != null) 'default': defaultValue,
      if (multipleOf != null) 'multipleOf': multipleOf,
      if (maximum != null) 'maximum': maximum,
      if (exclusiveMaximum != null) 'exclusiveMaximum': exclusiveMaximum,
      if (minimum != null) 'minimum': minimum,
      if (exclusiveMinimum != null) 'exclusiveMinimum': exclusiveMinimum,
      if (maxLength != null) 'maxLength': maxLength,
      if (minLength != null) 'minLength': minLength,
      if (pattern != null) 'pattern': pattern,
      if (additionalProperties != null)
        'additionalProperties': additionalProperties,
      if (maxItems != null) 'maxItems': maxItems,
      if (minItems != null) 'minItems': minItems,
      if (uniqueItems != null) 'uniqueItems': uniqueItems,
      if (maxProperties != null) 'maxProperties': maxProperties,
      if (minProperties != null) 'minProperties': minProperties,
      if (required != null) 'required': required,
      if (enumValues != null) 'enum': enumValues,
      if (properties != null)
        'properties': {
          for (final entry in properties!.entries)
            entry.key: entry.value is ReferenceObject
                ? (entry.value as ReferenceObject).toMap()
                : entry.value is BaseSchemaV3
                ? (entry.value as BaseSchemaV3).toMap()
                : entry.value,
        },
      if (allOf != null)
        'allOf': [
          for (final schema in allOf!)
            schema is ReferenceObject
                ? schema.toMap()
                : schema is BaseSchemaV3
                ? schema.toMap()
                : schema,
        ],
      if (oneOf != null)
        'oneOf': [
          for (final schema in oneOf!)
            schema is ReferenceObject
                ? schema.toMap()
                : schema is BaseSchemaV3
                ? schema.toMap()
                : schema,
        ],
      if (anyOf != null)
        'anyOf': [
          for (final schema in anyOf!)
            schema is ReferenceObject
                ? schema.toMap()
                : schema is BaseSchemaV3
                ? schema.toMap()
                : schema,
        ],
      if (not != null)
        'not': not is ReferenceObject
            ? (not as ReferenceObject).toMap()
            : not is BaseSchemaV3
            ? (not as BaseSchemaV3).toMap()
            : not,
      if (nullable != null) 'nullable': nullable,
      if (discriminator != null)
        'discriminator': {
          'propertyName': discriminator!.propertyName,
          if (discriminator!.mapping != null) 'mapping': discriminator!.mapping,
        },
      if (readOnly != null) 'readOnly': readOnly,
      if (writeOnly != null) 'writeOnly': writeOnly,
      if (xml != null)
        'xml': {
          if (xml!.name != null) 'name': xml!.name,
          if (xml!.namespace != null) 'namespace': xml!.namespace,
          if (xml!.prefix != null) 'prefix': xml!.prefix,
          if (xml!.attribute != null) 'attribute': xml!.attribute,
          if (xml!.wrapped != null) 'wrapped': xml!.wrapped,
        },
      if (externalDocs != null) 'externalDocs': externalDocs!.toMap(),
      if (example != null) 'example': example,
      if (deprecated != null) 'deprecated': deprecated,
    };
  }
}

class DiscriminatorObjectV3 {
  final String propertyName;
  final Map<String, String>? mapping;

  const DiscriminatorObjectV3({required this.propertyName, this.mapping});

  Map<String, dynamic> toMap() {
    return {
      'propertyName': propertyName,
      if (mapping != null) 'mapping': mapping,
    };
  }
}

class XMLObjectV3 {
  final String? name;
  final String? namespace;
  final String? prefix;
  final bool? attribute;
  final bool? wrapped;

  const XMLObjectV3({
    this.name,
    this.namespace,
    this.prefix,
    this.attribute,
    this.wrapped,
  });

  Map<String, dynamic> toMap() {
    return {
      if (name != null) 'name': name,
      if (namespace != null) 'namespace': namespace,
      if (prefix != null) 'prefix': prefix,
      if (attribute != null) 'attribute': attribute,
      if (wrapped != null) 'wrapped': wrapped,
    };
  }
}

class ParameterObjectV3 extends ParameterBaseObjectV3 {
  final String name;
  final String in_;

  ParameterObjectV3({
    required this.name,
    required this.in_,
    super.description,
    super.required,
    super.deprecated,
    super.allowEmptyValue,
    super.style,
    super.explode,
    super.allowReserved,
    super.schema,
    super.example,
    super.examples,
    super.content,
  });

  @override
  Map<String, dynamic> toMap() {
    return {'name': name, 'in': in_, ...super.toMap()};
  }
}

class HeaderObjectV3 extends ParameterBaseObjectV3 {
  HeaderObjectV3({
    super.description,
    super.required,
    super.deprecated,
    super.allowEmptyValue,
    super.style,
    super.explode,
    super.allowReserved,
    super.schema,
    super.example,
    super.examples,
    super.content,
  });
}

class ExampleObjectV3 extends OpenApiObject<Map<String, dynamic>> {
  final String? summary;
  final String? description;
  final Object? value;
  final String? externalValue;

  const ExampleObjectV3({
    this.summary,
    this.description,
    this.value,
    this.externalValue,
  });

  @override
  Map<String, dynamic> toMap() {
    return {
      if (summary != null) 'summary': summary,
      if (description != null) 'description': description,
      if (value != null) 'value': value,
      if (externalValue != null) 'externalValue': externalValue,
    };
  }
}

class MediaTypeObjectV3 {
  final OpenApiObject? schema;
  final Map<String, OpenApiObject>? examples;
  final Map<String, EncodingObjectV3>? encoding;

  MediaTypeObjectV3({this.schema, this.examples, this.encoding}) {
    for (final example
        in examples?.entries ?? <MapEntry<String, OpenApiObject>>[]) {
      if (example.value is! ExampleObjectV3 &&
          example.value is! ReferenceObject) {
        throw ArgumentError(
          'Example ${example.key} must be of type ExampleObjectV3 or ReferenceObject',
        );
      }
    }
  }

  Map<String, dynamic> toMap() {
    return {
      if (schema != null)
        'schema': schema is ReferenceObject
            ? (schema as ReferenceObject).toMap()
            : schema is BaseSchemaV3
            ? (schema as BaseSchemaV3).toMap()
            : schema,
      if (examples != null)
        'examples': {
          for (final entry in examples!.entries)
            entry.key: entry.value is ReferenceObject
                ? (entry.value as ReferenceObject).toMap()
                : entry.value is ExampleObjectV3
                ? (entry.value as ExampleObjectV3).toMap()
                : entry.value,
        },
      if (encoding != null)
        'encoding': {
          for (final entry in encoding!.entries) entry.key: entry.value.toMap(),
        },
    };
  }
}

class EncodingObjectV3 {
  final String? contentType;
  final Map<String, OpenApiObject>? headers;
  final String? style;
  final bool? explode;
  final bool? allowReserved;

  EncodingObjectV3({
    this.contentType,
    this.headers,
    this.style,
    this.explode,
    this.allowReserved,
  }) {
    for (final header
        in headers?.entries ?? <MapEntry<String, OpenApiObject>>[]) {
      if (header.value is! HeaderObjectV3 && header.value is! ReferenceObject) {
        throw ArgumentError(
          'Header ${header.key} must be of type HeaderObjectV3 or ReferenceObject',
        );
      }
    }
  }

  Map<String, dynamic> toMap() {
    return {
      if (contentType != null) 'contentType': contentType,
      if (headers != null)
        'headers': {
          for (final entry in headers!.entries)
            entry.key: entry.value is ReferenceObject
                ? (entry.value as ReferenceObject).toMap()
                : entry.value is HeaderObjectV3
                ? (entry.value as HeaderObjectV3).toMap()
                : entry.value,
        },
      if (style != null) 'style': style,
      if (explode != null) 'explode': explode,
      if (allowReserved != null) 'allowReserved': allowReserved,
    };
  }
}

class LinkObjectV3 extends OpenApiObject<Map<String, dynamic>> {
  final String? operationRef;
  final String? operationId;
  final Map<String, OpenApiObject>? parameters;
  final Object? requestBody;
  final String? description;
  final ServerObjectV3? server;

  LinkObjectV3({
    this.operationRef,
    this.operationId,
    this.parameters,
    this.requestBody,
    this.description,
    this.server,
    super.extensions,
  });

  @override
  Map<String, dynamic> toMap() {
    return {
      if (operationRef != null) 'operationRef': operationRef,
      if (operationId != null) 'operationId': operationId,
      if (parameters != null)
        'parameters': {
          for (final entry in parameters!.entries)
            entry.key: entry.value.toMap(),
        },
      if (requestBody != null) 'requestBody': requestBody,
      if (description != null) 'description': description,
      if (server != null) 'server': server!.toMap(),
      ...super.toMap(),
    };
  }
}

class ResponsesV3 {
  final Map<int, OpenApiObject> responses;

  ResponsesV3(this.responses) {
    for (final response in responses.entries) {
      if (response.value is! ResponseObjectV3 &&
          response.value is! ReferenceObject) {
        throw ArgumentError(
          'Response ${response.key} must be of type ResponseObjectV3 or ReferenceObject',
        );
      }
      if (response.key < 100 || response.key > 599) {
        throw ArgumentError(
          'Response code ${response.key} must be between 100 and 599',
        );
      }
    }
  }

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

class ResponseObjectV3 extends OpenApiObject<Map<String, dynamic>> {
  final String? description;
  final Map<String, MediaTypeObjectV3>? content;
  final Map<String, OpenApiObject>? headers;
  final Map<String, OpenApiObject>? links;

  ResponseObjectV3({this.description, this.content, this.headers, this.links}) {
    for (final header
        in headers?.entries ?? <MapEntry<String, OpenApiObject>>[]) {
      if (header.value is! HeaderObjectV3 && header.value is! ReferenceObject) {
        throw ArgumentError(
          'Header ${header.key} must be of type HeaderObjectV3 or ReferenceObject',
        );
      }
    }
    for (final link in links?.entries ?? <MapEntry<String, OpenApiObject>>[]) {
      if (link.value is! LinkObjectV3 && link.value is! ReferenceObject) {
        throw ArgumentError(
          'Link ${link.key} must be of type LinkObjectV3 or ReferenceObject',
        );
      }
    }
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      if (description != null) 'description': description,
      if (content != null)
        'content': {
          for (final entry in content!.entries) entry.key: entry.value.toMap(),
        },
      if (headers != null)
        'headers': {
          for (final entry in headers!.entries)
            entry.key: entry.value is ReferenceObject
                ? (entry.value as ReferenceObject).toMap()
                : entry.value is HeaderObjectV3
                ? (entry.value as HeaderObjectV3).toMap()
                : entry.value,
        },
      if (links != null)
        'links': {
          for (final entry in links!.entries)
            entry.key: entry.value is ReferenceObject
                ? (entry.value as ReferenceObject).toMap()
                : entry.value is LinkObjectV3
                ? (entry.value as LinkObjectV3).toMap()
                : entry.value,
        },
    };
  }
}

class RequestBodyV3 extends OpenApiObject<Map<String, dynamic>> {
  final String? description;
  final bool? required;
  final Map<String, MediaTypeObjectV3>? content;

  const RequestBodyV3({
    this.description,
    this.required,
    this.content,
    super.extensions,
  });

  @override
  Map<String, dynamic> toMap() {
    return {
      if (description != null) 'description': description,
      if (required != null) 'required': required,
      if (content != null)
        'content': {
          for (final entry in content!.entries) entry.key: entry.value.toMap(),
        },
      ...super.toMap(),
    };
  }
}

class SecurityRequirementsV3 {
  final Map<String, List<String>> requirements;

  const SecurityRequirementsV3(this.requirements);

  Map<String, dynamic> toMap() {
    return {for (final entry in requirements.entries) entry.key: entry.value};
  }
}

class OperationObjectV3 extends OpenApiOperation<Map<String, dynamic>> {
  final List<String>? tags;
  final String? summary;
  final String? description;
  final ExternalDocumentationObjectV3? externalDocs;
  final String? operationId;
  final List<OpenApiObject>? parameters;
  final OpenApiObject? requestBody;
  final ResponsesV3? responses;
  final bool? deprecated;
  final List<SecurityRequirementsV3>? security;
  final List<ServerObjectV3>? servers;

  OperationObjectV3({
    this.tags,
    this.summary,
    this.description,
    this.externalDocs,
    this.operationId,
    this.parameters,
    this.requestBody,
    this.responses,
    this.deprecated,
    this.security,
    this.servers,
    super.extensions,
  }) {
    for (final parameter in parameters ?? <OpenApiObject>[]) {
      if (parameter is! OpenApiParameter && parameter is! ReferenceObject) {
        throw ArgumentError(
          'Parameter must be of type OpenApiParameter or ReferenceObject',
        );
      }
    }
    if (requestBody != null &&
        requestBody is! RequestBodyV3 &&
        requestBody is! ReferenceObject) {
      throw ArgumentError(
        'Request body must be of type RequestBodyV3 or ReferenceObject',
      );
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
        'parameters': [
          for (final parameter in parameters!)
            parameter is ReferenceObject
                ? (parameter).toMap()
                : parameter is OpenApiParameter
                ? (parameter).toMap()
                : parameter,
        ],
      if (requestBody != null)
        'requestBody': requestBody is ReferenceObject
            ? (requestBody as ReferenceObject).toMap()
            : requestBody is RequestBodyV3
            ? (requestBody as RequestBodyV3).toMap()
            : requestBody,
      if (responses != null) 'responses': responses!.toMap(),
      if (deprecated != null) 'deprecated': deprecated,
      if (security != null)
        'security': [for (final secReq in security!) secReq.toMap()],
      if (servers != null)
        'servers': [for (final server in servers!) server.toMap()],
      ...super.toMap(),
    };
  }
}

class ComponentsObjectV3 {
  final Map<String, OpenApiObject>? schemas;
  final Map<String, OpenApiObject>? responses;
  final Map<String, OpenApiObject>? parameters;
  final Map<String, OpenApiObject>? examples;
  final Map<String, OpenApiObject>? requestBodies;
  final Map<String, OpenApiObject>? headers;
  final Map<String, OpenApiObject>? securitySchemes;
  final Map<String, OpenApiObject>? links;
  final Map<String, OpenApiObject>? callbacks;

  ComponentsObjectV3({
    this.schemas,
    this.responses,
    this.parameters,
    this.examples,
    this.requestBodies,
    this.headers,
    this.securitySchemes,
    this.links,
    this.callbacks,
  }) {
    for (final schema
        in schemas?.entries ?? <MapEntry<String, OpenApiObject>>[]) {
      if (schema.value.isOpenApiV3Schema) {
        throw ArgumentError(
          'Schema ${schema.key} must be of type BaseSchemaV3 or ReferenceObject',
        );
      }
    }
    for (final response
        in responses?.entries ?? <MapEntry<String, OpenApiObject>>[]) {
      if (response.value is! ResponseObjectV3 &&
          response.value is! ReferenceObject) {
        throw ArgumentError(
          'Response ${response.key} must be of type ResponseObjectV3 or ReferenceObject',
        );
      }
    }
    for (final parameter
        in parameters?.entries ?? <MapEntry<String, OpenApiObject>>[]) {
      if (parameter.value is! ParameterObjectV3 &&
          parameter.value is! ReferenceObject) {
        throw ArgumentError(
          'Parameter ${parameter.key} must be of type ParameterObjectV3 or ReferenceObject',
        );
      }
    }
    for (final example
        in examples?.entries ?? <MapEntry<String, OpenApiObject>>[]) {
      if (example.value is! ExampleObjectV3 &&
          example.value is! ReferenceObject) {
        throw ArgumentError(
          'Example ${example.key} must be of type ExampleObjectV3 or ReferenceObject',
        );
      }
    }
    for (final requestBody
        in requestBodies?.entries ?? <MapEntry<String, OpenApiObject>>[]) {
      if (requestBody.value is! RequestBodyV3 &&
          requestBody.value is! ReferenceObject) {
        throw ArgumentError(
          'Request body ${requestBody.key} must be of type RequestBodyV3 or ReferenceObject',
        );
      }
    }
    for (final header
        in headers?.entries ?? <MapEntry<String, OpenApiObject>>[]) {
      if (header.value is! HeaderObjectV3 && header.value is! ReferenceObject) {
        throw ArgumentError(
          'Header ${header.key} must be of type HeaderObjectV3 or ReferenceObject',
        );
      }
    }
    for (final securityScheme
        in securitySchemes?.entries ?? <MapEntry<String, OpenApiObject>>[]) {
      if (securityScheme.value is! SecuritySchemeObjectV3 &&
          securityScheme.value is! ReferenceObject) {
        throw ArgumentError(
          'Security scheme ${securityScheme.key} must be of type SecuritySchemeObjectV3 or ReferenceObject',
        );
      }
    }
  }

  Map<String, dynamic> toMap() {
    return {
      if (schemas != null)
        'schemas': {
          for (final entry in schemas!.entries)
            entry.key: entry.value is ReferenceObject
                ? (entry.value as ReferenceObject).toMap()
                : entry.value is BaseSchemaV3
                ? (entry.value as BaseSchemaV3).toMap()
                : entry.value,
        },
      if (responses != null)
        'responses': {
          for (final entry in responses!.entries)
            entry.key: entry.value is ReferenceObject
                ? (entry.value as ReferenceObject).toMap()
                : entry.value is ResponseObjectV3
                ? (entry.value as ResponseObjectV3).toMap()
                : entry.value,
        },
      if (parameters != null)
        'parameters': {
          for (final entry in parameters!.entries)
            entry.key: entry.value is ReferenceObject
                ? (entry.value as ReferenceObject).toMap()
                : entry.value is ParameterObjectV3
                ? (entry.value as ParameterObjectV3).toMap()
                : entry.value,
        },
      if (examples != null)
        'examples': {
          for (final entry in examples!.entries)
            entry.key: entry.value is ReferenceObject
                ? (entry.value as ReferenceObject).toMap()
                : entry.value is ExampleObjectV3
                ? (entry.value as ExampleObjectV3).toMap()
                : entry.value,
        },
      if (requestBodies != null)
        'requestBodies': {
          for (final entry in requestBodies!.entries)
            entry.key: entry.value is ReferenceObject
                ? (entry.value as ReferenceObject).toMap()
                : entry.value is RequestBodyV3
                ? (entry.value as RequestBodyV3).toMap()
                : entry.value,
        },
      if (headers != null)
        'headers': {
          for (final entry in headers!.entries)
            entry.key: entry.value is ReferenceObject
                ? (entry.value as ReferenceObject).toMap()
                : entry.value is HeaderObjectV3
                ? (entry.value as HeaderObjectV3).toMap()
                : entry.value,
        },
      if (securitySchemes != null)
        'securitySchemes': {
          for (final entry in securitySchemes!.entries)
            entry.key: entry.value is ReferenceObject
                ? (entry.value as ReferenceObject).toMap()
                : entry.value is SecuritySchemeObjectV3
                ? (entry.value as SecuritySchemeObjectV3).toMap()
                : entry.value,
        },
    };
  }
}

sealed class SecuritySchemeObjectV3
    extends OpenApiObject<Map<String, dynamic>> {
  final String type;
  final String? description;

  SecuritySchemeObjectV3({required this.type, this.description});

  @override
  Map<String, dynamic> toMap() {
    return {'type': type, if (description != null) 'description': description};
  }
}

class HttpSecuritySchemeV3 extends SecuritySchemeObjectV3 {
  final String scheme;
  final String? bearerFormat;

  HttpSecuritySchemeV3({
    required this.scheme,
    this.bearerFormat,
    super.description,
  }) : super(type: 'http');

  @override
  Map<String, dynamic> toMap() {
    return {
      ...super.toMap(),
      'scheme': scheme,
      if (bearerFormat != null) 'bearerFormat': bearerFormat,
    };
  }
}

class ApiKeySecuritySchemeV3 extends SecuritySchemeObjectV3 {
  final String name;
  final String in_;

  ApiKeySecuritySchemeV3({
    required this.name,
    required this.in_,
    super.description,
  }) : super(type: 'apiKey');

  @override
  Map<String, dynamic> toMap() {
    return {...super.toMap(), 'name': name, 'in': in_};
  }
}

class OAuth2SecuritySchemeV3 extends SecuritySchemeObjectV3 {
  final List<OAuthFlowObjectV3> flows;

  OAuth2SecuritySchemeV3({required this.flows, super.description})
    : super(type: 'oauth2');

  @override
  Map<String, dynamic> toMap() {
    return {
      ...super.toMap(),
      'flows': {
        for (final flow in flows)
          if (flow is ImplicitOAuthFlowV3)
            'implicit': {
              'authorizationUrl': flow.authorizationUrl,
              if (flow.refreshUrl != null) 'refreshUrl': flow.refreshUrl,
              'scopes': flow.scopes,
            }
          else if (flow is PasswordOAuthFlowV3)
            'password': {
              'tokenUrl': flow.tokenUrl,
              if (flow.refreshUrl != null) 'refreshUrl': flow.refreshUrl,
              'scopes': flow.scopes,
            }
          else if (flow is ClientCredentialsOAuthFlowV3)
            'clientCredentials': {
              'tokenUrl': flow.tokenUrl,
              if (flow.refreshUrl != null) 'refreshUrl': flow.refreshUrl,
              'scopes': flow.scopes,
            }
          else if (flow is AuthorizationCodeOAuthFlowV3)
            'authorizationCode': {
              'authorizationUrl': flow.authorizationUrl,
              'tokenUrl': flow.tokenUrl,
              if (flow.refreshUrl != null) 'refreshUrl': flow.refreshUrl,
              'scopes': flow.scopes,
            },
      },
    };
  }
}

class OpenIdSecuritySchemeV3 extends SecuritySchemeObjectV3 {
  final String openIdConnectUrl;

  OpenIdSecuritySchemeV3({required this.openIdConnectUrl, super.description})
    : super(type: 'openIdConnect');

  @override
  Map<String, dynamic> toMap() {
    return {...super.toMap(), 'openIdConnectUrl': openIdConnectUrl};
  }
}

sealed class OAuthFlowObjectV3 {
  final String? refreshUrl;
  final Map<String, String> scopes;

  OAuthFlowObjectV3({this.refreshUrl, required this.scopes});

  Map<String, dynamic> toMap() {
    return {if (refreshUrl != null) 'refreshUrl': refreshUrl, 'scopes': scopes};
  }
}

class ImplicitOAuthFlowV3 extends OAuthFlowObjectV3 {
  final String authorizationUrl;

  ImplicitOAuthFlowV3({
    required this.authorizationUrl,
    super.refreshUrl,
    required super.scopes,
  });

  @override
  Map<String, dynamic> toMap() {
    return {...super.toMap(), 'authorizationUrl': authorizationUrl};
  }
}

class PasswordOAuthFlowV3 extends OAuthFlowObjectV3 {
  final String tokenUrl;

  PasswordOAuthFlowV3({
    required this.tokenUrl,
    super.refreshUrl,
    required super.scopes,
  });

  @override
  Map<String, dynamic> toMap() {
    return {...super.toMap(), 'tokenUrl': tokenUrl};
  }
}

class ClientCredentialsOAuthFlowV3 extends OAuthFlowObjectV3 {
  final String tokenUrl;

  ClientCredentialsOAuthFlowV3({
    required this.tokenUrl,
    super.refreshUrl,
    required super.scopes,
  });

  @override
  Map<String, dynamic> toMap() {
    return {...super.toMap(), 'tokenUrl': tokenUrl};
  }
}

class AuthorizationCodeOAuthFlowV3 extends OAuthFlowObjectV3 {
  final String authorizationUrl;
  final String tokenUrl;

  AuthorizationCodeOAuthFlowV3({
    required this.authorizationUrl,
    required this.tokenUrl,
    super.refreshUrl,
    required super.scopes,
  });

  @override
  Map<String, dynamic> toMap() {
    return {
      ...super.toMap(),
      'authorizationUrl': authorizationUrl,
      'tokenUrl': tokenUrl,
    };
  }
}

class TagObjectV3 extends OpenApiObject<Map<String, dynamic>> {
  final String name;
  final String? description;
  final ExternalDocumentationObjectV3? externalDocs;

  const TagObjectV3({
    required this.name,
    this.description,
    this.externalDocs,
    super.extensions,
  });

  @override
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      if (description != null) 'description': description,
      if (externalDocs != null) 'externalDocs': externalDocs!.toMap(),
      ...super.toMap(),
    };
  }
}

class PathItemObjectV3 extends OpenApiObject<Map<String, dynamic>> {
  final String? ref;
  final String? summary;
  final String? description;
  final ExternalDocumentationObjectV3? externalDocs;
  final Map<String, OperationObjectV3> operations;
  final List<OpenApiObject>? parameters;

  PathItemObjectV3({
    required this.operations,
    this.ref,
    this.summary,
    this.description,
    this.externalDocs,
    this.parameters,
    super.extensions,
  }) {
    for (final operation in operations.entries) {
      if (![
        'get',
        'put',
        'post',
        'delete',
        'options',
        'head',
        'patch',
        'trace',
      ].contains(operation.key)) {
        throw ArgumentError('Invalid HTTP method: ${operation.key}');
      }
    }
    for (final parameter in parameters ?? <OpenApiObject>[]) {
      if (parameter is! OpenApiParameter && parameter is! ReferenceObject) {
        throw ArgumentError(
          'Parameter must be of type OpenApiParameter or ReferenceObject',
        );
      }
    }
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      if (ref != null) r'$ref': ref,
      if (summary != null) 'summary': summary,
      if (description != null) 'description': description,
      if (externalDocs != null) 'externalDocs': externalDocs!.toMap(),
      for (final entry in operations.entries) entry.key: entry.value.toMap(),
      if (parameters != null)
        'parameters': [
          for (final parameter in parameters!)
            parameter is ReferenceObject
                ? (parameter).toMap()
                : parameter is OpenApiParameter
                ? (parameter).toMap()
                : parameter,
        ],
      ...super.toMap(),
    };
  }
}

class DocumentV3 extends OpenAPIDocument<Map<String, dynamic>> {
  final String openapi;
  final InfoObject info;
  final List<ServerObjectV3>? servers;
  final Map<String, PathItemObjectV3?> paths;
  final ComponentsObjectV3? components;
  final List<SecurityRequirementsV3>? security;
  final List<TagObjectV3>? tags;
  final ExternalDocumentationObjectV3? externalDocs;

  DocumentV3({
    required this.openapi,
    required this.info,
    required this.paths,
    this.servers,
    this.components,
    this.security,
    this.tags,
    this.externalDocs,
    super.extensions,
  }) {
    if (openapi.split('.').length != 3) {
      throw ArgumentError('OpenAPI version must be in the format x.y.z');
    }
  }

  bool get isOpenApi3 => openapi.startsWith('3.');

  @override
  Map<String, dynamic> toMap() {
    return {
      'openapi': openapi,
      'info': info.toMap(),
      if (servers != null)
        'servers': [for (final server in servers!) server.toMap()],
      'paths': {
        for (final entry in paths.entries)
          entry.key: entry.value != null
              ? entry.value is PathItemObjectV3
                    ? (entry.value as PathItemObjectV3).toMap()
                    : entry.value
              : null,
      },
      if (components != null) 'components': components!.toMap(),
      if (security != null)
        'security': [for (final secReq in security!) secReq.toMap()],
      if (tags != null) 'tags': [for (final tag in tags!) tag.toMap()],
      if (externalDocs != null) 'externalDocs': externalDocs!.toMap(),
      ...super.toMap(),
    };
  }
}
