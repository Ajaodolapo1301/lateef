import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lateef/core/app_startup.dart';
import 'package:lateef/feature/auth/model/movie_model.dart';
import 'package:lateef/feature/home/cubit/movie_cubit.dart';

class LikeWidget extends StatefulWidget {
  final MovieModel movieModel;
  const LikeWidget({Key? key, required this.movieModel}) : super(key: key);

  @override
  State<LikeWidget> createState() => _LikeWidgetState();
}

class _LikeWidgetState extends State<LikeWidget> {
  late bool isLiked = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // if (widget.reply != null) {
        //   likeAReply();
        // } else if (widget.comment != null) {
        //   likeAComment();
        // }
        //
        setState(() {
          if (isLiked) {
            setState(() {
              isLiked = false;
              getIt<MovieCubit>().delete(widget.movieModel);
            });
          } else {
            setState(() {
              isLiked = true;
              getIt<MovieCubit>().addFavorite(widget.movieModel);
            });
          }
        });
      },
      child: Padding(
        padding: EdgeInsets.only(top: 2.h),
        child: Column(
          children: [
            isLiked
                ? SvgPicture.asset("assets/images/like.svg",
                    color: Color(0XFFFD6150))
                : SvgPicture.asset(
                    "assets/images/like.svg",
                    color: Colors.grey,
                  ),
          ],
        ),
      ),
    );
  }
}
