import 'dart:convert';
import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class OdooAuthenticationCall {
  static Future<ApiCallResponse> call({
    String? user = '',
    String? pass = '',
  }) async {
    final ffApiRequestBody = '''
{
  "jsonrpc": "2.0",
  "method": "call",
  "params": {
    "db": "postgres",
    "login": "$user",
    "password": "$pass"
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'OdooAuthentication',
      apiUrl: 'https://nagaadhalls.com/web/session/authenticate',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Connection': 'keep-alive',
        'User-Agent': 'PostmanRuntime/7.42.0',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? apiaccessdenied(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.error.data.message''',
      ));
  static dynamic resultuserid(dynamic response) => getJsonField(
        response,
        r'''$.result.uid''',
      );
  static dynamic resultusername(dynamic response) => getJsonField(
        response,
        r'''$.result.username''',
      );
}

class ItemsCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'Items',
      apiUrl: 'https://nagaadhalls.com/api/items/get_items',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? name(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].name''',
      ));
  static int? quantity(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$[:].quantity''',
      ));
  static double? costprice(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$[:].cost_price''',
      ));
  static double? totalprice(dynamic response) =>
      castToType<double>(getJsonField(
        response,
        r'''$[:].total_price''',
      ));
}

class ProductsCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'Products',
      apiUrl: 'https://nagaadhalls.com/api/products/get_products',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List? product(dynamic response) => getJsonField(
        response,
        r'''$.products''',
        true,
      ) as List?;
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
