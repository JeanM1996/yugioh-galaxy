import 'dart:convert';

class ResponseBase {
  final int statusCode;
  final bool error;
  final dynamic data;

  ResponseBase(
      {required this.statusCode, required this.error, required this.data});

  factory ResponseBase.fromJson(Map<String, dynamic> json) {
    return ResponseBase(
      statusCode: json['statusCode'],
      error: json['error'] ?? false,
      data: json['data'],
    );
  }

  //from string
  factory ResponseBase.fromRawJson(String str) =>
      ResponseBase.fromJson(json.decode(str));

  Map<String, dynamic> toJson() {
    return {
      'statusCode': statusCode,
      'error': error,
      'data': data,
    };
  }

  @override
  String toString() {
    return 'ResponseBase{statusCode: $statusCode, error: $error, data: $data}';
  }
}
