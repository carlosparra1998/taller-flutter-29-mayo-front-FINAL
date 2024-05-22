import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:taller_29_mayo_front/app/utils/constants.dart';

class HttpClient {
  static Future<HttpResponse> get(String call, {String? accessToken}) async {
    try {
      var url = Uri.parse(Constants.getCompleteUrl + call);
      var headers = {
        "Accept": "application/json",
        "Content-Type": "application/json; charset=UTF-8"
      };
      if (accessToken != null) {
        headers['Authorization'] = 'Bearer $accessToken';
      }
      http.Response response = await http.get(
        url,
        headers: headers,
      );
      if (response.statusCode != 200) {
        return HttpResponse(
          data: null,
          hasError: true,
          msg: getMsgFromResponse(response.body),
        );
      }
      return HttpResponse(data: response.body, hasError: false);
    } on Exception catch (_) {
      return HttpResponse(
        data: null,
        hasError: true,
        msg: 'Error durante la conexión',
      );
    }
  }

  static Future<HttpResponse> post(
    String call,
    Map<String, dynamic>? json, {
    String? accessToken,
  }) async {
    try {
      var url = Uri.parse(Constants.getCompleteUrl + call);
      var headers = {
        "Accept": "application/json",
        "Content-Type": "application/json; charset=UTF-8"
      };
      if (accessToken != null) {
        headers['Authorization'] = 'Bearer $accessToken';
      }
      http.Response response = await http.post(
        url,
        body: jsonEncode(json),
        headers: headers,
      );
      if (response.statusCode != 200) {
        return HttpResponse(
          data: null,
          hasError: true,
          msg: getMsgFromResponse(response.body),
        );
      }
      return HttpResponse(data: response.body, hasError: false);
    } on Exception catch (_) {
      return HttpResponse(
        data: null,
        hasError: true,
        msg: 'Error durante la conexión',
      );
    }
  }

  static Future<HttpResponse> put(
    String call,
    Map<String, dynamic>? json, {
    String? accessToken,
  }) async {
    try {
      var url = Uri.parse(Constants.getCompleteUrl + call);
      var headers = {
        "Accept": "application/json",
        "Content-Type": "application/json; charset=UTF-8"
      };
      if (accessToken != null) {
        headers['Authorization'] = 'Bearer $accessToken';
      }
      http.Response response = await http.put(
        url,
        body: jsonEncode(json),
        headers: headers,
      );
      if (response.statusCode != 200) {
        return HttpResponse(
          data: null,
          hasError: true,
          msg: getMsgFromResponse(response.body),
        );
      }
      return HttpResponse(data: response.body, hasError: false);
    } on Exception catch (_) {
      return HttpResponse(
        data: null,
        hasError: true,
        msg: 'Error durante la conexión',
      );
    }
  }

  static Future<HttpResponse> delete(
    String call,
    Map<String, dynamic>? json, {
    String? accessToken,
  }) async {
    try {
      var url = Uri.parse(Constants.getCompleteUrl + call);
      var headers = {
        "Accept": "application/json",
        "Content-Type": "application/json; charset=UTF-8"
      };
      if (accessToken != null) {
        headers['Authorization'] = 'Bearer $accessToken';
      }
      http.Response response = await http.delete(
        url,
        body: jsonEncode(json),
        headers: headers,
      );
      if (response.statusCode != 200) {
        return HttpResponse(
          data: null,
          hasError: true,
          msg: getMsgFromResponse(response.body),
        );
      }
      return HttpResponse(data: response.body, hasError: false);
    } on Exception catch (_) {
      return HttpResponse(
        data: null,
        hasError: true,
        msg: 'Error durante la conexión',
      );
    }
  }
}

class HttpResponse {
  dynamic data;
  bool hasError;
  String? msg;
  HttpResponse({required this.data, required this.hasError, this.msg});
}

String? getMsgFromResponse(String body) {
  try {
    return jsonDecode(body)['msg'];
  } catch (_) {
    return null;
  }
}
