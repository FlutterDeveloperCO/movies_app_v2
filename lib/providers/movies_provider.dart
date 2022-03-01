import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import 'package:app_movies_v2/models/models.dart';

class MoviesProvider extends ChangeNotifier {
  String _baseUrl = 'api.themoviedb.org';
  String _apiKey = '00cff8018f74180338d80530a1cac225';
  String _language = 'en-US';

  List<Movie> onDisplayMovies = [];
  List<Movie> popularMoviesNow = [];

  MoviesProvider() {
    print('MoviesProvider initialized');

    getDisplayMovies();
    getPopularMovies();
  }

  getDisplayMovies() async {
    var url = Uri.https(_baseUrl, '3/movie/now_playing', {
      'api_key': _apiKey,
      'language': _language,
      'page': '1',
    });

    final response = await http.get(url);

    final nowPlayingResponse = NowPlayingResponse.fromJson(response.body);

    onDisplayMovies = nowPlayingResponse.results;

    notifyListeners();
  }

  getPopularMovies() async {
    var url = Uri.https(_baseUrl, '3/movie/popular', {
      'api_key': _apiKey,
      'language': _language,
      'page': '1',
    });

    final response = await http.get(url);

    final popularResponse = PopularResponse.fromJson(response.body);

    popularMoviesNow = [...popularMoviesNow, ... popularResponse.results];

    notifyListeners();
  }
}
