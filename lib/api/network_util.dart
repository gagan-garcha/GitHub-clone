
import 'package:http/http.dart' as http;

class NetworkUtil {
  static NetworkUtil _instance =  NetworkUtil.internal();

  NetworkUtil.internal();
  factory NetworkUtil() => _instance;

  Future<http.Response> get(String url, Map headers) async {
    return http
        .get(url, headers: headers)
        .then((http.Response response) => handleResponse(response));
  }

  Future<http.Response> post(String url, {Map headers, body, encoding}) {
    return http
        .post(url, headers: headers, body: body, encoding: encoding)
        .then((http.Response response) => handleResponse(response, body: body));
  }

  Future<http.Response> put(String url, {Map headers, body, encoding}) {
    return http
        .put(url, headers: headers, body: body, encoding: encoding)
        .then((http.Response response) => handleResponse(response, body: body));
  }

  Future<http.Response> delete(String url, {Map headers}) {
    return http
        .delete(url, headers: headers)
        .then((http.Response response) => handleResponse(response));
  }
}

Future<http.Response> handleResponse(http.Response response, {body}) async {
  final statusCode = response.statusCode;
  bool debugMode = false;
  assert(debugMode = true);

  if(debugMode) print('${response.request.url} \n status :${response.statusCode} \n ${response.body}');

  switch (statusCode) {
    case 500:
      return throw InternalServerException();
    default:
      return response;
  }
}

class InternalServerException implements Exception{

  String errorMessage() {
     print("Internal Server Error");
  }

}