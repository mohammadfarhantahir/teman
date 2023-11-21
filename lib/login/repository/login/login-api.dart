import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiHelper {
  final String baseUrl;

  ApiHelper(this.baseUrl);

  Future<Map<String, dynamic>> login(String username, String password) async {
    final url = Uri.parse('$baseUrl/login');


    try {
      final response = await http.post(
        url,
        body: {'email': username, 'password': password},
      );

      if (response.statusCode == 200) {
        // Successful login
        return json.decode(response.body);
      } else {
        // Print response body on failure
        print('Failed to login. Response: ${response.body}');

        throw Exception('Failed to login');

      }
    } catch (e) {
      print('Exception during login: $e');
      throw Exception('Failed to login');
    }

  }
}
