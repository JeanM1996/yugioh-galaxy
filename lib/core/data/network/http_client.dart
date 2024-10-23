import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:yugiohgalaxy/core/data/exceptions/no_internet_exception.dart';
import 'package:yugiohgalaxy/core/data/exceptions/server_exception.dart';
import 'package:yugiohgalaxy/core/data/exceptions/unauthorized_exception.dart';
import 'package:yugiohgalaxy/core/presentation/utils/string_extension.dart';

final HttpClient httpClient = HttpClient();

class HttpClient {
  String url = dotenv.get('URL_API');

  Future<Map<String, String>?> headers() async {
    return {
      HttpHeaders.contentTypeHeader: 'application/json',
    };
  }

  /// [get]
  Future<HttpServiceResponse> get({
    required String endpoint,
    Client? client,
  }) async {
    final httpClient = client ?? Client();
    try {
      final response = await httpClient
          .get(Uri.parse('$url$endpoint'), headers: await headers())
          .timeout(
        const Duration(seconds: 60),
        //resend for 1 time if timeout
        onTimeout: () async {
          throw TimeoutException("{'error': 'Timeout'}");
        },
      );

      return validateResponse(response);
    } on UnauthorizedException {
      rethrow;
    } on NoInternetException {
      rethrow;
    } on ServerException {
      rethrow;
    } catch (e) {
      return HttpServiceResponse(success: false, message: '$e');
    }
  }

  Future<HttpServiceResponse> post({
    required String endpoint,
    required Map<String, dynamic> body,
    String? transactionId,
    Client? client,
  }) async {
    final httpClient = client ?? Client();

    try {
      if (kDebugMode) {
        print('[${DateFormat("hh:mm:ss").format(DateTime.now())}][post]'
            '\nendpoint: $endpoint'
            '\nbody: $body'
            '\nheaders: ${await headers()}');
      }
      final response = await httpClient.post(
        Uri.parse('$url$endpoint'),
        body: json.encode(body),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
        },
      ).timeout(
        const Duration(seconds: 60),
        onTimeout: () async {
          throw TimeoutException("{'error': 'Timeout'}");
        },
      );

      return await validateResponse(
        response,
        bodyRequest: json.encode(body),
        transactionId: transactionId ?? body['transactionId'] as String?,
      );
    } catch (e) {
      return HttpServiceResponse(
        success: false,
        body: '$e',
        message: 'Error: $e',
      );
    }
  }

  //post multipart
  Future<HttpServiceResponse> postMultipart({
    required String endpoint,
    required Map<String, String> body,
    required List<int> file,
    required String fileName,
    String? transactionId,
    Client? client,
  }) async {
    try {
      final request = MultipartRequest(
        'POST',
        Uri.parse('$url$endpoint'),
      );
      request.headers.addAll({
        HttpHeaders.contentTypeHeader: 'application/json',
      });
      request.fields.addAll(body);
      request.files.add(
        MultipartFile.fromBytes(
          'file',
          file,
          filename: fileName,
        ),
      );

      final response = await request.send().timeout(
        const Duration(minutes: 5),
        onTimeout: () async {
          throw TimeoutException("{'error': 'Timeout'}");
        },
      );
      final responseString = await response.stream.bytesToString();

      final responseFinal = Response.bytes(
        utf8.encode(responseString),
        response.statusCode,
        headers: response.headers,
      );
      return await validateResponse(
        responseFinal,
        bodyRequest: json.encode(body),
        transactionId: transactionId,
      );
    } catch (e) {
      return HttpServiceResponse(
        success: false,
        body: '$e',
        message: 'Error: $e',
      );
    }
  }

  //put
  Future<HttpServiceResponse> put({
    required String endpoint,
    required Map<String, dynamic> body,
    String? transactionId,
    Client? client,
  }) async {
    final httpClient = client ?? Client();

    try {
      final response = await httpClient.put(
        Uri.parse('$url$endpoint'),
        body: json.encode(body),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
        },
      ).timeout(
        const Duration(seconds: 60),
        onTimeout: () async {
          throw TimeoutException("{'error': 'Timeout'}");
        },
      );

      return await validateResponse(
        response,
        bodyRequest: json.encode(body),
        transactionId: transactionId,
      );
    } catch (e) {
      return HttpServiceResponse(
        success: false,
        body: '$e',
        message: 'Error: $e',
      );
    }
  }

  //patch
  Future<HttpServiceResponse> patch({
    required String endpoint,
    required Map<String, dynamic> body,
    //body as list
    List<Map<String, dynamic>>? bodyList,
    String? transactionId,
    Client? client,
  }) async {
    final httpClient = client ?? Client();

    try {
      final response = await httpClient.patch(
        Uri.parse('$url$endpoint'),
        body: bodyList != null ? jsonEncode(bodyList) : json.encode(body),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
        },
      ).timeout(
        const Duration(seconds: 60),
        onTimeout: () async {
          throw TimeoutException("{'error': 'Timeout'}");
        },
      );

      return await validateResponse(
        response,
        transactionId: transactionId,
      );
    } catch (e) {
      return HttpServiceResponse(
        success: false,
        body: '$e',
        message: 'Error: $e',
      );
    }
  }

  Future<HttpServiceResponse> validateResponse(
    Response response, {
    String bodyRequest = '',
    String? transactionId,
  }) async {
    final body =
        response.request?.method != 'GET' ? '\n[body]: ${response.body}' : '';

    if (kDebugMode) {
      print('[${DateFormat("""
hh:mm:ss""").format(DateTime.now())}] [http-service] [validateResponse]'
          '$body'
          '\ncode: ${response.statusCode}'
          '\nrequest: ${response.request}');
    }

    var success = false;

    switch (response.statusCode) {
      case 401:
        throw UnauthorizedException();
      case 400:
        throw ServerException('Bad request');
      case 500:
        throw ServerException('Internal server error');
      case 200:
        success = true;
      case 201:
        success = true;
      case 202:
        success = true;

      default:
        success = false;
        break;
    }

    return HttpServiceResponse(
      success: success,
      message: response.body,
      body: response.body,
    );
  }

  String _curlRequest(
    String method,
    String url,
    Map<String, String> headers,
    String body,
  ) {
    // Construye la solicitud cURL
    var curlRequest = "curl -X $method '$url'";

    // Agrega las cabeceras a la solicitud cURL
    headers.forEach((key, value) {
      curlRequest += " -H '${key.capitalize()}: $value'";
    });

    // Si hay un cuerpo en la solicitud, lo agrega
    if (body.isNotEmpty) {
      curlRequest += " -d '$body'";
    }

    return curlRequest;
  }

  //String to reduce the token to lower than 100 characters using the first split . and the last split .
  String reduceToken(String? token) {
    if (token == null) {
      return '';
    } else {
      final tokenSplit = token.split('.');
      return '${tokenSplit.first}.${tokenSplit.last}';
    }
  }
}

class HttpServiceResponse {
  HttpServiceResponse({
    this.success,
    this.message,
    this.body,
  });

  HttpServiceResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'] as bool?;
    message = json['message'] as String?;
    body = json['body'] as String?;
  }
  bool? success;
  String? message;
  String? body;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    data['body'] = body;
    return data;
  }
}
