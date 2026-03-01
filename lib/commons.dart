import 'package:openapi_types/openapi_types.dart';

/// A simple reference object to be used in various places.
class ReferenceObject extends JsonSchema<Map<String, dynamic>> {
  /// A short summary for the referenced value.
  final String? summary;

  /// Creates a [ReferenceObject] with the given [ref].
  ReferenceObject(String ref, {this.summary, super.description})
    : super(ref: ref);

  /// Creates a [ReferenceObject] from a map.
  factory ReferenceObject.fromMap(Map map) {
    return ReferenceObject(
      map[r'$ref'],
      summary: map['summary'],
      description: map['description'],
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      r'$ref': ref,
      if (summary != null) 'summary': summary,
      if (description != null) 'description': description,
      ...super.toMap(),
    };
  }
}

/// Common classes used across different OpenAPI versions.
class InfoObject {
  /// The title of the API.
  final String title;

  /// The description of the API.
  final String? description;

  /// The terms of service URL.
  final String? termsOfService;

  /// The contact information for the API.
  final ContactObject? contact;

  /// The license information for the API.
  final LicenseObject? license;

  /// The version of the API.
  final String version;

  /// Vendor-specific extension fields (`x-*`) merged into the object.
  final Map<String, dynamic>? extensions;

  /// Creates an [InfoObject] with the given parameters.
  const InfoObject({
    required this.title,
    required this.version,
    this.description,
    this.termsOfService,
    this.contact,
    this.license,
    this.extensions,
  });

  /// Creates an [InfoObject] from a map.
  factory InfoObject.fromMap(Map map) {
    if (!map.containsKey('title') ||
        !map.containsKey('version') ||
        map['title'] == null ||
        map['version'] == null) {
      throw Exception(
        'InfoObject must contain title and version fields and they cannot be null. Found: $map',
      );
    }
    return InfoObject(
      title: map['title'],
      description: map['description'],
      termsOfService: map['termsOfService'],
      contact: map['contact'] != null
          ? ContactObject.fromMap(map['contact'])
          : null,
      license: map['license'] != null
          ? LicenseObject.fromMap(map['license'])
          : null,
      version: map['version'],
      extensions: {
        for (final entry in map.entries)
          if (entry.key is String && entry.key.startsWith('x-'))
            entry.key: entry.value,
      },
    );
  }

  /// Converts the [InfoObject] to a map.
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      if (description != null) 'description': description,
      if (termsOfService != null) 'termsOfService': termsOfService,
      if (contact != null) 'contact': contact!.toMap(),
      if (license != null) 'license': license!.toMap(),
      'version': version,
      if (extensions != null) ...extensions!,
    };
  }
}

/// Contact information for the API.
class ContactObject {
  /// The name of the contact person/organization.
  final String? name;

  /// The URL of the contact person/organization.
  final String? url;

  /// The email of the contact person/organization.
  final String? email;

  /// Creates a [ContactObject] with the given [name], [url], and [email].
  const ContactObject({this.name, this.url, this.email});

  /// Creates a [ContactObject] from a map.
  factory ContactObject.fromMap(Map map) {
    return ContactObject(
      name: map['name'],
      url: map['url'],
      email: map['email'],
    );
  }

  /// Converts the [ContactObject] to a map.
  Map<String, dynamic> toMap() {
    return {
      if (name != null) 'name': name,
      if (url != null) 'url': url,
      if (email != null) 'email': email,
    };
  }
}

/// License information for the API.
class LicenseObject {
  /// The name of the license.
  final String name;

  /// The URL of the license.
  final String? url;

  /// The SPDX license identifier.
  final String? identifier;

  /// Creates a [LicenseObject] with the given [name] and optional [url].
  const LicenseObject({required this.name, this.url, this.identifier});

  /// Creates a [LicenseObject] from a map.
  factory LicenseObject.fromMap(Map map) {
    return LicenseObject(
      name: map['name'],
      url: map['url'],
      identifier: map['identifier'],
    );
  }

