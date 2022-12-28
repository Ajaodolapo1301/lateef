import 'package:flutter/material.dart';
import 'package:lateef/feature/home/widget/movie_list.dart';

class HomeRootWidget extends StatelessWidget {
  final bool isCurrent;

  const HomeRootWidget({required Key key, required this.isCurrent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Offstage(
      offstage: !isCurrent,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: MovieList(),
      ),
    );
  }
}
