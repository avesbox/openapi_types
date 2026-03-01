import 'package:openapi_types/openapi_types.dart';
import 'package:test/test.dart';

class _CustomJsonSchema extends JsonSchema<Object> {
  _CustomJsonSchema();
}

void main() {
  test('OpenApiParser rejects unsupported future minor version 3.10.0', () {
    final parser = OpenApiParser();

    expect(
      () => parser.parseFromJson(
        '{"openapi":"3.10.0","info":{"title":"Demo","version":"1.0.0"},"paths":{"/ping":{"get":{"responses":{"200":{"description":"ok"}}}}}}',
      ),
      throwsException,
    );
  });

  test('InfoObject preserves x- extensions during round-trip', () {
    final info = InfoObject.fromMap({
      'title': 'Demo',
      'version': '1.0.0',
      'x-team': 'platform',
      'x-release': 3,
    });

    final map = info.toMap();
    expect(map['x-team'], 'platform');
    expect(map['x-release'], 3);
  });

  test('MediaTypeObjectV3 preserves singular example', () {
    final mediaType = MediaTypeObjectV3.fromMap({
      'schema': {'type': 'string'},
      'example': 'value-1',
    });

    expect(mediaType.example, 'value-1');
    expect(mediaType.toMap()['example'], 'value-1');
  });

  test('LinkObjectV3 parameters accept runtime expressions and literals', () {
    final link = LinkObjectV3.fromMap({
      'operationId': 'getUser',
      'parameters': {
        'userId': r'$request.path.id',
        'fixed': 42,
        'payload': {'k': 'v'},
      },
    });

    expect(link.parameters!['userId'], r'$request.path.id');
    expect(link.parameters!['fixed'], 42);
    expect(link.parameters!['payload'], {'k': 'v'});
    expect(link.toMap()['parameters']['userId'], r'$request.path.id');
  });

  test('SchemaObjectV3 preserves id and \$schema', () {
    final schema = SchemaObjectV3.fromMap({
      'id': 'my-id',
      '\$schema': 'http://json-schema.org/draft-07/schema#',
      'type': 'string',
    });

    final mapped = schema.toMap();
    expect(mapped['id'], 'my-id');
    expect(mapped['\$schema'], 'http://json-schema.org/draft-07/schema#');
  });

  test(
    'SecuritySchemeObjectV2 parses oauth2 and preserves vendor extensions',
    () {
      final scheme = SecuritySchemeObjectV2.fromMap({
        'type': 'oauth2',
        'flow': 'accessCode',
        'authorizationUrl': 'https://example.com/auth',
        'tokenUrl': 'https://example.com/token',
        'scopes': {'read': 'Read access'},
        'x-provider': 'custom-idp',
      });

      expect(scheme, isA<SecuritySchemeOAuth2AccessCodeV2>());
      expect(scheme.toMap()['x-provider'], 'custom-idp');
    },
  );

  test('SecuritySchemeObjectV2 accepts legacy oauth alias', () {
    final scheme = SecuritySchemeObjectV2.fromMap({
      'type': 'oauth',
      'flow': 'password',
      'tokenUrl': 'https://example.com/token',
      'scopes': {'write': 'Write access'},
    });

    expect(scheme, isA<SecuritySchemeOAuth2PasswordV2>());
  });

  test('SecuritySchemeObjectV2 keeps unknown types as custom schemes', () {
    final scheme = SecuritySchemeObjectV2.fromMap({
      'type': 'mutualTLS',
      'x-tier': 'enterprise',
      'mtlsMode': 'strict',
    });

    expect(scheme, isA<SecuritySchemeCustomV2>());
    expect(scheme.toMap()['type'], 'mutualTLS');
    expect(scheme.toMap()['x-tier'], 'enterprise');
    expect(scheme.toMap()['mtlsMode'], 'strict');
  });

  test('ParameterObjectV2 supports array items and collectionFormat', () {
    final parameter = ParameterObjectV2.fromMap({
      'name': 'ids',
      'in': 'query',
      'type': 'array',
      'collectionFormat': 'csv',
      'items': {'type': 'string'},
    });

    expect(parameter.collectionFormat, 'csv');
    expect(parameter.items, isA<ItemsObjectV2>());
    expect(parameter.toMap()['collectionFormat'], 'csv');
    expect(parameter.toMap()['items'], isA<Map>());
  });

  test('OperationObjectV3.fromMap accepts default response key', () {
    final operation = OperationObjectV3.fromMap({
      'responses': {
        '200': {'description': 'ok'},
        'default': {'description': 'fallback'},
      },
    });

    expect(operation.responses, isNotNull);
    expect(operation.responses['default'], isA<ResponseObjectV3>());
    expect(
      operation.toMap()['responses']['default']['description'],
      'fallback',
    );
  });

  test('Schema/Response/MediaType preserve x- extensions on round-trip', () {
    final schema = SchemaObjectV3.fromMap({
      'type': 'string',
      'x-schema-meta': {'a': 1},
    });
    final response = ResponseObjectV3.fromMap({
      'description': 'ok',
      'x-response-meta': true,
    });
    final mediaType = MediaTypeObjectV3.fromMap({
      'schema': {'type': 'string'},
      'x-media-meta': 'm',
    });

    expect(schema.toMap()['x-schema-meta'], {'a': 1});
    expect(response.toMap()['x-response-meta'], true);
    expect(mediaType.toMap()['x-media-meta'], 'm');
  });

  test('OperationObjectV3 requires responses', () {
    expect(
      () => OperationObjectV3.fromMap({'operationId': 'op1'}),
      throwsA(isA<ArgumentError>()),
    );
  });

  test('ResponseObjectV3 requires description', () {
    expect(
      () => ResponseObjectV3.fromMap({
        'content': {
          'application/json': {
            'schema': {'type': 'string'},
          },
        },
      }),
      throwsA(isA<ArgumentError>()),
    );
  });

  test('RequestBodyV3 requires content', () {
    expect(
      () => RequestBodyV3.fromMap({'description': 'body'}),
      throwsA(isA<ArgumentError>()),
    );
  });

  test('ParameterBaseObjectV3 rejects schema and content together', () {
    expect(
      () => ParameterObjectV3(
        name: 'id',
        in_: 'query',
        schema: SchemaObjectV3(type: OpenApiType.string()),
        content: {
          'application/json': MediaTypeObjectV3(
            schema: SchemaObjectV3(type: OpenApiType.string()),
          ),
        },
      ),
      throwsA(isA<ArgumentError>()),
    );
  });

  test('OperationObjectV3.fromMap supports callbacks', () {
    final operation = OperationObjectV3.fromMap({
      'responses': {
        '200': {'description': 'ok'},
      },
      'callbacks': {
        'onEvent': {
          '{\$request.body#/callbackUrl}': {
            'post': {
              'responses': {
                '202': {'description': 'accepted'},
              },
            },
          },
        },
      },
    });

    expect(operation.callbacks, isNotNull);
    expect(operation.callbacks!['onEvent'], isA<PathItemObjectV3>());
  });

  test('DocumentV3 rejects empty paths in constructor', () {
    expect(
      () => DocumentV3(
        info: const InfoObject(title: 'Demo API', version: '1.0.0'),
        paths: {},
      ),
      throwsA(isA<ArgumentError>()),
    );
  });

  test('DocumentV3.fromMap requires non-null paths object', () {
    expect(
      () => DocumentV3.fromMap({
        'openapi': '3.0.0',
        'info': {'title': 'Demo API', 'version': '1.0.0'},
      }),
      throwsA(isA<ArgumentError>()),
    );

    expect(
      () => DocumentV3.fromMap({
        'openapi': '3.0.0',
        'info': {'title': 'Demo API', 'version': '1.0.0'},
        'paths': null,
      }),
      throwsA(isA<ArgumentError>()),
    );
  });

  test('DocumentV3.fromMap rejects OpenAPI 3.1-only top-level fields', () {
    expect(
      () => DocumentV3.fromMap({
        'openapi': '3.0.0',
        'info': {'title': 'Demo API', 'version': '1.0.0'},
        'paths': {
          '/ping': {
            'get': {
              'responses': {
                '200': {'description': 'ok'},
              },
            },
          },
        },
        'webhooks': {},
      }),
      throwsA(isA<ArgumentError>()),
    );

    expect(
      () => DocumentV3.fromMap({
        'openapi': '3.0.0',
        'info': {'title': 'Demo API', 'version': '1.0.0'},
        'paths': {
          '/ping': {
            'get': {
              'responses': {
                '200': {'description': 'ok'},
              },
            },
          },
        },
        'jsonSchemaDialect': 'https://json-schema.org/draft/2020-12/schema',
      }),
      throwsA(isA<ArgumentError>()),
    );
  });

  test('DocumentV3 rejects mixed 3.1-only info and path-item features', () {
    expect(
      () => DocumentV3(
        info: const InfoObjectV31(
          title: 'Demo API',
          version: '1.0.0',
          summary: '3.1 summary',
        ),
        paths: {
          '/ping': PathItemObjectV3(
            operations: {
              'get': OperationObjectV3(
                responses: ResponsesV3<String>({
                  '200': ResponseObjectV3(description: 'ok'),
                }),
              ),
            },
          ),
        },
      ),
      throwsA(isA<ArgumentError>()),
    );

    expect(
      () => DocumentV3(
        info: const InfoObject(title: 'Demo API', version: '1.0.0'),
        paths: {
          '/ping': PathItemObjectV31(
            servers: [const ServerObjectV3(url: 'https://api.example.com')],
            operations: {
              'get': OperationObjectV31(
                responses: ResponsesV31({
                  '200': ResponseObjectV3(description: 'ok'),
                }),
              ),
            },
          ),
        },
      ),
      throwsA(isA<ArgumentError>()),
    );
  });

  test('OpenApiValidator reports duplicate operation IDs', () {
    final document = DocumentV3.fromMap({
      'openapi': '3.0.0',
      'info': {'title': 'Demo API', 'version': '1.0.0'},
      'paths': {
        '/a': {
          'get': {
            'operationId': 'duplicateOp',
            'responses': {
              '200': {'description': 'ok'},
            },
          },
        },
        '/b': {
          'post': {
            'operationId': 'duplicateOp',
            'responses': {
              '200': {'description': 'ok'},
            },
          },
        },
      },
    });

    final issues = const OpenApiValidator().validate(document);
    expect(
      issues.any((issue) => issue.message.contains('Duplicate operationId')),
      isTrue,
    );
  });

  test(
    'OpenApiValidator.validateMap reports mixed 3.1 features in 3.0 maps',
    () {
      final issues = const OpenApiValidator().validateMap({
        'openapi': '3.0.0',
        'info': {
          'title': 'Demo API',
          'version': '1.0.0',
          'summary': '3.1-only info summary',
          'license': {'name': 'MIT', 'identifier': 'MIT'},
        },
        'jsonSchemaDialect': 'https://json-schema.org/draft/2020-12/schema',
        'webhooks': {},
        'components': {'pathItems': {}},
        'paths': {
          '/ping': {
            'servers': [
              {'url': 'https://api.example.com'},
            ],
            'get': {
              'responses': {
                '200': {'description': 'ok'},
              },
            },
          },
        },
      });

      final issuePaths = issues.map((issue) => issue.path).toSet();
      expect(issuePaths.contains('webhooks'), isTrue);
      expect(issuePaths.contains('jsonSchemaDialect'), isTrue);
      expect(issuePaths.contains('components.pathItems'), isTrue);
      expect(issuePaths.contains('info.summary'), isTrue);
      expect(issuePaths.contains('info.license.identifier'), isTrue);
      expect(issuePaths.contains('paths./ping.servers'), isTrue);
    },
  );

  test(
    'SchemaObjectV3 accepts JsonSchema subclasses in allOf/oneOf/anyOf/not',
    () {
      expect(
        () => SchemaObjectV3(
          allOf: [_CustomJsonSchema()],
          oneOf: [_CustomJsonSchema()],
          anyOf: [_CustomJsonSchema()],
          not: _CustomJsonSchema(),
        ),
        returnsNormally,
      );
    },
  );

  test('SchemaObjectV3 accepts non-string discriminator mapping values', () {
    final schema = SchemaObjectV3.fromMap({
      'type': 'object',
      'discriminator': {
        'propertyName': 'kind',
        'mapping': {
          'cat': '#/components/schemas/Cat',
          'dog': {'\$ref': '#/components/schemas/Dog'},
        },
      },
    });

    expect(schema.discriminator, isNotNull);
    expect(schema.discriminator!.mapping!['dog'], isA<Map>());
  });

  test('ReferenceObject supports summary and description', () {
    final reference = ReferenceObject.fromMap({
      '\$ref': '#/components/schemas/User',
      'summary': 'User schema',
      'description': 'Detailed user schema reference',
    });

    expect(reference.summary, 'User schema');
    expect(reference.description, 'Detailed user schema reference');
    expect(reference.toMap()['summary'], 'User schema');
  });

  test('ParameterBaseObjectV3 serializes values by style', () {
    final param = ParameterObjectV3(
      name: 'id',
      in_: 'path',
      style: 'matrix',
      explode: false,
    );

    final serialized = param.serializeValue([
      '3',
      '4',
      '5',
    ], parameterName: 'id');
    expect(serialized, ';id=3,4,5');
  });

  test('LicenseObject supports optional identifier across versions', () {
    final license = LicenseObject.fromMap({
      'name': 'MIT',
      'url': 'https://opensource.org/licenses/MIT',
      'identifier': 'MIT',
    });

    expect(license.identifier, 'MIT');
    expect(license.toMap()['identifier'], 'MIT');
  });

  test('SchemaObjectV31 parses and serializes type arrays', () {
    final schema = SchemaObjectV31.fromMap({
      'type': ['string', 'null'],
      '\$schema': 'https://json-schema.org/draft/2020-12/schema',
      'const': 'fixed',
      'examples': ['fixed'],
    });

    final mapped = schema.toMap();
    expect(mapped['type'], ['string', 'null']);
    expect(mapped['\$schema'], 'https://json-schema.org/draft/2020-12/schema');
    expect(mapped['const'], 'fixed');
  });

  test('ComponentsObjectV31 uses SchemaObjectV31 parser for schemas', () {
    final components = ComponentsObjectV31.fromMap({
      'schemas': {
        'NullableString': {
          'type': ['string', 'null'],
        },
      },
    });

    expect(components.schemas!['NullableString'], isA<SchemaObjectV31>());
    expect((components.schemas!['NullableString'] as SchemaObjectV31).types, [
      'string',
      'null',
    ]);
  });

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

  test('DocumentV31 validates openapi version format', () {
    expect(
      () => DocumentV31(
        openapi: '3.0.9',
        info: const InfoObjectV31(title: 'Demo', version: '1.0.0'),
        structure: PathsWebhooksComponentsV31(
          components: ComponentsObjectV31(),
        ),
      ),
      throwsA(isA<ArgumentError>()),
    );
  });
}
