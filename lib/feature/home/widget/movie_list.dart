import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lateef/core/app_startup.dart';
import 'package:lateef/feature/auth/model/movie_model.dart';
import 'package:lateef/feature/home/cubit/movie_cubit.dart';

import '../../../core/navigation/navigation_service.dart';
import '../../root/route/routes.dart';
import 'movie_item_widget.dart';

class MovieList extends StatefulWidget {
  @override
  State<MovieList> createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  List<MovieModel> movieList = [];

  @override
  void initState() {
    getIt<MovieCubit>().mostPopular();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey,
          automaticallyImplyLeading: false,
          actions: [
            Center(
                child: TextButton(
              onPressed: () {
                getIt<NavigationService>().to(routeName: RootRoutes.favList);
              },
              child: Text(
                "Fav",
                style: TextStyle(color: Colors.white),
              ),
            ))
          ],
        ),
        body: SafeArea(
          child: BlocConsumer(
            bloc: getIt<MovieCubit>(),
            listener: (context, state) {
              if (state is MovieLoading) {}

              if (state is MovieSuccess) {
                movieList = state.allMovie;
              }

              if (state is MovieError) {}
            },
            builder: (context, state) {
              if (state is MovieLoading) {
                return Center(child: CircularProgressIndicator());
              }
              if (state is MovieError) {
                return Center(child: Text(state.message));
              }
              return ListView.separated(
                itemCount: movieList.length,
                itemBuilder: (context, index) {
                  return MovieItemWidget(
                    movie: movieList[index],
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider(
                    height: 5.0,
                  );
                },
              );
            },
          ),
        ));
  }
}
