import 'package:get_it/get_it.dart';
import 'package:lateef/feature/home/cubit/movie_cubit.dart';
import 'package:lateef/feature/home/service/api_service.dart';

import '../../core/network/network_request.dart';

void setupMovieServices(GetIt ioc) {
  ioc.registerSingleton<MovieCubit>(MovieCubit(
    apiService: MovieApiService(
      http: HttpService(
        baseUrl: baseUrl,
      ),
    ),
  ));
}
