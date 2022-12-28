import 'dart:async';

import 'package:dio/dio.dart';

import '../../../core/network/network_request.dart';

const baseUrl = "http://imdb-api.com/";
const apiKey = "k_pk92vapj";

class MovieApiService {
  final HttpService http;
  MovieApiService({required this.http});

  Future<Response> mostPopular() async {
    return http.getRequest("API/MostPopularMovies/$apiKey");
  }
}
