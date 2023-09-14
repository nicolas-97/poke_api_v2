import 'package:http/http.dart' as http;
import 'package:mvvm_basic/utils/api/api_exceptions.dart';

class ApiClient {

  static ApiClient instance() => ApiClient();
  
  final String _domain = 'pokeapi.co';

  Uri _setUrl(String resource){
    return Uri.https(_domain, resource);
  }

  Future<http.Response> get(String resource) async {
    final response = await http.get(_setUrl(resource));
    return _processResponse(response);
  }

  Future<http.Response> post(String resource, Map data) async {
    final response = await http.post(_setUrl(resource), body: data);
    return _processResponse(response);
  }

  http.Response _processResponse(http.Response response) {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return response;
    } else if (response.statusCode >= 400 && response.statusCode < 500) {
      throw BadRequestException('Bad request');
    } else if (response.statusCode == 500) {
      throw ServerException('Server error');
    } else {
      throw ApiException('Unknown error');
    }
  }
}