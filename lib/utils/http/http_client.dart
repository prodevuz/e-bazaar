import 'dart:convert';
import 'package:http/http.dart' as http;

class HttpHelper {
  HttpHelper._(); // Private constructor to prevent instantiation of the class

  static const String _baseUrl = "https://e-bazaar.uz"; // Base URL for the API

  // Method to perform a GET request
  static Future<Map<String, dynamic>> get(String endpoint) async {
    final response = await http.get(Uri.parse('$_baseUrl/$endpoint')); // Perform the GET request
    return _handleResponse(response); // Handle the response
  }

  // Method to perform a POST request
  static Future<Map<String, dynamic>> post(String endpoint, dynamic data) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/$endpoint'), // Construct the full URL for the POST request
      headers: {'Content-Type': 'application/json'}, // Set the request headers
      body: json.encode(data), // Encode the data as JSON and include it in the request body
    );
    return _handleResponse(response); // Handle the response
  }

  // Method to perform a PUT request
  static Future<Map<String, dynamic>> put(String endpoint, dynamic data) async {
    final response = await http.put(
      Uri.parse('$_baseUrl/$endpoint'), // Construct the full URL for the PUT request
      headers: {'Content-Type': 'application/json'}, // Set the request headers
      body: json.encode(data), // Encode the data as JSON and include it in the request body
    );
    return _handleResponse(response); // Handle the response
  }

  // Method to perform a DELETE request
  static Future<Map<String, dynamic>> delete(String endpoint) async {
    final response = await http.delete(
      Uri.parse('$_baseUrl/$endpoint'), // Construct the full URL for the DELETE request
    );
    return _handleResponse(response); // Handle the response
  }

  // Method to handle the HTTP response
  static Map<String, dynamic> _handleResponse(http.Response response) {
    if (response.statusCode == 200) {
      return json.decode(response.body); // If the response status code is 200, decode the response body and return it
    } else {
      throw Exception('Failed to load data: ${response.statusCode}'); // If the response status code is not 200, throw an exception
    }
  }
}
