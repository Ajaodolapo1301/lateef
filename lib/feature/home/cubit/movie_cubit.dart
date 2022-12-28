import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:lateef/feature/auth/model/movie_model.dart';
import 'package:meta/meta.dart';

import '../../../core/network/network_request.dart';
import '../service/api_service.dart';

part 'movie_state.dart';

ValueNotifier<List<MovieModel>> listOfMovies = ValueNotifier([]);

class MovieCubit extends Cubit<MovieState> {
  final MovieApiService apiService;
  MovieCubit({required this.apiService}) : super(MovieInitial());

  void mostPopular() async {
    emit(MovieLoading());

    try {
      var res = await apiService.mostPopular();

      if (res.isSuccessful) {
        List<MovieModel> allMovieModel = (res.data["items"] as List)
            .map((e) => MovieModel.fromJson(e))
            .toList();
        emit(MovieSuccess(allMovie: allMovieModel));
      } else {
        emit(MovieError(message: ''));
      }
    } catch (ex) {
      if (ex is DioError) {
        var errorMessage = networkErrorHandler(ex);
        emit(MovieError(message: errorMessage));
      }
    }
  }

  void getFav() {
    emit(FavouriteList(list: listOfMovies.value));
  }

  void addFavorite(MovieModel model) {
    listOfMovies.value.add(model);

    emit(FavouriteList(list: listOfMovies.value));
  }

  void delete(MovieModel model) {
    listOfMovies.value.remove(model);
    emit(FavouriteList(list: listOfMovies.value));
  }
}
