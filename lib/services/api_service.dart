import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:toontoonflix/model/webtoon_model.dart';

class ApiService {
  final String baseUrl = "https://webtoon-crawler.nomadcoders.workers.dev";
  final String today = "today";

  Future<List<WebtoonModel>> getTodaysToons() async {
    final url = Uri.parse('$baseUrl/$today');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return jsonDecode(response.body)
          .map((json) => WebtoonModel.fromJson(json))
          .toList();
    }
    throw Error();
  }
}
