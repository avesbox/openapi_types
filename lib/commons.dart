import 'package:openapi_types/openapi_types.dart';

/// A simple reference object to be used in various places.
class ReferenceObject extends OpenApiObject<Map<String, dynamic>> {
  /// The reference string.
  final String ref;

  /// Creates a [ReferenceObject] with the given [ref].
  const ReferenceObject(this.ref);

  @override
  Map<String, dynamic> toMap() {
    return {'\$ref': ref, ...super.toMap()};
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

  /// Creates an [InfoObject] with the given parameters.
  const InfoObject({
    required this.title,
    required this.version,
    this.description,
    this.termsOfService,
    this.contact,
    this.license,
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

  /// Creates a [LicenseObject] with the given [name] and optional [url].
  const LicenseObject({required this.name, this.url});

  /// Creates a [LicenseObject] from a map.
  factory LicenseObject.fromMap(Map map) {
    return LicenseObject(name: map['name'], url: map['url']);
  }

  /// Converts the [LicenseObject] to a map.
  Map<String, dynamic> toMap() {
    return {'name': name, if (url != null) 'url': url};
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
