import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {

  static const String baseUrl = "http://10.0.2.2:8080/api";

  static Future<List<dynamic>> getTasks() async {

    final response = await http.get(Uri.parse("$baseUrl/tasks"));

    if(response.statusCode == 200){
      return jsonDecode(response.body);
    } else {
      throw Exception("Failed to load tasks");
    }
  }

}