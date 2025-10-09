import 'package:openapi_types/openapi_types.dart';

class ReferenceObject extends OpenApiObject<Map<String, dynamic>> {
  final String ref;

  const ReferenceObject(this.ref);

  @override
  Map<String, dynamic> toMap() {
    return {'\$ref': ref, ...super.toMap()};
  }
}

class InfoObject {
  final String title;

  final String? description;

  final String? termsOfService;

  final ContactObject? contact;

  final LicenseObject? license;

  final String version;

  const InfoObject({
    required this.title,
    required this.version,
    this.description,
    this.termsOfService,
    this.contact,
    this.license,
  });

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

class ContactObject {
  final String? name;
  final String? url;
  final String? email;

  const ContactObject({this.name, this.url, this.email});

  Map<String, dynamic> toMap() {
    return {
      if (name != null) 'name': name,
      if (url != null) 'url': url,
      if (email != null) 'email': email,
    };
  }
}

class LicenseObject {
  final String name;
  final String? url;

  const LicenseObject({required this.name, this.url});

  Map<String, dynamic> toMap() {
    return {'name': name, if (url != null) 'url': url};
  }
}
