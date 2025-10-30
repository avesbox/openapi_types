import 'package:openapi_types/openapi_types.dart';
import 'package:openapi_types/utils.dart';

/// Server object representing a server.
class ServerObjectV3 {
  /// The URL of the server.
  final String url;

  /// An optional description of the server.
  final String? description;

  /// A map of server variables for the server.
  final Map<String, ServerVariableObjectV3>? variables;

  /// Creates a [ServerObjectV3] with the given parameters.
  const ServerObjectV3({required this.url, this.description, this.variables});

  /// Creates a [ServerObjectV3] from a map.
  factory ServerObjectV3.fromMap(Map data) {
    return ServerObjectV3(
      url: data['url'],
      description: data['description'],
      variables: data['variables'] != null
          ? (data['variables'] as Map).map(
              (key, value) =>
                  MapEntry(key, ServerVariableObjectV3.fromMap(value)),
            )
          : null,
    );
  }

  /// Converts the [ServerObjectV3] to a map.
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

/// Server variable object representing a server variable for server URL template substitution.
class ServerVariableObjectV3 {
  /// The name of the server variable.
  final String defaultValue;

  /// An optional list of enumeration values for the server variable.
  final List<String>? enumValues;

  /// An optional description of the server variable.
  final String? description;

  /// Creates a [ServerVariableObjectV3] with the given parameters.
  const ServerVariableObjectV3({
    required this.defaultValue,
    this.enumValues,
    this.description,
  });

  /// Creates a [ServerVariableObjectV3] from a map.
  factory ServerVariableObjectV3.fromMap(Map data) {
    return ServerVariableObjectV3(
      defaultValue: data['default'],
      enumValues: data['enum'] != null ? List<String>.from(data['enum']) : null,
      description: data['description'],
    );
  }

  /// Converts the [ServerVariableObjectV3] to a map.
  Map<String, dynamic> toMap() {
    return {
      'default': defaultValue,
      if (enumValues != null) 'enum': enumValues,
      if (description != null) 'description': description,
    };
  }
}

/// External documentation object representing additional external documentation.
class ExternalDocumentationObjectV3 {
  /// The URL of the external documentation.
  final String url;

  /// An optional description of the external documentation.
  final String? description;

  /// Creates an [ExternalDocumentationObjectV3] with the given parameters.
  const ExternalDocumentationObjectV3({required this.url, this.description});

  /// Creates an [ExternalDocumentationObjectV3] from a map.
  factory ExternalDocumentationObjectV3.fromMap(Map data) {
    return ExternalDocumentationObjectV3(
      url: data['url'],
      description: data['description'],
    );
  }

  /// Converts the [ExternalDocumentationObjectV3] to a map.
  Map<String, dynamic> toMap() {
    return {'url': url, if (description != null) 'description': description};
  }
}

/// Media type object representing a media type in a content object.
class ParameterBaseObjectV3 extends OpenApiParameter<Map<String, dynamic>> {
  /// An optional description of the parameter.
  final String? description;

  /// Whether the parameter is required.
  final bool? required;

  /// Whether the parameter is deprecated.
  final bool? deprecated;

  /// Whether the parameter allows empty values.
  final bool? allowEmptyValue;

  /// The style of the parameter.
  final String? style;

  /// Whether the parameter should be exploded.
  final bool? explode;

  /// Whether the parameter allows reserved characters.
  final bool? allowReserved;

  /// The schema defining the type used for the parameter.
  final Object? schema;

  /// An example of the parameter's potential value.
  final Object? example;

  /// Examples of the parameter's potential values.
  final Map<String, OpenApiObject>? examples;

  /// A map of media types to their corresponding media type objects.
  final Map<String, MediaTypeObjectV3>? content;

  /// Creates a [ParameterBaseObjectV3] with the given parameters.
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
    if (schema.isNotOpenApiV3Schema && schema is! SchemaObjectV3) {
      throw ArgumentError(
        'Schema must be of type int, double, String, bool, List, Map, num, ReferenceV3 or SchemaObjectV3',
      );
    }
  }

