import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movieapp/constants.dart';
import 'package:movieapp/models/movie.dart';

class Api {
  static const _trendingUrl =
      'https://api.themoviedb.org/3/trending/movie/day?language=es-ES&api_key=${Constants.apiKey}';

  Future<List<Movie>> getTendencias() async {
    final response = await http.get(Uri.parse(_trendingUrl));
    if (response.statusCode == 200) {
      final decodeData = json.decode(response.body)['results'] as List;
      return decodeData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('No ha respondido correctamente');
    }
  }
}
