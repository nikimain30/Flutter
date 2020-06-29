import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:neostore/model/register.dart';


class NetworkUtil {
  static NetworkUtil instance = new NetworkUtil.internal();
  NetworkUtil.internal();
  factory NetworkUtil() {
    return instance;
  }

  final JsonDecoder decoder = new JsonDecoder();

  Future<dynamic> get(String url) {
    return http.get(url).then(( http.Response response) {
      final String res = response.body;
      final int statusCode = response.statusCode;

      if (statusCode < 200 || statusCode > 400 || json == null) {
        throw new Exception("Error while fetching data");
      }
      return decoder.convert(res);
    });
  }

  Future<dynamic> post(String url, {Map body,headers}) {
    return http
        .post(url, body: body, headers: headers)
        .then((http.Response response) {
      final String res = response.body;
      final int statusCode = response.statusCode;

      if (statusCode == 200) {
        var data = json.decode(res);
        return data;
      } else {
        throw Exception('Failed to get data');
      }
    });
  }
}