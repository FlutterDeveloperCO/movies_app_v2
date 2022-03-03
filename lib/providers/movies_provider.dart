import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import 'package:app_movies_v2/models/models.dart';

class MoviesProvider extends ChangeNotifier {
  String _baseUrl = 'api.themoviedb.org';
  String _apiKey = '00cff8018f74180338d80530a1cac225';
  String _language = 'en-US';

  List<Movie> onDisplayMovies = [];
  List<Movie> popularMoviesNow = [];
  
  int _popularPage = 0;

  MoviesProvider() {
    print('MoviesProvider initialized');

    getDisplayMovies();
    getPopularMovies();
  }

  Future<String>_getJsonData(String endPoint, int page) async {
    var url = Uri.https(_baseUrl, endPoint, {
      'api_key': _apiKey,
      'language': _language,
      'page': '$page',
    });

    final response = await http.get(url);
    return response.body;
  }

  getDisplayMovies() async {

    final jsonData = await _getJsonData('3/movie/now_playing', 1);
    final nowPlayingResponse = NowPlayingResponse.fromJson(jsonData);

    onDisplayMovies = nowPlayingResponse.results;

    notifyListeners();
  }

  getPopularMovies() async {

    _popularPage++;

    final jsonData = await _getJsonData('3/movie/popular', _popularPage);
    final popularResponse = PopularResponse.fromJson(jsonData);

    popularMoviesNow = [...popularMoviesNow, ... popularResponse.results];

    notifyListeners();
  }
}
