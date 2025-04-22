import 'package:http/http.dart' as http;
import 'dart:convert';

class UserService {
  final String baseUrl =
      "http://faisal99.sa:8081/api/User"; // Corrected base URL

  // GET /getallusers
  Future<http.Response> getAllUsers() async {
    final response = await http.get(Uri.parse('$baseUrl/getallusers'));
    return response;
  }

  // DELETE /DeleteByUserID/{userid}
  Future<http.Response> deleteUser(String userId) async {
    final response =
        await http.delete(Uri.parse('$baseUrl/DeleteByUserID/$userId'));
    return response;
  }

  // POST /upload-photo
  Future<http.Response> uploadPhoto(String filePath) async {
    var request =
        http.MultipartRequest('POST', Uri.parse('$baseUrl/upload-photo'));
    var picture = await http.MultipartFile.fromPath(
        'picture', filePath); // 'picture' is the field name
    request.files.add(picture);
    var response = await request.send();
    return http.Response.fromStream(response);
  }

  // POST /AddPlayer
  Future<http.Response> addPlayer(Map<String, dynamic> body) async {
    final response = await http.post(
      Uri.parse('$baseUrl/AddPlayer'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(body),
    );
    return response;
  }

  // GET /Player-photo
  Future<http.Response> getPlayerPhoto() async {
    final response = await http.get(Uri.parse('$baseUrl/Player-photo'));
    return response;
  }

  // GET /Get-AllUserphotos
  Future<http.Response> getAllUserPhotos() async {
    final response = await http.get(Uri.parse('$baseUrl/Get-AllUserphotos'));
    return response;
  }

  // DELETE /delete-photo/{id}
  Future<http.Response> deletePhoto(String id) async {
    final response = await http.delete(Uri.parse('$baseUrl/delete-photo/$id'));
    return response;
  }
}
