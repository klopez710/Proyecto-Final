import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movieapp/constants.dart';
import 'package:movieapp/models/movie.dart';

class Api {
  static const _trendingUrl =
      'https://api.themoviedb.org/3/trending/movie/day?language=es-ES&api_key=${Constants.apiKey}';

  static const _popularesgUrl =
      'https://api.themoviedb.org/3/movie/top_rated?language=es-Es&api_key=${Constants.apiKey}';

  static const _proximasgUrl =
      'https://api.themoviedb.org/3/movie/upcoming?language=es-Es&api_key=${Constants.apiKey}';

  Future<List<Movie>> getTendencias() async {
    final response = await http.get(Uri.parse(_trendingUrl));
    if (response.statusCode == 200) {
      final decodeData = json.decode(response.body)['results'] as List;
      return decodeData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('No ha respondido correctamente');
    }
  }

  Future<List<Movie>> getPopulares() async {
    final response = await http.get(Uri.parse(_popularesgUrl));
    if (response.statusCode == 200) {
      final decodeData = json.decode(response.body)['results'] as List;
      return decodeData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('No ha respondido correctamente');
    }
  }

  Future<List<Movie>> getProximas() async {
    final response = await http.get(Uri.parse(_proximasgUrl));
    if (response.statusCode == 200) {
      final decodeData = json.decode(response.body)['results'] as List;
      return decodeData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('No ha respondido correctamente');
    }
  }
}
