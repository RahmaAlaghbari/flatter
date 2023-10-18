import 'package:dio/dio.dart';

class AuthenticationProvider {
  final Dio _dio;

  AuthenticationProvider(this._dio);

  Future<bool> login(String email, String password) async {
    try {
      // Make an API request to authenticate the user
      // Replace 'your_login_endpoint' with your actual login endpoint
      Response response = await _dio.post('your_login_endpoint', data: {
        'email': email,
        'password': password,
      });

      // Check the response and return the login status
      if (response.statusCode == 200) {
        // Login successful
        return true;
      } else {
        // Login failed
        return false;
      }
    } catch (error) {
      // Handle any errors that occur during the login process
      print('Login error: $error');
      return false;
    }
  }
}