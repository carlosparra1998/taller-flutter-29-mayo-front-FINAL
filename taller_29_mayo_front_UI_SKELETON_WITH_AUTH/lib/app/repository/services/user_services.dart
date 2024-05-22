import 'package:taller_29_mayo_front/app/repository/http_client.dart';

class UserServices {
  static Future<HttpResponse> registerUser(
    String userName,
    String password,
  ) async {
    Map<String, dynamic> data = {'userName': userName, 'password': password};
    return await HttpClient.post('register', data);
  }

  static Future<HttpResponse> loginUser(
    String userName,
    String password,
  ) async {
    Map<String, dynamic> data = {'userName': userName, 'password': password};
    return await HttpClient.post('login', data);
  }
}
