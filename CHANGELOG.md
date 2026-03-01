# Changelog

## 2.1.0

- feat: Added lightweight validation API with `OpenApiValidator` and `validateMap()` for pre-parse checks.
- feat: Added mixed-version diagnostics for OpenAPI 3.0 vs 3.1-only fields (`webhooks`, `jsonSchemaDialect`, `components.pathItems`, etc.).
- feat: Added parameter style serialization helper for OpenAPI v3 (`form`, `simple`, `matrix`, `label`, `spaceDelimited`, `pipeDelimited`, `deepObject`).
- feat: Added OpenAPI 3.0 `callbacks` support to `OperationObjectV3` (parse, model, serialize).

- fix: Preserved vendor extensions (`x-*`) across more objects (`InfoObject`, `SchemaObjectV3`, `ResponseObjectV3`, `MediaTypeObjectV3`, `RequestBodyV3`, and related parsing paths).
- fix: OpenAPI parser version detection is now strict for supported versions (`2.0`, `3.0.x`, `3.1.x`).
- fix: `OperationObjectV3.fromMap` now supports `default` responses correctly.
- fix: `LinkObjectV3.parameters` now accepts runtime expressions and literal JSON values without schema coercion.
- fix: `MediaTypeObjectV3` now supports singular `example` in addition to `examples`.
- fix: `SchemaObjectV3` now preserves `id` and `$schema` fields.
- fix: Added Swagger/OpenAPI 2.0 array parameter support (`items`, `collectionFormat`) in `ParameterObjectV2`.
- fix: Relaxed discriminator mapping typing to avoid overly strict string-only casting.

- compliance: Added OpenAPI 3.1 `type` array support in `SchemaObjectV31` and wired `ComponentsObjectV31` schema parsing to use `SchemaObjectV31`.
- compliance: Added OpenAPI 3.1 version validation in `DocumentV31`.
- compliance: Enforced parameter `schema` vs `content` mutual exclusivity in v3 parameter base model.

- breaking: `OperationObjectV3.responses` is now required (non-null).
- breaking: `ResponseObjectV3.description` is now required (non-null).
- breaking: `RequestBodyV3.content` is now required (non-null).
- breaking: `OAuth2SecuritySchemeV3.flows` now uses a map keyed by flow name; a compatibility getter (`flowList`) is provided.

## 2.0.2

- fix: RefernceObject now is a JsonSchema object, and it has a constructor that takes a String ref as parameter.

## 2.0.1

- fix: add missing types in DocumentV2

## 2.0.0

- fix!: improved interoperability between OpenAPI types.

## 1.1.1

- fix: changed some interfaces to support null safety.

## 1.1.0

- feat: Added Parser from and to JSON/YAML.

## 1.0.0

- Initial version.
