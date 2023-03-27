import 'dart:convert';
import 'package:http/http.dart' as http;

import 'joke_type.dart';

class JokesCategories {
  final url = 'https://api.chucknorris.io/jokes';

  Future<List<String>> getCategories() async {
    try {
      final response = await http.get(Uri.parse('$url/categories'));
      final data = jsonDecode(response.body) as List;
      return List.generate(data.length, (index) => data[index]);
    } catch (error) {
      return Future.error(error.toString());
    }
  }

  Future<JokeType> getJokesByCategory(String category) async {
    final response =
        await http.get(Uri.parse('$url/random?category=$category'));
    final data =
        JokeType.fromJson(jsonDecode(response.body) as Map<String, dynamic>);

    return data;
  }
}