  /// Converts the [LicenseObject] to a map.
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      if (url != null) 'url': url,
      if (identifier != null) 'identifier': identifier,
    };
  }
}

/// Enum representing the supported OpenAPI versions.
enum OpenApiVersion {
  /// OpenAPI 2.0
  v2,

  /// OpenAPI 3.0.x
  v3_0,

  /// OpenAPI 3.1.x
  v3_1,
}

/// JSON Schema object representing a JSON schema definition.
class JsonSchema<T> extends OpenApiObject<Map<String, dynamic>> {
  /// The identifier for the schema.
  final String? id;

  /// The schema version.
  final String? schema;

  /// The title of the schema.
  final String? title;

  /// The description of the schema.
  final String? description;

  /// A number that the value must be a multiple of.
  final num? multipleOf;

  /// The maximum value of the number.
  final num? maximum;

  /// Indicates whether the maximum value is exclusive.
  final bool? exclusiveMaximum;

  /// The minimum value of the number.
  final num? minimum;

  /// Indicates whether the minimum value is exclusive.
  final bool? exclusiveMinimum;

  /// The maximum length of the string.
  final int? maxLength;

  /// The minimum length of the string.
  final int? minLength;

  /// A regular expression pattern that the string must match.
  final Pattern? pattern;

  /// Indicates whether additional items are allowed in an array.
  final bool? additionalItems;

  /// The schema defining the type of items in an array.
  final OpenApiObject? items;

  /// The maximum number of items in an array.
  final int? maxItems;

  /// The minimum number of items in an array.
  final int? minItems;

  /// Indicates whether the items in an array must be unique.
  final bool? uniqueItems;

  /// The maximum number of properties in an object.
  final int? maxProperties;

  /// The minimum number of properties in an object.
  final int? minProperties;

  /// A list of required properties in an object.
  final List<String>? required;

  /// A map of additional properties in an object.
  final Map<String, dynamic>? additionalProperties;

  /// Indicates whether additional properties are allowed in an object.
  final bool hasAdditionalProperties;

  /// A map of schema definitions.
  final Map<String, JsonSchema>? definitions;

  /// A map of property schemas.
  final Map<String, OpenApiObject>? properties;

  /// A map of pattern property schemas.
  final Map<String, JsonSchema>? patternProperties;

  /// A map of dependencies for properties.
  final Map<String, dynamic>? dependencies;

  /// An enumeration of possible values.
  final List<dynamic>? enumValues;

  /// The type of the schema (e.g., "string", "number", "integer", "boolean", "array", "object").
  final OpenApiType? type;

  /// A list of schemas that must all be valid.
  final List<JsonSchema>? allOf;

  /// A list of schemas where at least one must be valid.
  final List<JsonSchema>? anyOf;

  /// A list of schemas where exactly one must be valid.
  final List<JsonSchema>? oneOf;

  /// A schema that must not be valid.
  final OpenApiObject? not;

  /// A reference to an external definition of the schema.
  final String? ref;

  /// The default value for the schema.
  final Object? defaultValue;

  /// Creates a [JsonSchema] with the given parameters.
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
    this.hasAdditionalProperties = false,
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
    this.defaultValue,
    super.extensions,
  }) {
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

  @override
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
      if (type != null) ...type!.toMap(),
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
      if (additionalProperties != null && hasAdditionalProperties)
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
        'items': items is OpenApiObject
            ? (items as OpenApiObject).toMap()
            : items,
      if (allOf != null) 'allOf': allOf!.map((e) => e.toMap()).toList(),
      if (anyOf != null) 'anyOf': anyOf!.map((e) => e.toMap()).toList(),
      if (oneOf != null) 'oneOf': oneOf!.map((e) => e.toMap()).toList(),
      if (not != null) 'not': not!.toMap(),
      if (ref != null) r'$ref': ref,
      if (id != null) 'id': id,
      if (schema != null) r'$schema': schema,
      if (defaultValue != null) 'default': defaultValue,
      ...super.toMap(),
    };
  }

  /// Converts the [JsonSchema] to a JSON map.
  Map<String, dynamic> toJson() => toMap();
}
