part of 'movie_cubit.dart';

@immutable
abstract class MovieState {}

class MovieInitial extends MovieState {}

class MovieLoading extends MovieState {}

class MovieSuccess extends MovieState {
  List<MovieModel> allMovie;
  MovieSuccess({required this.allMovie});
}

class MovieError extends MovieState {
  final String message;
  MovieError({required this.message});
}
