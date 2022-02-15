import 'dart:io';
import 'package:delta_flutter_assessment/utils/exception_handler.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class ApiHelper {

  final String _baseUrl = "https://dog.ceo/api/";

  Future<dynamic> get(String url) async {
    var responseJson;
    try {
      final Uri uri = Uri.parse((_baseUrl + '' + url));
      final response = await http.get(uri);
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }
  dynamic _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        return json.decode(response.body.toString());
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error with StatusCode : ${response.statusCode}');
    }
  }
}