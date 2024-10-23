// Mocks generated by Mockito 5.4.4 from annotations
// in yugiohgalaxy/test/features/arquetipes_section/data/data_sources/arquetipes_section_data_source_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:http/http.dart' as _i5;
import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i3;
import 'package:yugiohgalaxy/core/data/network/http_client.dart' as _i2;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeHttpServiceResponse_0 extends _i1.SmartFake
    implements _i2.HttpServiceResponse {
  _FakeHttpServiceResponse_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [HttpClient].
///
/// See the documentation for Mockito's code generation for more information.
class MockHttpClient extends _i1.Mock implements _i2.HttpClient {
  MockHttpClient() {
    _i1.throwOnMissingStub(this);
  }

  @override
  String get url => (super.noSuchMethod(
        Invocation.getter(#url),
        returnValue: _i3.dummyValue<String>(
          this,
          Invocation.getter(#url),
        ),
      ) as String);

  @override
  set url(String? _url) => super.noSuchMethod(
        Invocation.setter(
          #url,
          _url,
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i4.Future<Map<String, String>?> headers() => (super.noSuchMethod(
        Invocation.method(
          #headers,
          [],
        ),
        returnValue: _i4.Future<Map<String, String>?>.value(),
      ) as _i4.Future<Map<String, String>?>);

  @override
  _i4.Future<_i2.HttpServiceResponse> get({
    required String? endpoint,
    _i5.Client? client,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #get,
          [],
          {
            #endpoint: endpoint,
            #client: client,
          },
        ),
        returnValue: _i4.Future<_i2.HttpServiceResponse>.value(
            _FakeHttpServiceResponse_0(
          this,
          Invocation.method(
            #get,
            [],
            {
              #endpoint: endpoint,
              #client: client,
            },
          ),
        )),
      ) as _i4.Future<_i2.HttpServiceResponse>);

  @override
  _i4.Future<_i2.HttpServiceResponse> post({
    required String? endpoint,
    required Map<String, dynamic>? body,
    String? transactionId,
    _i5.Client? client,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #post,
          [],
          {
            #endpoint: endpoint,
            #body: body,
            #transactionId: transactionId,
            #client: client,
          },
        ),
        returnValue: _i4.Future<_i2.HttpServiceResponse>.value(
            _FakeHttpServiceResponse_0(
          this,
          Invocation.method(
            #post,
            [],
            {
              #endpoint: endpoint,
              #body: body,
              #transactionId: transactionId,
              #client: client,
            },
          ),
        )),
      ) as _i4.Future<_i2.HttpServiceResponse>);

  @override
  _i4.Future<_i2.HttpServiceResponse> postMultipart({
    required String? endpoint,
    required Map<String, String>? body,
    required List<int>? file,
    required String? fileName,
    String? transactionId,
    _i5.Client? client,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #postMultipart,
          [],
          {
            #endpoint: endpoint,
            #body: body,
            #file: file,
            #fileName: fileName,
            #transactionId: transactionId,
            #client: client,
          },
        ),
        returnValue: _i4.Future<_i2.HttpServiceResponse>.value(
            _FakeHttpServiceResponse_0(
          this,
          Invocation.method(
            #postMultipart,
            [],
            {
              #endpoint: endpoint,
              #body: body,
              #file: file,
              #fileName: fileName,
              #transactionId: transactionId,
              #client: client,
            },
          ),
        )),
      ) as _i4.Future<_i2.HttpServiceResponse>);

  @override
  _i4.Future<_i2.HttpServiceResponse> put({
    required String? endpoint,
    required Map<String, dynamic>? body,
    String? transactionId,
    _i5.Client? client,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #put,
          [],
          {
            #endpoint: endpoint,
            #body: body,
            #transactionId: transactionId,
            #client: client,
          },
        ),
        returnValue: _i4.Future<_i2.HttpServiceResponse>.value(
            _FakeHttpServiceResponse_0(
          this,
          Invocation.method(
            #put,
            [],
            {
              #endpoint: endpoint,
              #body: body,
              #transactionId: transactionId,
              #client: client,
            },
          ),
        )),
      ) as _i4.Future<_i2.HttpServiceResponse>);

  @override
  _i4.Future<_i2.HttpServiceResponse> patch({
    required String? endpoint,
    required Map<String, dynamic>? body,
    List<Map<String, dynamic>>? bodyList,
    String? transactionId,
    _i5.Client? client,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #patch,
          [],
          {
            #endpoint: endpoint,
            #body: body,
            #bodyList: bodyList,
            #transactionId: transactionId,
            #client: client,
          },
        ),
        returnValue: _i4.Future<_i2.HttpServiceResponse>.value(
            _FakeHttpServiceResponse_0(
          this,
          Invocation.method(
            #patch,
            [],
            {
              #endpoint: endpoint,
              #body: body,
              #bodyList: bodyList,
              #transactionId: transactionId,
              #client: client,
            },
          ),
        )),
      ) as _i4.Future<_i2.HttpServiceResponse>);

  @override
  _i4.Future<_i2.HttpServiceResponse> validateResponse(
    _i5.Response? response, {
    String? bodyRequest = r'',
    String? transactionId,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #validateResponse,
          [response],
          {
            #bodyRequest: bodyRequest,
            #transactionId: transactionId,
          },
        ),
        returnValue: _i4.Future<_i2.HttpServiceResponse>.value(
            _FakeHttpServiceResponse_0(
          this,
          Invocation.method(
            #validateResponse,
            [response],
            {
              #bodyRequest: bodyRequest,
              #transactionId: transactionId,
            },
          ),
        )),
      ) as _i4.Future<_i2.HttpServiceResponse>);

  @override
  String reduceToken(String? token) => (super.noSuchMethod(
        Invocation.method(
          #reduceToken,
          [token],
        ),
        returnValue: _i3.dummyValue<String>(
          this,
          Invocation.method(
            #reduceToken,
            [token],
          ),
        ),
      ) as String);
}