  @override
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
            : schema is SchemaObjectV3
            ? (schema as SchemaObjectV3).toMap()
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

/// Schema object representing a schema in the OpenAPI specification.
class SchemaObjectV3<E extends Object>
    extends JsonSchema<E> {

  /// Whether the schema allows null values.
  final bool? nullable;

  /// A discriminator object to aid in serialization, deserialization, and validation.
  final DiscriminatorObjectV3? discriminator;

  /// Whether the schema is read-only.
  final bool? readOnly;

  /// Whether the schema is write-only.
  final bool? writeOnly;

  /// An XML object to represent XML metadata for the schema.
  final XMLObjectV3? xml;

  /// External documentation for the schema.
  final ExternalDocumentationObjectV3? externalDocs;

  /// An example of the schema's potential value.
  final Object? example;

  /// Whether the schema is deprecated.
  final bool? deprecated;

  /// Creates a [SchemaObjectV3] with the given parameters.
  SchemaObjectV3({
    super.title,
    super.description,
    super.type,
    super.defaultValue,
    super.multipleOf,
    super.maximum,
    super.exclusiveMaximum,
    super.minimum,
    super.exclusiveMinimum,
    super.maxLength,
    super.minLength,
    super.pattern,
    super.additionalProperties,
    super.maxItems,
    super.minItems,
    super.uniqueItems,
    super.maxProperties,
    super.minProperties,
    super.required,
    super.enumValues,
    super.properties,
    super.allOf,
    super.oneOf,
    super.anyOf,
    super.not,
    this.nullable,
    this.discriminator,
    this.readOnly,
    this.writeOnly,
    this.xml,
    this.externalDocs,
    this.example,
    super.items,
    this.deprecated,
  }) {
    for (final property
        in (properties?.entries ?? <MapEntry<String, JsonSchema>>[])) {
      if (
        property.value is! SchemaObjectV3 &&
        property.value is! ReferenceObject
      ) {
        throw ArgumentError(
          'Property ${property.key} must be of type SchemaObjectV3 or ReferenceObject',
        );
      }
    }
    for (final schema in allOf ?? <Object>[]) {
      if (schema.isNotOpenApiV3Schema) {
        throw ArgumentError(
          'AllOf schema must be of type int, double, String, bool, List, Map, num or ReferenceObject',
        );
      }
    }
    for (final schema in oneOf ?? <Object>[]) {
      if (schema.isNotOpenApiV3Schema) {
        throw ArgumentError(
          'OneOf schema must be of type int, double, String, bool, List, Map, num or ReferenceObject',
        );
      }
    }
    for (final schema in anyOf ?? <Object>[]) {
      if (schema.isNotOpenApiV3Schema) {
        throw ArgumentError(
          'AnyOf schema must be of type int, double, String, bool, List, Map, num or ReferenceObject',
        );
      }
    }
    if (not.isNotOpenApiV3Schema) {
      throw ArgumentError(
        'Not schema must be of type int, double, String, bool, List, Map, num or ReferenceObject',
      );
    }
    if (type == OpenApiType.array() && (items == null)) {
      throw ArgumentError(
        'Items must be provided and non-empty when type is array',
      );
    }
  }

  /// Creates a [SchemaObjectV3] from a map.
  factory SchemaObjectV3.fromMap(Map data) {
    return SchemaObjectV3(
      title: data['title'],
      description: data['description'],
      type: data['type'] != null
          ? OpenApiType.custom(data['type'], data['format'])
          : null,
      defaultValue: data['default'],
      multipleOf: data['multipleOf'],
      maximum: data['maximum'],
      exclusiveMaximum: data['exclusiveMaximum'],
      minimum: data['minimum'],
      exclusiveMinimum: data['exclusiveMinimum'],
      maxLength: data['maxLength'],
      minLength: data['minLength'],
      pattern: data['pattern'],
      additionalProperties: data['additionalProperties'],
      maxItems: data['maxItems'],
      minItems: data['minItems'],
      uniqueItems: data['uniqueItems'],
      maxProperties: data['maxProperties'],
      minProperties: data['minProperties'],
      required: data['required'] != null
          ? List<String>.from(data['required'])
          : null,
      enumValues: data['enum'] != null ? List<Object>.from(data['enum']) : null,
      properties: data['properties'] != null
          ? (data['properties'] as Map).map(
              (key, value) => MapEntry(
                key,
                value is Map
                    ? SchemaObjectV3.fromMap(value)
                    : value is String
                    ? ReferenceObject(value)
                    : throw ArgumentError(
                        'Property must be of type Map or String',
                      ),
              ),
            )
          : null,
      allOf: data['allOf'] != null
          ? List<JsonSchema>.from(
              data['allOf'].map(
                (item) => item is Map
                    ? SchemaObjectV3.fromMap(item)
                    : item is String
                    ? ReferenceObject(item)
                    : throw ArgumentError(
                        'AllOf schema must be of type Map or String',
                      ),
              ),
            )
          : null,
      oneOf: data['oneOf'] != null
          ? List<JsonSchema>.from(
              data['oneOf'].map(
                (item) => item is Map
                    ? SchemaObjectV3.fromMap(item)
                    : item is String
                    ? ReferenceObject(item)
                    : throw ArgumentError(
                        'OneOf schema must be of type Map or String',
                      ),
              ),
            )
          : null,
      anyOf: data['anyOf'] != null
          ? List<JsonSchema>.from(
              data['anyOf'].map(
                (item) => item is Map
                    ? SchemaObjectV3.fromMap(item)
                    : item is String
                    ? ReferenceObject(item)
                    : throw ArgumentError(
                        'AnyOf schema must be of type Map or String',
                      ),
              ),
            )
          : null,
      not: data['not'] != null
          ? data['not'] is Map
                ? SchemaObjectV3.fromMap(data['not'])
                : data['not'] is String
                ? ReferenceObject(data['not'])
                : throw ArgumentError(
                    'Not schema must be of type Map or String',
                  )
          : null,
      nullable: data['nullable'],
      discriminator: data['discriminator'] != null
          ? DiscriminatorObjectV3(
              propertyName: data['discriminator']['propertyName'],
              mapping: data['discriminator']['mapping'] != null
                  ? Map<String, String>.from(data['discriminator']['mapping'])
                  : null,
            )
          : null,
      readOnly: data['readOnly'],
      writeOnly: data['writeOnly'],
      xml: data['xml'] != null
          ? XMLObjectV3(
              name: data['xml']['name'],
              namespace: data['xml']['namespace'],
              prefix: data['xml']['prefix'],
              attribute: data['xml']['attribute'],
              wrapped: data['xml']['wrapped'],
            )
          : null,
      externalDocs: data['externalDocs'] != null
          ? ExternalDocumentationObjectV3(
              url: data['externalDocs']['url'],
              description: data['externalDocs']['description'],
            )
          : null,
      example: data['example'],
      deprecated: data['deprecated'],
      items: data['items'] != null
          ? data['items'] != null && data['items']['\$ref'] != null
                ? ReferenceObject(data['items']['\$ref'])
                : SchemaObjectV3.fromMap(data['items'])
          : null,
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      if (title != null) 'title': title,
      if (type != null) ...type!.toMap(),
      if (description != null) 'description': description,
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
      if (type?.type == 'array' && items != null)
        'items': items is ReferenceObject
            ? (items as ReferenceObject).toMap()
            : items is SchemaObjectV3
            ? (items as SchemaObjectV3).toMap()
            : items,
      if (properties != null)
        'properties': {
          for (final entry in properties!.entries)
            entry.key: entry.value is ReferenceObject
                ? (entry.value as ReferenceObject).toMap()
                : entry.value is SchemaObjectV3
                ? (entry.value as SchemaObjectV3).toMap()
                : entry.value,
        },
      if (allOf != null)
        'allOf': [
          for (final schema in allOf!)
            schema is ReferenceObject
                ? schema.toMap()
                : schema is SchemaObjectV3
                ? schema.toMap()
                : schema,
        ],
      if (oneOf != null)
        'oneOf': [
          for (final schema in oneOf!)
            schema is ReferenceObject
                ? schema.toMap()
                : schema is SchemaObjectV3
                ? schema.toMap()
                : schema,
        ],
      if (anyOf != null)
        'anyOf': [
          for (final schema in anyOf!)
            schema is ReferenceObject
                ? schema.toMap()
                : schema is SchemaObjectV3
                ? schema.toMap()
                : schema,
        ],
      if (not != null)
        'not': not is ReferenceObject
            ? (not as ReferenceObject).toMap()
            : not is SchemaObjectV3
            ? (not as SchemaObjectV3).toMap()
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

/// Discriminator object to aid in serialization, deserialization, and validation.
class DiscriminatorObjectV3 {
  /// The name of the property that will be used as the discriminator.
  final String propertyName;

  /// An optional mapping between the discriminator value and the schema it
  final Map<String, String>? mapping;

  /// Creates a [DiscriminatorObjectV3] with the given parameters.
  const DiscriminatorObjectV3({required this.propertyName, this.mapping});

  /// Converts the [DiscriminatorObjectV3] to a map.
  Map<String, dynamic> toMap() {
    return {
      'propertyName': propertyName,
      if (mapping != null) 'mapping': mapping,
    };
  }
}

/// XML object to represent XML metadata for a schema.
class XMLObjectV3 {
  /// The name of the XML element or attribute.
  final String? name;

  /// The namespace of the XML element or attribute.
  final String? namespace;

  /// The prefix to be used for the XML element or attribute.
  final String? prefix;

  /// Indicates whether the XML element is an attribute.
  final bool? attribute;

  /// Indicates whether the XML element is wrapped in a container element.
  final bool? wrapped;

  /// Creates an [XMLObjectV3] with the given parameters.
  const XMLObjectV3({
    this.name,
    this.namespace,
    this.prefix,
    this.attribute,
    this.wrapped,
  });

  /// Converts the [XMLObjectV3] to a map.
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

/// Parameter object representing a parameter in an operation.
class ParameterObjectV3 extends ParameterBaseObjectV3 {
  /// The name of the parameter.
  final String name;

  /// The location of the parameter.
  final String in_;

  /// Creates a [ParameterObjectV3] with the given parameters.
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

  /// Creates a [ParameterObjectV3] from a map.
  factory ParameterObjectV3.fromMap(Map map) {
    return ParameterObjectV3(
      name: map['name'],
      in_: map['in'],
      required: map['required'],
      description: map['description'],
      deprecated: map['deprecated'],
      allowEmptyValue: map['allowEmptyValue'],
      style: map['style'],
      explode: map['explode'],
      allowReserved: map['allowReserved'],
      schema: map['schema'] ?? {},
      example: map['example'],
      examples: map['examples'],
      content: map['content'],
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {'name': name, 'in': in_, ...super.toMap()};
  }
}

/// Header object representing a header in a response.
class HeaderObjectV3 extends ParameterBaseObjectV3 {
  /// Creates a [HeaderObjectV3] with the given parameters.
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

  /// Creates a [HeaderObjectV3] from a map.
  factory HeaderObjectV3.fromMap(Map map) {
    return HeaderObjectV3(
      description: map['description'],
      required: map['required'],
      deprecated: map['deprecated'],
      allowEmptyValue: map['allowEmptyValue'],
      style: map['style'],
      explode: map['explode'],
      allowReserved: map['allowReserved'],
      schema: map['schema'] ?? {},
      example: map['example'],
      examples: map['examples'],
      content: map['content'],
    );
  }
}

/// Example object representing an example in a media type or parameter.
class ExampleObjectV3 extends OpenApiObject<Map<String, dynamic>> {
  /// The summary of the example.
  final String? summary;

  /// The description of the example.
  final String? description;

  /// The value of the example.
  final Object? value;

  /// A URL that points to the example.
  final String? externalValue;

  /// Creates an [ExampleObjectV3] with the given parameters.
  const ExampleObjectV3({
    this.summary,
    this.description,
    this.value,
    this.externalValue,
  });

  /// Creates an [ExampleObjectV3] from a map.
  factory ExampleObjectV3.fromMap(Map data) {
    return ExampleObjectV3(
      summary: data['summary'],
      description: data['description'],
      value: data['value'],
      externalValue: data['externalValue'],
    );
  }

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

/// Media type object representing a media type in a request or response.
class MediaTypeObjectV3 {
  /// The schema defining the type used for the media type.
  final OpenApiObject? schema;

  /// Examples of the media type.
  final Map<String, OpenApiObject>? examples;

  /// A map of encoding objects for the media type.
  final Map<String, EncodingObjectV3>? encoding;

  /// Creates a [MediaTypeObjectV3] with the given parameters.
  MediaTypeObjectV3({this.schema, this.examples, this.encoding}) {
    for (final example
        in examples?.entries ?? <MapEntry<String, OpenApiObject>>[]) {
      if (example.value is! ExampleObjectV3 &&
          example.value is! ReferenceObject) {
        throw ArgumentError(
          'Example ${example.key} must be of type ExampleObjectV3 or ReferenceObject',
        );
      }
      if( schema != null && schema is! SchemaObjectV3 && schema is! ReferenceObject) {
        throw ArgumentError(
          'Schema must be of type SchemaObjectV3 or ReferenceObject',
        );
      }
    }
  }

  /// Creates a [MediaTypeObjectV3] from a map.
  factory MediaTypeObjectV3.fromMap(Map data) {
    final schema = data['schema'] != null
        ? data['schema'] is Map && data['schema'].containsKey('\$ref')
              ? ReferenceObject(data['schema']['\$ref'])
              : SchemaObjectV3.fromMap(data['schema'])
        : null;
    return MediaTypeObjectV3(
      schema: schema,
      examples: data['examples'] != null
          ? (data['examples'] as Map).map(
              (key, value) => MapEntry(
                key,
                value is Map
                    ? ExampleObjectV3.fromMap(value)
                    : value is String
                    ? ReferenceObject(value)
                    : throw ArgumentError(
                        'Example must be of type Map or String',
                      ),
              ),
            )
          : null,
      encoding: data['encoding'] != null
          ? (data['encoding'] as Map).map(
              (key, value) =>
                  MapEntry(key, EncodingObjectV3.fromMap(data['encoding'])),
            )
          : null,
    );
  }

  /// Converts the [MediaTypeObjectV3] to a map.
  Map<String, dynamic> toMap() {
    return {
      if (schema != null)
        'schema': schema is ReferenceObject
            ? (schema as ReferenceObject).toMap()
            : schema is SchemaObjectV3
            ? (schema as SchemaObjectV3).toMap()
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

/// Encoding object representing encoding information for a media type.
class EncodingObjectV3 {
  /// The content type of the encoding.
  final String? contentType;

  /// A map of headers for the encoding.
  final Map<String, OpenApiObject>? headers;

  /// The style of the encoding.
  final String? style;

  /// Whether the encoding is exploded.
  final bool? explode;

  /// Whether reserved characters are allowed in the encoding.
  final bool? allowReserved;

  /// Creates an [EncodingObjectV3] with the given parameters.
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

  /// Creates an [EncodingObjectV3] from a map.
  factory EncodingObjectV3.fromMap(Map data) {
    return EncodingObjectV3(
      contentType: data['contentType'],
      style: data['style'],
      explode: data['explode'],
      allowReserved: data['allowReserved'],
      headers: data['headers'] != null
          ? (data['headers'] as Map).map(
              (key, value) => MapEntry(
                key,
                value is Map
                    ? HeaderObjectV3.fromMap(value)
                    : value is String
                    ? ReferenceObject(value)
                    : throw ArgumentError(
                        'Header must be of type Map or String',
                      ),
              ),
            )
          : null,
    );
  }

  /// Converts the [EncodingObjectV3] to a map.
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

/// Link object representing a link in a response.
class LinkObjectV3 extends OpenApiObject<Map<String, dynamic>> {
  /// A reference to an operation in the OpenAPI document.
  final String? operationRef;

  /// The ID of an operation in the OpenAPI document.
  final String? operationId;

  /// A map of parameters for the link.
  final Map<String, OpenApiObject>? parameters;

  /// A request body for the link.
  final Object? requestBody;

  /// A description of the link.
  final String? description;

  /// A server object for the link.
  final ServerObjectV3? server;

  /// Creates a [LinkObjectV3] with the given parameters.
  LinkObjectV3({
    this.operationRef,
    this.operationId,
    this.parameters,
    this.requestBody,
    this.description,
    this.server,
    super.extensions,
  });

  /// Creates a [LinkObjectV3] from a map.
  factory LinkObjectV3.fromMap(Map data) {
    return LinkObjectV3(
      operationRef: data['operationRef'],
      operationId: data['operationId'],
      parameters: data['parameters'] != null
          ? (data['parameters'] as Map).map(
              (key, value) => MapEntry(
                key,
                value is Map
                    ? SchemaObjectV3.fromMap(value)
                    : value is String
                    ? ReferenceObject(value)
                    : throw ArgumentError(
                        'Parameter must be of type Map or String',
                      ),
              ),
            )
          : null,
      requestBody: data['requestBody'],
      description: data['description'],
      server: data['server'] != null
          ? ServerObjectV3.fromMap(data['server'])
          : null,
    );
  }

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

/// Responses object representing the responses of an operation.
class ResponsesV3<T> {
  /// A map of response codes to response objects.
  Map<T, OpenApiObject> responses;

  /// Creates a [ResponsesV3] with the given responses.
  ResponsesV3(this.responses) {
    for (final response in responses.entries) {
      if (response.value is! ResponseObjectV3 &&
          response.value is! ReferenceObject) {
        throw ArgumentError(
          'Response ${response.key} must be of type ResponseObjectV3 or ReferenceObject',
        );
      }
      if (T == int &&
          (response.key as int < 100 || response.key as int > 599)) {
        throw ArgumentError(
          'Response code ${response.key} must be between 100 and 599',
        );
      }
    }
  }

  operator [](T key) => responses[key];

  operator []=(T key, OpenApiObject value) {
    if (value is! ResponseObjectV3 && value is! ReferenceObject) {
      throw ArgumentError(
        'Response $key must be of type ResponseObjectV3 or ReferenceObject',
      );
    }
    if (T == int && (key as int < 100 || key as int > 599)) {
      throw ArgumentError('Response code $key must be between 100 and 599');
    }
    responses[key] = value;
  }

  /// Converts the [ResponsesV3] to a map.
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

/// Response object representing a response in an operation.
class ResponseObjectV3 extends OpenApiObject<Map<String, dynamic>> {
  /// A description of the response.
  String? description;

  /// A map of media types to media type objects.
  Map<String, MediaTypeObjectV3>? content;

  /// A map of headers for the response.
  Map<String, OpenApiObject>? headers;

  /// A map of links for the response.
  Map<String, OpenApiObject>? links;

  /// Creates a [ResponseObjectV3] with the given parameters.
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

  /// Creates a [ResponseObjectV3] from a map.
  factory ResponseObjectV3.fromMap(Map data) {
    return ResponseObjectV3(
      description: data['description'],
      content: data['content'] != null
          ? (data['content'] as Map).map(
              (key, value) => MapEntry(key, MediaTypeObjectV3.fromMap(value)),
            )
          : null,
      headers: data['headers'] != null
          ? (data['headers'] as Map).map(
              (key, value) => MapEntry(
                key,
                value is Map
                    ? HeaderObjectV3.fromMap(value)
                    : value is String
                    ? ReferenceObject(value)
                    : throw ArgumentError(
                        'Header must be of type Map or String',
                      ),
              ),
            )
          : null,
      links: data['links'] != null
          ? (data['links'] as Map).map(
              (key, value) => MapEntry(
                key,
                value is Map
                    ? LinkObjectV3.fromMap(value)
                    : value is String
                    ? ReferenceObject(value)
                    : throw ArgumentError('Link must be of type Map or String'),
              ),
            )
          : null,
    );
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

/// Request body object representing a request body in an operation.
class RequestBodyV3 extends OpenApiObject<Map<String, dynamic>> {
  /// A description of the request body.
  final String? description;

  /// Whether the request body is required.
  final bool? required;

  /// A map of media types to media type objects.
  final Map<String, MediaTypeObjectV3>? content;

  /// Creates a [RequestBodyV3] with the given parameters.
  const RequestBodyV3({
    this.description,
    this.required,
    this.content,
    super.extensions,
  });

  /// Creates a [RequestBodyV3] from a map.
  factory RequestBodyV3.fromMap(Map data) {
    return RequestBodyV3(
      description: data['description'],
      required: data['required'],
      content: data['content'] != null
          ? (data['content'] as Map).map(
              (key, value) => MapEntry(key, MediaTypeObjectV3.fromMap(value)),
            )
          : null,
    );
  }

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

/// Security requirements object representing security requirements for an operation.
class SecurityRequirementsV3 {
  /// A map of security scheme names to lists of scopes.
  final Map<String, List<String>> requirements;

  /// Creates a [SecurityRequirementsV3] with the given requirements.
  const SecurityRequirementsV3(this.requirements);

  /// Converts the [SecurityRequirementsV3] to a map.
  Map<String, dynamic> toMap() {
    return {for (final entry in requirements.entries) entry.key: entry.value};
  }
}

/// Operation object representing an operation in a path.
class OperationObjectV3 extends OpenApiOperation<Map<String, dynamic>> {
  /// A list of tags for API documentation control.
  final List<String>? tags;

  /// A short summary of the operation.
  final String? summary;

  /// A verbose explanation of the operation behavior.
  final String? description;

  /// Additional external documentation for the operation.
  final ExternalDocumentationObjectV3? externalDocs;

  /// A unique identifier for the operation.
  final String? operationId;

  /// A list of parameters for the operation.
  final List<OpenApiObject>? parameters;

  /// The request body for the operation.
  final OpenApiObject? requestBody;

  /// The responses for the operation.
  final ResponsesV3? responses;

  /// Indicates whether the operation is deprecated.
  final bool? deprecated;

  /// A list of security requirements for the operation.
  final List<SecurityRequirementsV3>? security;

  /// A list of servers for the operation.
  final List<ServerObjectV3>? servers;

  /// Creates an [OperationObjectV3] with the given parameters.
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

  /// Creates an [OperationObjectV3] from a map.
  factory OperationObjectV3.fromMap(Map map) {
    return OperationObjectV3(
      tags: map['tags'] != null ? List<String>.from(map['tags']) : null,
      summary: map['summary'],
      description: map['description'],
      responses: map['responses'] != null
          ? ResponsesV3(
              (map['responses'] as Map).map(
                (key, value) => MapEntry(
                  key is int
                      ? key
                      : int.tryParse(key) ??
                            (throw ArgumentError(
                              'Response code must be an integer',
                            )),
                  value is Map
                      ? ResponseObjectV3.fromMap(value)
                      : value is String
                      ? ReferenceObject(value)
                      : throw ArgumentError(
                          'Response must be of type Map or String',
                        ),
                ),
              ),
            )
          : null,
      requestBody: map['requestBody'] != null
          ? map['requestBody'] is Map && map['requestBody'].containsKey('\$ref')
                ? ReferenceObject(map['requestBody']['\$ref'])
                : RequestBodyV3.fromMap(map['requestBody'])
          : null,
      externalDocs: map['externalDocs'] != null
          ? ExternalDocumentationObjectV3.fromMap(map['externalDocs'])
          : null,
      operationId: map['operationId'],
      parameters: map['parameters'] != null
          ? List<OpenApiObject>.from(
              map['parameters'].map(
                (item) => item is Map
                    ? item.containsKey('\$ref')
                          ? ReferenceObject(item['\$ref'])
                          : ParameterObjectV3.fromMap(item)
                    : item is String
                    ? ReferenceObject(item)
                    : throw ArgumentError(
                        'Parameter must be of type Map or String',
                      ),
              ),
            )
          : null,
      deprecated: map['deprecated'],
      security: map['security'] != null
          ? List<SecurityRequirementsV3>.from(
              map['security'].map(
                (item) => item is Map
                    ? SecurityRequirementsV3(
                        (item).map(
                          (key, value) => MapEntry(
                            key,
                            value is List
                                ? List<String>.from(value)
                                : throw ArgumentError(
                                    'Security requirement value must be a list of strings',
                                  ),
                          ),
                        ),
                      )
                    : throw ArgumentError(
                        'Security requirement must be of type Map',
                      ),
              ),
            )
          : null,
      servers: map['servers'] != null
          ? List<ServerObjectV3>.from(
              map['servers'].map((item) => ServerObjectV3.fromMap(item)),
            )
          : null,
      extensions: Map<String, dynamic>.from(map)
        ..removeWhere((key, value) => !key.startsWith('x-')),
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

/// Components object to hold reusable components for the OpenAPI document.
class ComponentsObjectV3 {
  /// A map of schema names to schema objects.
  final Map<String, OpenApiObject>? schemas;

  /// A map of response names to response objects.
  final Map<String, OpenApiObject>? responses;

  /// A map of parameter names to parameter objects.
  final Map<String, OpenApiObject>? parameters;

  /// A map of example names to example objects.
  final Map<String, OpenApiObject>? examples;

  /// A map of request body names to request body objects.
  final Map<String, OpenApiObject>? requestBodies;

  /// A map of header names to header objects.
  final Map<String, OpenApiObject>? headers;

  /// A map of security scheme names to security scheme objects.
  final Map<String, OpenApiObject>? securitySchemes;

  /// A map of link names to link objects.
  final Map<String, OpenApiObject>? links;

  /// A map of callback names to callback objects.
  final Map<String, OpenApiObject>? callbacks;

  /// Creates a [ComponentsObjectV3] with the given parameters.
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
      if (schema.value.isNotOpenApiV3Schema &&
          schema.value is! SchemaObjectV3) {
        throw ArgumentError(
          'Schema ${schema.key} must be of type SchemaObjectV3 or ReferenceObject',
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

  /// Creates a [ComponentsObjectV3] from a map.
  factory ComponentsObjectV3.fromMap(Map data) {
    return ComponentsObjectV3(
      schemas: data['schemas'] != null
          ? (data['schemas'] as Map).map(
              (key, value) => MapEntry(
                key,
                value is Map
                    ? SchemaObjectV3.fromMap(value)
                    : value is String
                    ? ReferenceObject(value)
                    : throw ArgumentError(
                        'Schema must be of type Map or String',
                      ),
              ),
            )
          : null,
      responses: data['responses'] != null
          ? (data['responses'] as Map).map(
              (key, value) => MapEntry(
                key,
                value is Map
                    ? ResponseObjectV3.fromMap(value)
                    : value is String
                    ? ReferenceObject(value)
                    : throw ArgumentError(
                        'Response must be of type Map or String',
                      ),
              ),
            )
          : null,
      parameters: data['parameters'] != null
          ? (data['parameters'] as Map).map(
              (key, value) => MapEntry(
                key,
                value is Map
                    ? ParameterObjectV3.fromMap(value)
                    : value is String
                    ? ReferenceObject(value)
                    : throw ArgumentError(
                        'Parameter must be of type Map or String',
                      ),
              ),
            )
          : null,
      examples: data['examples'] != null
          ? (data['examples'] as Map).map(
              (key, value) => MapEntry(
                key,
                value is Map
                    ? ExampleObjectV3.fromMap(value)
                    : value is String
                    ? ReferenceObject(value)
                    : throw ArgumentError(
                        'Example must be of type Map or String',
                      ),
              ),
            )
          : null,
      requestBodies: data['requestBodies'] != null
          ? (data['requestBodies'] as Map).map(
              (key, value) => MapEntry(
                key,
                value is Map
                    ? RequestBodyV3.fromMap(value)
                    : value is String
                    ? ReferenceObject(value)
                    : throw ArgumentError(
                        'Request body must be of type Map or String',
                      ),
              ),
            )
          : null,
      headers: data['headers'] != null
          ? (data['headers'] as Map).map(
              (key, value) => MapEntry(
                key,
                value is Map
                    ? HeaderObjectV3.fromMap(value)
                    : value is String
                    ? ReferenceObject(value)
                    : throw ArgumentError(
                        'Header must be of type Map or String',
                      ),
              ),
            )
          : null,
      securitySchemes: data['securitySchemes'] != null
          ? (data['securitySchemes'] as Map).map(
              (key, value) => MapEntry(
                key,
                value is Map
                    ? SecuritySchemeObjectV3.fromMap(value)
                    : value is String
                    ? ReferenceObject(value)
                    : throw ArgumentError(
                        'Security scheme must be of type Map or String',
                      ),
              ),
            )
          : null,
    );
  }

  /// Converts the [ComponentsObjectV3] to a map.
  Map<String, dynamic> toMap() {
    return {
      if (schemas != null)
        'schemas': {
          for (final entry in schemas!.entries)
            entry.key: entry.value is ReferenceObject
                ? (entry.value as ReferenceObject).toMap()
                : entry.value is SchemaObjectV3
                ? (entry.value as SchemaObjectV3).toMap()
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

/// Security scheme object representing a security scheme in the OpenAPI document.
sealed class SecuritySchemeObjectV3
    extends OpenApiObject<Map<String, dynamic>> {
  /// The type of the security scheme.
  final String type;

  /// A description of the security scheme.
  final String? description;

  /// Creates a [SecuritySchemeObjectV3] with the given parameters.
  SecuritySchemeObjectV3({required this.type, this.description});

  /// Creates a [SecuritySchemeObjectV3] from a map.
  factory SecuritySchemeObjectV3.fromMap(Map data) {
    switch (data['type']) {
      case 'http':
        return HttpSecuritySchemeV3.fromMap(data);
      case 'apiKey':
        return ApiKeySecuritySchemeV3.fromMap(data);
      case 'oauth2':
        final flowsData = data['flows'] as Map<String, dynamic>;
        final flows = <OAuthFlowObjectV3>[];
        if (flowsData.containsKey('implicit')) {
          final implicit = flowsData['implicit'] as Map<String, dynamic>;
          flows.add(ImplicitOAuthFlowV3.fromMap(implicit));
        }
        if (flowsData.containsKey('password')) {
          final password = flowsData['password'] as Map<String, dynamic>;
          flows.add(PasswordOAuthFlowV3.fromMap(password));
        }
        if (flowsData.containsKey('clientCredentials')) {
          final clientCredentials =
              flowsData['clientCredentials'] as Map<String, dynamic>;
          flows.add(ClientCredentialsOAuthFlowV3.fromMap(clientCredentials));
        }
        if (flowsData.containsKey('authorizationCode')) {
          final authorizationCode =
              flowsData['authorizationCode'] as Map<String, dynamic>;
          flows.add(AuthorizationCodeOAuthFlowV3.fromMap(authorizationCode));
        }
        return OAuth2SecuritySchemeV3(
          flows: flows,
          description: data['description'],
        );
      case 'openIdConnect':
        return OpenIdSecuritySchemeV3.fromMap(data);
      default:
        throw ArgumentError(
          'Unsupported security scheme type: ${data['type']}',
        );
    }
  }

  @override
  Map<String, dynamic> toMap() {
    return {'type': type, if (description != null) 'description': description};
  }
}

/// HTTP security scheme representing an HTTP authentication scheme.
class HttpSecuritySchemeV3 extends SecuritySchemeObjectV3 {
  /// The name of the HTTP authentication scheme.
  final String scheme;

  /// A hint to the client to identify how the bearer token is formatted.
  final String? bearerFormat;

  /// Creates a [HttpSecuritySchemeV3] with the given parameters.
  HttpSecuritySchemeV3({
    required this.scheme,
    this.bearerFormat,
    super.description,
  }) : super(type: 'http');

  /// Creates a [HttpSecuritySchemeV3] from a map.
  factory HttpSecuritySchemeV3.fromMap(Map data) {
    return HttpSecuritySchemeV3(
      scheme: data['scheme'],
      bearerFormat: data['bearerFormat'],
      description: data['description'],
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      ...super.toMap(),
      'scheme': scheme,
      if (bearerFormat != null) 'bearerFormat': bearerFormat,
    };
  }
}

/// API key security scheme representing an API key authentication scheme.
class ApiKeySecuritySchemeV3 extends SecuritySchemeObjectV3 {
  /// The name of the API key.
  final String name;

  /// The location of the API key.
  final String in_;

  /// Creates an [ApiKeySecuritySchemeV3] with the given parameters.
  ApiKeySecuritySchemeV3({
    required this.name,
    required this.in_,
    super.description,
  }) : super(type: 'apiKey');

  /// Creates an [ApiKeySecuritySchemeV3] from a map.
  factory ApiKeySecuritySchemeV3.fromMap(Map data) {
    return ApiKeySecuritySchemeV3(
      name: data['name'],
      in_: data['in'],
      description: data['description'],
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {...super.toMap(), 'name': name, 'in': in_};
  }
}

/// OAuth2 security scheme representing an OAuth2 authentication scheme.
class OAuth2SecuritySchemeV3 extends SecuritySchemeObjectV3 {
  /// A list of OAuth2 flow objects.
  final List<OAuthFlowObjectV3> flows;

  /// Creates an [OAuth2SecuritySchemeV3] with the given parameters.
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

/// OpenID Connect security scheme representing an OpenID Connect authentication scheme.
class OpenIdSecuritySchemeV3 extends SecuritySchemeObjectV3 {
  /// The OpenID Connect URL to discover OAuth2 configuration values.
  final String openIdConnectUrl;

  /// Creates an [OpenIdSecuritySchemeV3] with the given parameters.
  OpenIdSecuritySchemeV3({required this.openIdConnectUrl, super.description})
    : super(type: 'openIdConnect');

  /// Creates an [OpenIdSecuritySchemeV3] from a map.
  factory OpenIdSecuritySchemeV3.fromMap(Map data) {
    return OpenIdSecuritySchemeV3(
      openIdConnectUrl: data['openIdConnectUrl'],
      description: data['description'],
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {...super.toMap(), 'openIdConnectUrl': openIdConnectUrl};
  }
}

/// OAuth flow object representing an OAuth2 flow.
sealed class OAuthFlowObjectV3 {
  /// The URL to refresh the token.
  final String? refreshUrl;

  /// A map of scopes to descriptions.
  final Map<String, String> scopes;

  OAuthFlowObjectV3({this.refreshUrl, required this.scopes});

  /// Creates an [OAuthFlowObjectV3] from a map.
  Map<String, dynamic> toMap() {
    return {if (refreshUrl != null) 'refreshUrl': refreshUrl, 'scopes': scopes};
  }
}

/// Implicit OAuth flow representing the implicit OAuth2 flow.
class ImplicitOAuthFlowV3 extends OAuthFlowObjectV3 {
  /// The URL to obtain the authorization code.
  final String authorizationUrl;

  /// Creates an [ImplicitOAuthFlowV3] with the given parameters.
  ImplicitOAuthFlowV3({
    required this.authorizationUrl,
    super.refreshUrl,
    required super.scopes,
  });

  /// Creates an [ImplicitOAuthFlowV3] from a map.
  factory ImplicitOAuthFlowV3.fromMap(Map data) {
    return ImplicitOAuthFlowV3(
      authorizationUrl: data['authorizationUrl'],
      refreshUrl: data['refreshUrl'],
      scopes: Map<String, String>.from(data['scopes'] ?? {}),
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {...super.toMap(), 'authorizationUrl': authorizationUrl};
  }
}

/// Password OAuth flow representing the password OAuth2 flow.
class PasswordOAuthFlowV3 extends OAuthFlowObjectV3 {
  /// The URL to obtain the access token.
  final String tokenUrl;

  /// Creates a [PasswordOAuthFlowV3] with the given parameters.
  PasswordOAuthFlowV3({
    required this.tokenUrl,
    super.refreshUrl,
    required super.scopes,
  });

  /// Creates a [PasswordOAuthFlowV3] from a map.
  factory PasswordOAuthFlowV3.fromMap(Map data) {
    return PasswordOAuthFlowV3(
      tokenUrl: data['tokenUrl'],
      refreshUrl: data['refreshUrl'],
      scopes: Map<String, String>.from(data['scopes'] ?? {}),
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {...super.toMap(), 'tokenUrl': tokenUrl};
  }
}

/// Client credentials OAuth flow representing the client credentials OAuth2 flow.
class ClientCredentialsOAuthFlowV3 extends OAuthFlowObjectV3 {
  /// The URL to obtain the access token.
  final String tokenUrl;

  /// Creates a [ClientCredentialsOAuthFlowV3] with the given parameters.
  ClientCredentialsOAuthFlowV3({
    required this.tokenUrl,
    super.refreshUrl,
    required super.scopes,
  });

  /// Creates a [ClientCredentialsOAuthFlowV3] from a map.
  factory ClientCredentialsOAuthFlowV3.fromMap(Map data) {
    return ClientCredentialsOAuthFlowV3(
      tokenUrl: data['tokenUrl'],
      refreshUrl: data['refreshUrl'],
      scopes: Map<String, String>.from(data['scopes'] ?? {}),
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {...super.toMap(), 'tokenUrl': tokenUrl};
  }
}

/// Authorization code OAuth flow representing the authorization code OAuth2 flow.
class AuthorizationCodeOAuthFlowV3 extends OAuthFlowObjectV3 {
  /// The URL to obtain the authorization code.
  final String authorizationUrl;

  /// The URL to obtain the access token.
  final String tokenUrl;

  /// Creates an [AuthorizationCodeOAuthFlowV3] with the given parameters.
  AuthorizationCodeOAuthFlowV3({
    required this.authorizationUrl,
    required this.tokenUrl,
    super.refreshUrl,
    required super.scopes,
  });

  /// Creates an [AuthorizationCodeOAuthFlowV3] from a map.
  factory AuthorizationCodeOAuthFlowV3.fromMap(Map data) {
    return AuthorizationCodeOAuthFlowV3(
      authorizationUrl: data['authorizationUrl'],
      tokenUrl: data['tokenUrl'],
      refreshUrl: data['refreshUrl'],
      scopes: Map<String, String>.from(data['scopes'] ?? {}),
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      ...super.toMap(),
      'authorizationUrl': authorizationUrl,
      'tokenUrl': tokenUrl,
    };
  }
}

/// Tag object representing a tag in the OpenAPI document.
class TagObjectV3 extends OpenApiObject<Map<String, dynamic>> {
  /// The name of the tag.
  final String name;

  /// A description of the tag.
  final String? description;

  /// Additional external documentation for the tag.
  final ExternalDocumentationObjectV3? externalDocs;

  /// Creates a [TagObjectV3] with the given parameters.
  const TagObjectV3({
    required this.name,
    this.description,
    this.externalDocs,
    super.extensions,
  });

  /// Creates a [TagObjectV3] from a map.
  factory TagObjectV3.fromMap(Map data) {
    return TagObjectV3(
      name: data['name'],
      description: data['description'],
      externalDocs: data['externalDocs'] != null
          ? ExternalDocumentationObjectV3.fromMap(data['externalDocs'])
          : null,
    );
  }

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

/// Path item object representing a path in the OpenAPI document.
class PathItemObjectV3 extends OpenApiPathItem<Map<String, dynamic>, OpenApiObject, OperationObjectV3> {

  /// A short summary of the path item.
  final String? summary;

  /// A verbose explanation of the path item behavior.
  final String? description;

  /// Additional external documentation for the path item.
  final ExternalDocumentationObjectV3? externalDocs;

  /// Creates a [PathItemObjectV3] with the given parameters.
  PathItemObjectV3({
    required super.operations,
    super.ref,
    this.summary,
    this.description,
    this.externalDocs,
    super.parameters,
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

  /// Creates a [PathItemObjectV3] from a map.
  factory PathItemObjectV3.fromMap(Map map) {
    return PathItemObjectV3(
      operations: {
        for (final entry in map.entries)
          if ([
            'get',
            'put',
            'post',
            'delete',
            'options',
            'head',
            'patch',
            'trace',
          ].contains(entry.key))
            entry.key: OperationObjectV3.fromMap(entry.value),
      },
      parameters: map['parameters'] != null
          ? [
              for (final param in (map['parameters'] as List))
                param is Map
                    ? param[r'$ref'] != null
                          ? ReferenceObject(param[r'$ref'])
                          : ParameterObjectV3.fromMap(param)
                    : param,
            ]
          : null,
    );
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

/// OpenAPI document representing the root document of the OpenAPI specification.
class DocumentV3 extends OpenAPIDocument<Map<String, dynamic>> {
  /// The OpenAPI version.
  final String openapi;

  /// A list of server objects.
  final List<ServerObjectV3>? servers;

  /// A map of path strings to path item objects.
  final Map<String, PathItemObjectV3?> paths;

  /// The components object containing reusable components.
  final ComponentsObjectV3? components;

  /// A list of security requirement objects.
  final List<SecurityRequirementsV3>? security;

  /// A list of tag objects.
  final List<TagObjectV3>? tags;

  /// External documentation for the API.
  final ExternalDocumentationObjectV3? externalDocs;

  /// Creates a [DocumentV3] with the given parameters.
  DocumentV3({
    required super.info,
    required this.paths,
    this.servers,
    this.openapi = '3.0.0',
    this.components,
    this.security,
    this.tags,
    this.externalDocs,
    super.extensions,
  }) {
    if (openapi.split('.').length != 3 || !openapi.startsWith('3.0')) {
      throw ArgumentError('OpenAPI version must be in the format x.y.z');
    }
  }

  /// Creates a [DocumentV3] from a map.
  factory DocumentV3.fromMap(Map map) {
    return DocumentV3(
      info: InfoObject.fromMap(map['info'] ?? {}),
      paths: map['paths'] != null
          ? {
              for (final entry in (map['paths'] as Map).entries)
                entry.key: entry.value != null
                    ? PathItemObjectV3.fromMap(entry.value)
                    : null,
            }
          : {},
      openapi: map['openapi'] ?? '3.0.0',
      components: map['components'] != null
          ? ComponentsObjectV3.fromMap(map['components'])
          : null,
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
      tags: map['tags'] != null
          ? [for (final tag in (map['tags'] as List)) TagObjectV3.fromMap(tag)]
          : null,
      externalDocs: map['externalDocs'] != null
          ? ExternalDocumentationObjectV3.fromMap(map['externalDocs'])
          : null,
      servers: map['servers'] != null
          ? [
              for (final server in (map['servers'] as List))
                ServerObjectV3.fromMap(server),
            ]
          : null,
    );
  }

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
