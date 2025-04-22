import 'package:http/http.dart' as http;
import 'dart:convert';

class SmartAuthService {
  final String baseUrl = "http://faisal99.sa:8081";

  // POST: /api/Auth/Register
  Future<http.Response> register(Map<String, dynamic> body) async {
    final response = await http.post(
      Uri.parse('$baseUrl/api/Auth/Register'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(body),
    );
    return response;
  }

  // POST: /api/Auth/Login
  Future<http.Response> login(Map<String, dynamic> body) async {
    final response = await http.post(
      Uri.parse('$baseUrl/api/Auth/Login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(body),
    );
    return response;
  }

  // POST: /api/Auth/refresh
  Future<http.Response> refresh(String refreshToken) async {
    final response = await http.post(
      Uri.parse('$baseUrl/api/Auth/refresh'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization':
            'Bearer $refreshToken', // Assuming you pass the refresh token in the Authorization header
      },
    );
    return response;
  }

  // POST: /api/Auth/Logout
  Future<http.Response> logout(String accessToken) async {
    final response = await http.post(
      Uri.parse('$baseUrl/api/Auth/Logout'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization':
            'Bearer $accessToken', // Assuming you pass the access token in the Authorization header
      },
    );
    return response;
  }

  // GET: /api/Auth/Email
  Future<http.Response> getEmail(String accessToken) async {
    final response = await http.get(
      Uri.parse('$baseUrl/api/Auth/Email'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization':
            'Bearer $accessToken', // Assuming you pass the access token in the Authorization header
      },
    );
    return response;
  }

  // POST: /api/Auth/ChangePassword
  Future<http.Response> changePassword(
      String accessToken, Map<String, dynamic> body) async {
    final response = await http.post(
      Uri.parse('$baseUrl/api/Auth/ChangePassword'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization':
            'Bearer $accessToken', // Assuming you pass the access token in the Authorization header
      },
      body: jsonEncode(body),
    );
    return response;
  }

  // POST: /api/Auth/RequestPasswordReset
  Future<http.Response> requestPasswordReset(Map<String, dynamic> body) async {
    final response = await http.post(
      Uri.parse('$baseUrl/api/Auth/RequestPasswordReset'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(body),
    );
    return response;
  }

  // POST: /api/Auth/ResetPassword
  Future<http.Response> resetPassword(Map<String, dynamic> body) async {
    final response = await http.post(
      Uri.parse('$baseUrl/api/Auth/ResetPassword'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(body),
    );
    return response;
  }

  // POST: /api/Auth/SendOTP
  Future<http.Response> sendOTP(String email) async {
    final response = await http.post(
      Uri.parse('$baseUrl/api/Auth/SendOTP?email=$email'),
    );
    return response;
  }

  // POST: /api/Auth/verify
  Future<http.Response> verify(String email, String code) async {
    final response = await http
        .post(Uri.parse('$baseUrl/api/Auth/verify?email=$email&code=$code'));
    return response;
  }
}
