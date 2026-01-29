import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/movie.dart';

class ApiService {
  // TODO: Put your TMDB API Key here
  final String apiKey = "a5a41f2eec2389df89907fdd3251a499";
  final String baseUrl = "https://api.themoviedb.org/3";

  Future<List<Movie>> getTrendingMovies() async {
    final Uri url = Uri.parse('$baseUrl/trending/movie/week?api_key=$apiKey');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List results = data['results'];
      return results.map((json) => Movie.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load movies');
    }
  }

  Future<List<Movie>> getTopRatedMovies() async {
    final Uri url = Uri.parse('$baseUrl/movie/top_rated?api_key=$apiKey');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List results = data['results'];
      return results.map((json) => Movie.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load movies');
    }
  }
}