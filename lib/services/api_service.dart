import 'dart:convert';
import 'package:registring_items_2/models/users_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  //Base URL for API

  final String baseUrl = 'https://randomuser.me/api/?results=20';

  Future<List<GetUsers>> getUsers() async {
    final response = await http.get(Uri.parse('$baseUrl'));
    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      List<dynamic> usersList = jsonResponse['results']; // Access the list
      return usersList
          .map((x) => GetUsers.fromJson(x as Map<String, dynamic>))
          .toList();
    } else {
      throw Exception("Failed to load data");
    }
  }
}
