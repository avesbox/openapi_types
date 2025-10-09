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
              responses: ResponsesV3({
                200: ResponseObjectV3(description: 'pong'),
              }),
            ),
          },
        ),
      },
    ),
  );
  print(jsonEncode(schemaV31.toMap()));
}
