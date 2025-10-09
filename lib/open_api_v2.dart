import 'package:openapi_types/commons.dart';
import 'package:openapi_types/openapi_types.dart';

class DocumentV2<T extends Map<String, dynamic>>
    extends OpenAPIDocument<Map<String, dynamic>> {
  final String? basePath;

  final List<String>? consumes;

  final Map<String, SchemaObjectV2> definitions;

  final ExternalDocumentationObjectV2? externalDocs;

  final String? host;

  final InfoObject info;

  final String swagger;

  final List<String>? schemes;

  final List<String>? produces;

  final List<TagObjectV2>? tags;

  final Map<String, ResponseObjectV2>? responses;

  final Map<String, ParameterObjectV2>? parameters;

  final Map<String, Map<String, List<String>>>? security;

  final Map<String, SecuritySchemeObjectV2>? securityDefinitions;

  final Map<String, PathItemObjectV2> paths;

  DocumentV2({
    this.basePath,
    this.consumes,
    required this.definitions,
    this.externalDocs,
    this.host,
    required this.info,
    required this.swagger,
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

  Map<String, dynamic> toMap() {
    return {
      'swagger': swagger,
      'info': info.toMap(),
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
    };
  }
}

sealed class SecuritySchemeObjectV2 {
  final String type;

  final String? description;

  SecuritySchemeObjectV2({required this.type, this.description});

  Map<String, dynamic> toMap() {
    return {'type': type, if (description != null) 'description': description};
  }
}

class SecuritySchemeBasicV2 extends SecuritySchemeObjectV2 {
  SecuritySchemeBasicV2({super.description}) : super(type: 'basic');
}

class SecuritySchemeApiKeyV2 extends SecuritySchemeObjectV2 {
  final String name;
  final String in_;

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

sealed class SecuritySchemeOAuth2V2 extends SecuritySchemeObjectV2 {
  final String flow;
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
}

class SecuritySchemeOAuth2ImplicitV2 extends SecuritySchemeOAuth2V2 {
  final String authorizationUrl;

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

class SecuritySchemeOAuth2PasswordV2 extends SecuritySchemeOAuth2V2 {
  final String tokenUrl;

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

class SecuritySchemeOAuth2ApplicationV2 extends SecuritySchemeOAuth2V2 {
  final String tokenUrl;
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

class SecuritySchemeOAuth2AccessCodeV2 extends SecuritySchemeOAuth2V2 {
  final String authorizationUrl;
  final String tokenUrl;
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

class PathItemObjectV2 extends OpenApiObject<Map<String, dynamic>> {
  final String? ref;

  final Map<String, ParameterObjectV2>? parameters;

  final Map<String, OperationObjectV2>? operations;

  PathItemObjectV2({this.ref, this.parameters, this.operations});

  @override
  Map<String, dynamic> toMap() {
    return {
      if (ref != null) r'$ref': ref,
      if (parameters != null && parameters!.isNotEmpty)
        'parameters': parameters!.map(
          (key, value) => MapEntry(key, value.toMap()),
        ),
      if (operations != null && operations!.isNotEmpty)
        ...operations!.map((key, value) => MapEntry(key, value.toMap())),
    };
  }
}

class OperationObjectV2 extends OpenApiObject<Map<String, dynamic>> {
  final List<String>? tags;

  final String? summary;

  final String? description;

  final ExternalDocumentationObjectV2? externalDocs;

  final String? operationId;

  final List<ParameterObjectV2>? parameters;

  final Map<String, ResponseObjectV2> responses;

  final List<String>? consumes;

  final List<String>? produces;

  final List<Map<String, List<String>>>? security;

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

class ParameterObjectV2 extends OpenApiObject<Map<String, dynamic>> {
  final String name;

  final String in_;

  final String? description;

  final bool? required;

  const ParameterObjectV2({
    required this.name,
    required this.in_,
    this.description,
    this.required,
    super.extensions,
  });

  @override
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'in': in_,
      if (description != null) 'description': description,
      if (required != null) 'required': required,
      ...super.toMap(),
    };
  }
}

class TagObjectV2 {
  final String name;
  final String? description;
  final ExternalDocumentationObjectV2? externalDocs;

  TagObjectV2({required this.name, this.description, this.externalDocs});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      if (description != null) 'description': description,
      if (externalDocs != null) 'externalDocs': externalDocs!.toMap(),
    };
  }
}

class ResponseObjectV2 {
  final String description;

  final Map<String, HeaderObjectV2>? headers;

  final Map<String, dynamic>? schema;

  final Map<String, dynamic>? examples;

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

class HeaderObjectV2 extends ItemsObjectV2 {
  final String? description;

  HeaderObjectV2({
    this.description,
    required super.type,
    super.format,
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

  @override
  Map<String, dynamic> toMap() {
    return {
      if (description != null) 'description': description,
      'type': type,
      if (format != null) 'format': format,
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

class SchemaObjectV2 extends JsonSchema<Object> {
  final String? discriminator;

  final bool? readOnly;

  final XmlObjectV2? xml;

  final ExternalDocumentationObjectV2? externalDocs;

  final Object? example;

  final Object? defaultValue;

  @override
  // ignore: overridden_fields
  final Map<String, SchemaObjectV2>? properties;

  SchemaObjectV2({
    this.discriminator,
    this.readOnly,
    this.xml,
    this.externalDocs,
    this.example,
    this.defaultValue,
    this.properties,
    super.items,
    super.id,
    super.schema,
    super.title,
    super.description,
    super.multipleOf,
    super.maximum,
    super.exclusiveMaximum,
    super.minimum,
    super.exclusiveMinimum,
    super.maxLength,
    super.minLength,
    super.pattern,
    super.additionalItems,
    super.maxItems,
    super.minItems,
    super.uniqueItems,
    super.maxProperties,
    super.minProperties,
    super.required,
    super.additionalProperties,
    super.definitions,
    super.patternProperties,
    super.dependencies,
    super.enumValues,
    super.type,
    super.allOf,
    super.anyOf,
    super.oneOf,
    super.not,
    super.ref,
  }) {
    if (items != null && items is! ItemsObjectV2 && items is! ReferenceObject) {
      throw ArgumentError(
        'Items must be an ItemsObjectV2 or a ReferenceObject',
      );
    }
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
      if (properties != null)
        'properties': properties!.map((k, v) => MapEntry(k, v.toMap())),
      ...super.toMap(),
    };
  }
}

class ItemsObjectV2 {
  final String type;

  final String? format;

  final Object? items;

  final String? collectionFormat;

  final Object? defaultValue;

  final num? maximum;

  final bool? exclusiveMaximum;

  final num? minimum;

  final bool? exclusiveMinimum;

  final int? maxLength;

  final int? minLength;

  final String? pattern;

  final int? maxItems;

  final int? minItems;

  final bool? uniqueItems;

  final List<Object>? enumValues;

  final num? multipleOf;

  final String? ref;

  ItemsObjectV2({
    required this.type,
    this.format,
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

  Map<String, dynamic> toMap() {
    return {
      'type': type,
      if (format != null) 'format': format,
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

class ExternalDocumentationObjectV2
    extends OpenApiObject<Map<String, dynamic>> {
  final String url;
  final String? description;

  ExternalDocumentationObjectV2({
    required this.url,
    this.description,
    super.extensions,
  });

  @override
  Map<String, dynamic> toMap() {
    return {
      'url': url,
      if (description != null) 'description': description,
      ...super.toMap(),
    };
  }
}

class XmlObjectV2 extends OpenApiObject<Map<String, dynamic>> {
  final String? name;
  final String? namespace;
  final String? prefix;
  final bool? attribute;
  final bool? wrapped;

  XmlObjectV2({
    this.name,
    this.namespace,
    this.prefix,
    this.attribute,
    this.wrapped,
    super.extensions,
  });

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

class JsonSchema<T> {
  final String? id;
  final String? schema;
  final String? title;
  final String? description;
  final num? multipleOf;
  final num? maximum;
  final bool? exclusiveMaximum;
  final num? minimum;
  final bool? exclusiveMinimum;
  final int? maxLength;
  final int? minLength;
  final String? pattern;
  final bool? additionalItems;
  final T? items;
  final int? maxItems;
  final int? minItems;
  final bool? uniqueItems;
  final int? maxProperties;
  final int? minProperties;
  final List<String>? required;
  final bool? additionalProperties;
  final Map<String, JsonSchema>? definitions;
  final Map<String, JsonSchema>? properties;
  final Map<String, JsonSchema>? patternProperties;
  final Map<String, dynamic>? dependencies;
  final List<dynamic>? enumValues;
  final dynamic type;
  final List<JsonSchema>? allOf;
  final List<JsonSchema>? anyOf;
  final List<JsonSchema>? oneOf;
  final JsonSchema? not;
  final String? ref;

  JsonSchema({
    this.id,
    this.schema,
    this.title,
    this.description,
    this.multipleOf,
    this.maximum,
    this.exclusiveMaximum,
    this.minimum,
    this.exclusiveMinimum,
    this.maxLength,
    this.minLength,
    this.pattern,
    this.additionalItems,
    this.items,
    this.maxItems,
    this.minItems,
    this.uniqueItems,
    this.maxProperties,
    this.minProperties,
    this.required,
    this.additionalProperties,
    this.definitions,
    this.properties,
    this.patternProperties,
    this.dependencies,
    this.enumValues,
    this.type,
    this.allOf,
    this.anyOf,
    this.oneOf,
    this.not,
    this.ref,
  }) {
    if (type != null && type is! String && type is! List<String>) {
      throw ArgumentError('Type must be a string or a list of strings');
    }
    if (dependencies != null) {
      for (final entry in dependencies!.entries) {
        if (entry.value is! JsonSchema && entry.value is! List<String>) {
          throw ArgumentError(
            'Dependencies must be a JsonSchema or a list of strings',
          );
        }
      }
    }
  }

  Map<String, dynamic> toMap() {
    final dependenciesList = <String, dynamic>{};
    if (dependencies != null && dependencies!.isNotEmpty) {
      for (final entry in dependencies!.entries) {
        if (entry.value is JsonSchema) {
          dependenciesList[entry.key] = (entry.value as JsonSchema).toMap();
        } else if (entry.value is List<String>) {
          dependenciesList[entry.key] = entry.value;
        }
      }
    }
    return {
      if (type != null) 'type': type,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (multipleOf != null) 'multipleOf': multipleOf,
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
      if (maxProperties != null) 'maxProperties': maxProperties,
      if (minProperties != null) 'minProperties': minProperties,
      if (required != null) 'required': required,
      if (additionalProperties != null)
        'additionalProperties': additionalProperties,
      if (definitions != null && definitions!.isNotEmpty)
        'definitions': definitions!.map(
          (key, value) => MapEntry(key, value.toMap()),
        ),
      if (properties != null && properties!.isNotEmpty)
        'properties': properties!.map(
          (key, value) => MapEntry(key, value.toMap()),
        ),
      if (patternProperties != null && patternProperties!.isNotEmpty)
        'patternProperties': patternProperties!.map(
          (key, value) => MapEntry(key, value.toMap()),
        ),
      if (dependencies != null && dependencies!.isNotEmpty)
        'dependencies': dependenciesList,
      if (enumValues != null) 'enum': enumValues,
      if (items != null)
        'items': items is JsonSchema ? (items as JsonSchema).toMap() : items,
      if (allOf != null) 'allOf': allOf!.map((e) => e.toMap()).toList(),
      if (anyOf != null) 'anyOf': anyOf!.map((e) => e.toMap()).toList(),
      if (oneOf != null) 'oneOf': oneOf!.map((e) => e.toMap()).toList(),
      if (not != null) 'not': not!.toMap(),
      if (ref != null) r'$ref': ref,
      if (id != null) 'id': id,
      if (schema != null) r'$schema': schema,
    };
  }
}
