import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movies_app/models/models.dart';
import 'package:movies_app/models/top_rate.dart';

class MoviesProvider extends ChangeNotifier {
  final String _apiKey = '22c2bd815ccb64ce3211dea8c612faaa';
  final String _baseUrl = 'api.themoviedb.org';
  final String _language = 'en-US';

  List<Movie> onDisplayMovies = [];
  List<Movie> popularMovies = [];
  List<Movie> topMovies = [];

  int popularPage = 0;
  int topPage = 0;

  MoviesProvider() {
    print('MovieProvider: constructor');
    getOnDisplayMovies();
    getPopularMovies();
    getTopRateMovies();
  }

  Future<String> _getJsonData(String endpoint, [int page = 1]) async {
    final url = Uri.https(_baseUrl, endpoint,
        {'api_key': _apiKey, 'language': _language, 'page': '$page'});

    // Await the http get response, then decode the json-formatted response.
    final response = await http.get(url);
    return response.body;
  }

  getOnDisplayMovies() async {
    final jsonData = await _getJsonData('3/movie/now_playing');
    final nowPlayingResponse = NowPlaying.fromJson(jsonData);

    onDisplayMovies = nowPlayingResponse.results;

    notifyListeners();
  }

  getPopularMovies() async {
    popularPage++;
    final jsonData = await _getJsonData('3/movie/popular');
    final popularResponse = PopularResponse.fromJson(jsonData);

    popularMovies = [...popularMovies, ...popularResponse.results];
    notifyListeners();
  }

  getTopRateMovies() async {
    topPage++;
    final jsonData = await _getJsonData('/3/movie/top_rated', popularPage);
    final topResponse = TopRate.fromJson(jsonData);

    topMovies = topResponse.results;

    notifyListeners();
  }
}
