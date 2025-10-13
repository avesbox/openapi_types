import 'package:openapi_types/openapi_types.dart';

void main(List<String> arguments) {
  final _ = DocumentV31(
    info: const InfoObjectV31(title: 'Demo', version: '1.0.0'),
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
}
