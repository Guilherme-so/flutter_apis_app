import 'dart:convert';
import 'package:http/http.dart' as http;

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
}
