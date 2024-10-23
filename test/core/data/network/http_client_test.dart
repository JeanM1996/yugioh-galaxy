import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:yugiohgalaxy/core/data/network/http_client.dart';

import 'http_client_test.mocks.dart';

@GenerateMocks([HttpClient])
void main() {
  //final HttpClient httpClient = HttpClient();
  final mockHttpClient = MockHttpClient();

  test('http_client_test Get', () async {
    //final HttpClient httpClient = HttpClient();
    //final MockHttpClient mockHttpClient = MockHttpClient();
    final responseHttp = HttpServiceResponse(
      success: true,
      message: "{'message': 'test'}",
      body: "{'message': 'test'}",
    );

    when(mockHttpClient.get(endpoint: '/test'))
        .thenAnswer((_) async => responseHttp);

    //final response = await httpClient.get(endpoint: '/test');
    final response = await mockHttpClient.get(endpoint: '/test');

    expect(response, responseHttp);
  });

  test('http_client_test Post', () async {
    //final HttpClient httpClient = HttpClient();
    //final MockHttpClient mockHttpClient = MockHttpClient();
    final responseHttp = HttpServiceResponse(
      success: true,
      message: "{'message': 'test'}",
      body: "{'message': 'test'}",
    );

    when(mockHttpClient.post(endpoint: '/test', body: {'message': 'test'}))
        .thenAnswer((_) async => responseHttp);

    //final response = await httpClient.post(
    //    endpoint: '/test', body: {'message': 'test'});
    final response =
        await mockHttpClient.post(endpoint: '/test', body: {'message': 'test'});

    expect(response, responseHttp);
  });

  test('http_client_test Put', () async {
    //final HttpClient httpClient = HttpClient();
    //final MockHttpClient mockHttpClient = MockHttpClient();
    final responseHttp = HttpServiceResponse(
      success: true,
      message: "{'message': 'test'}",
      body: "{'message': 'test'}",
    );

    when(mockHttpClient.put(endpoint: '/test', body: {'message': 'test'}))
        .thenAnswer((_) async => responseHttp);

    //final response = await httpClient.put(
    //    endpoint: '/test', body: {'message': 'test'});
    final response =
        await mockHttpClient.put(endpoint: '/test', body: {'message': 'test'});

    expect(response, responseHttp);
  });

  test('http_client_test Patch', () async {
    //final HttpClient httpClient = HttpClient();
    //final MockHttpClient mockHttpClient = MockHttpClient();
    final responseHttp = HttpServiceResponse(
      success: true,
      message: "{'message': 'test'}",
      body: "{'message': 'test'}",
    );

    when(mockHttpClient.patch(endpoint: '/test', body: {'message': 'test'}))
        .thenAnswer((_) async => responseHttp);

    //final response = await httpClient.patch(
    //    endpoint: '/test', body: {'message': 'test'});
    final response = await mockHttpClient
        .patch(endpoint: '/test', body: {'message': 'test'});

    expect(response, responseHttp);
  });

  //validate response method
  test('http_client_test validateResponse', () async {
    //final HttpClient httpClient = HttpClient();
    //final MockHttpClient mockHttpClient = MockHttpClient();
    final responseHttp = Response(
      '',
      200,
    );
    final responseHttpAux = HttpServiceResponse(
      success: true,
      message: "{'message': 'test'}",
      body: "{'message': 'test'}",
    );

    when(mockHttpClient.validateResponse(responseHttp))
        .thenAnswer((_) async => responseHttpAux);

    //final response = await httpClient.validateResponse(responseHttp);
    final response = await mockHttpClient.validateResponse(responseHttp);

    expect(response, responseHttpAux);
  });
}
