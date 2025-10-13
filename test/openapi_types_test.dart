import 'package:openapi_types/open_api_v3.dart';
import 'package:openapi_types/open_api_v3_1.dart';
import 'package:test/test.dart';

void main() {
  test('DocumentV31 accepts paths structure', () {
    final document = DocumentV31(
      info: const InfoObjectV31(title: 'Demo', version: '1.0.0'),
      structure: PathsWebhooksComponentsV31(
        paths: {
          '/ping': PathItemObjectV31(
            operations: {
              'get': OperationObjectV31(
                responses: ResponsesV31({
                  '200': ResponseObjectV3(description: 'pong'),
                  'default': ResponseObjectV3(description: 'unexpected error'),
                }),
              ),
            },
          ),
        },
      ),
    );

    expect(document.paths, isNotNull);
    expect(
      document.paths!['/ping']!.operations['get'],
      isA<OperationObjectV31>(),
    );
  });
}
