import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lateef/feature/auth/model/movie_model.dart';
import 'package:lateef/feature/home/cubit/movie_cubit.dart';

import '../../../core/app_startup.dart';
import 'fav_item_widget.dart';

class FavoritesList extends StatefulWidget {
  const FavoritesList({Key? key}) : super(key: key);

  @override
  State<FavoritesList> createState() => _FavoritesListState();
}

class _FavoritesListState extends State<FavoritesList> {
  List<MovieModel> listOfFav = [];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getIt<MovieCubit>().getFav();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text("Favorites"),
      ),
      body: SafeArea(
          child: BlocConsumer(
        bloc: getIt<MovieCubit>(),
        listener: (context, state) {
          if (state is FavouriteList) {
            listOfFav = state.list;
          }
        },
        builder: (context, state) {
          if (listOfFav.isEmpty) {
            return Center(child: Text("List is empty"));
          }

          return ListView.separated(
            itemCount: listOfFav.length,
            itemBuilder: (context, index) {
              return FavItemWidget(
                movie: listOfFav[index],
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const Divider(
                height: 5.0,
              );
            },
          );
        },
      )),
    );
  }
}
