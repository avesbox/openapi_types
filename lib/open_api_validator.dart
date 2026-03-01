import 'package:openapi_types/openapi_types.dart';

/// A single OpenAPI validation issue.
class OpenApiValidationIssue {
  /// Path to the field in the OpenAPI document.
  final String path;

  /// Validation message.
  final String message;

  const OpenApiValidationIssue({required this.path, required this.message});
}

/// Lightweight validation utility for OpenAPI documents.
class OpenApiValidator {
  /// Creates an [OpenApiValidator].
  const OpenApiValidator();

  /// Validates an OpenAPI document and returns all detected issues.
  List<OpenApiValidationIssue> validate(OpenAPIDocument document) {
    final issues = <OpenApiValidationIssue>[];
    _validateVersion(document, issues);
    _validateUniqueOperationIds(document, issues);
    return issues;
  }

  /// Validates a raw OpenAPI map before parsing.
  ///
  /// Useful to report mixed-version issues without triggering parser/constructor
  /// exceptions first.
  List<OpenApiValidationIssue> validateMap(Map map) {
    final issues = <OpenApiValidationIssue>[];
    final version = (map['openapi'] ?? map['swagger'])?.toString();

    if (version == null) {
      issues.add(
        const OpenApiValidationIssue(
          path: 'openapi|swagger',
          message: 'OpenAPI/Swagger version is missing.',
        ),
      );
      return issues;
    }

    if (version == '2.0') {
      return issues;
    }

    if (RegExp(r'^3\.0\.\d+$').hasMatch(version)) {
      _validateMixed31FeaturesIn30Map(map, issues);
      return issues;
    }

    if (RegExp(r'^3\.1\.\d+$').hasMatch(version)) {
      return issues;
    }

    issues.add(
      OpenApiValidationIssue(
        path: 'openapi|swagger',
        message:
            'Unsupported OpenAPI version: $version. Only 2.0, 3.0.x, and 3.1.x are supported.',
      ),
    );
    return issues;
  }

  void _validateMixed31FeaturesIn30Map(
    Map map,
    List<OpenApiValidationIssue> issues,
  ) {
    if (map.containsKey('webhooks')) {
      issues.add(
        const OpenApiValidationIssue(
          path: 'webhooks',
          message:
              'webhooks is an OpenAPI 3.1 feature and should not be used in 3.0 documents.',
        ),
      );
    }

    if (map.containsKey('jsonSchemaDialect')) {
      issues.add(
        const OpenApiValidationIssue(
          path: 'jsonSchemaDialect',
          message:
              'jsonSchemaDialect is an OpenAPI 3.1 feature and should not be used in 3.0 documents.',
        ),
      );
    }

    if (map['components'] is Map &&
        (map['components'] as Map).containsKey('pathItems')) {
      issues.add(
        const OpenApiValidationIssue(
          path: 'components.pathItems',
          message:
              'components.pathItems is an OpenAPI 3.1 feature and should not be used in 3.0 documents.',
        ),
      );
    }

    if (map['info'] is Map) {
      final info = map['info'] as Map;
      if (info.containsKey('summary')) {
        issues.add(
          const OpenApiValidationIssue(
            path: 'info.summary',
            message:
                'info.summary is an OpenAPI 3.1 feature and should not be used in 3.0 documents.',
          ),
        );
      }
      if (info['license'] is Map &&
          (info['license'] as Map).containsKey('identifier')) {
        issues.add(
          const OpenApiValidationIssue(
            path: 'info.license.identifier',
            message:
                'license.identifier is an OpenAPI 3.1 feature and should not be used in 3.0 documents.',
          ),
        );
      }
    }

    if (map['paths'] is Map) {
      final paths = map['paths'] as Map;
      for (final pathEntry in paths.entries) {
        if (pathEntry.value is Map &&
            (pathEntry.value as Map).containsKey('servers')) {
          issues.add(
            OpenApiValidationIssue(
              path: 'paths.${pathEntry.key}.servers',
              message:
                  'path item servers are treated as OpenAPI 3.1-only in this model and should not be used in 3.0 documents.',
            ),
          );
        }
      }
    }
  }

  void _validateVersion(
    OpenAPIDocument document,
    List<OpenApiValidationIssue> issues,
  ) {
    if (document is DocumentV2 && document.swagger != '2.0') {
      issues.add(
        OpenApiValidationIssue(
          path: 'swagger',
          message: 'Swagger version must be exactly 2.0.',
        ),
      );
      return;
    }

    if (document is DocumentV3 &&
        !RegExp(r'^3\\.0\\.\\d+$').hasMatch(document.openapi)) {
      issues.add(
        OpenApiValidationIssue(
          path: 'openapi',
          message: 'OpenAPI 3.0 document version must match 3.0.x.',
        ),
      );
      return;
    }

    if (document is DocumentV31 &&
        !RegExp(r'^3\\.1\\.\\d+$').hasMatch(document.openapi)) {
      issues.add(
        OpenApiValidationIssue(
          path: 'openapi',
          message: 'OpenAPI 3.1 document version must match 3.1.x.',
        ),
      );
    }
  }

  void _validateUniqueOperationIds(
    OpenAPIDocument document,
    List<OpenApiValidationIssue> issues,
  ) {
    final seen = <String, String>{};

    void addOperationId(String? operationId, String location) {
      if (operationId == null || operationId.trim().isEmpty) {
        return;
      }
      if (seen.containsKey(operationId)) {
        issues.add(
          OpenApiValidationIssue(
            path: location,
            message:
                'Duplicate operationId "$operationId". First seen at ${seen[operationId]}.',
          ),
        );
      } else {
        seen[operationId] = location;
      }
    }

    if (document is DocumentV2) {
      for (final pathEntry in document.paths.entries) {
        for (final operationEntry in pathEntry.value.operations.entries) {
          addOperationId(
            operationEntry.value.operationId,
            'paths.${pathEntry.key}.${operationEntry.key}.operationId',
          );
        }
      }
      return;
    }

    if (document is DocumentV3) {
      for (final pathEntry in document.paths.entries) {
        final pathItem = pathEntry.value;
        if (pathItem == null) continue;
        for (final operationEntry in pathItem.operations.entries) {
          addOperationId(
            operationEntry.value.operationId,
            'paths.${pathEntry.key}.${operationEntry.key}.operationId',
          );
        }
      }
      return;
    }

    if (document is DocumentV31) {
      for (final pathEntry
          in document.paths?.entries ??
              <MapEntry<String, PathItemObjectV31>>[]) {
        for (final operationEntry in pathEntry.value.operations.entries) {
          final operation = operationEntry.value;
          addOperationId(
            operation.operationId,
            'paths.${pathEntry.key}.${operationEntry.key}.operationId',
          );
        }
      }
    }
  }
}
