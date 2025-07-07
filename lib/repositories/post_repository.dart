import 'dart:convert';
import 'dart:developer';

import 'package:counter_bloc/models/posts/post_model.dart';
import 'package:http/http.dart' as http;

class PostRepository {
  PostRepository();

  Future<List<PostModel>?> fetch() async {
    try {
      final response = await http.get(
        Uri.parse('http://localhost:5500/mockjson.json'),
      );

      log(response.toString());

      if (response.statusCode == 200) {
        final body = jsonDecode(response.body) as List;
        return body.map<PostModel>((i) => PostModel.fromJson(i)).toList();
      }
      return null;
    } catch (e) {
      throw Exception("Error while fetching data ${e.toString()}");
    }
  }
}
