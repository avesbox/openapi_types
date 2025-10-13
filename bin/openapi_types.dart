import 'dart:io';
import 'package:openapi_types/openapi_types.dart';

void main(List<String> arguments) {
  final file = File('swagger.yaml');
  final filev2 = File('swagger_v2.json');
  final yamlString = file.readAsStringSync();
  final parser = OpenApiParser();
  final document = parser.parseFromYaml(yamlString);
  File(
    'swagger_2.yaml',
  ).writeAsStringSync(parser.stringify(document, toYaml: true));
  final yamlStringv2 = filev2.readAsStringSync();
  final documentv2 = parser.parseFromJson(yamlStringv2);
  File(
    'swagger_v2_converted.yaml',
  ).writeAsStringSync(parser.stringify(documentv2, toYaml: true));
  File(
    'swagger_v2_converted.json',
  ).writeAsStringSync(parser.stringify(documentv2, toYaml: false));
  final fileV31 = File('swagger_v31.json');
  final yamlStringv31 = fileV31.readAsStringSync();
  final documentv31 = parser.parseFromJson(yamlStringv31);
  File(
    'swagger_v31_converted.yaml',
  ).writeAsStringSync(parser.stringify(documentv31, toYaml: true));
  File(
    'swagger_v31_converted.json',
  ).writeAsStringSync(parser.stringify(documentv31, toYaml: false));
}
