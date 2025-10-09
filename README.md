# OpenAPI Types

A Dart package that provides classes and utilities to work with OpenAPI specifications, including support for OpenAPI v3 and v3.1.

## Features

- Comprehensive Dart classes representing OpenAPI components.
- [] Mapping and serialization utilities.
- [] Validation and error handling for OpenAPI documents.
- [x] Support for OpenAPI v3 and v3.1 specifications.

## Installation

Add the following to your `pubspec.yaml` file:

```yaml
dependencies:
  openapi_types: ^1.0.0
```

Then run `dart pub get` to install the package.

## Usage

Import the package in your Dart file:

```dart
import 'dart:convert';

import 'package:openapi_types/openapi_types.dart';

void main(List<String> arguments) {
  final schemaV31 = DocumentV31(
    info: InfoObjectV31(title: 'Demo', version: '1.0.0'),
    structure: PathsWebhooksComponentsV31(
      paths: {
        '/ping': PathItemObjectV31(
          operations: {
            'get': OperationObjectV31(
              responses: ResponsesV3(
                {
                  200: ResponseObjectV3(description: 'pong'),
                },
              ),
            ),
          },
        ),
      },
    ),
  );
  print(jsonEncode(schemaV31.toMap()));
}
```
