import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../auth/model/movie_model.dart';
import 'movie_item_widget.dart';

class DetailsPage extends StatefulWidget {
  final MovieModel movie;
  const DetailsPage({Key? key, required this.movie}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  MovieModel? movie;
  List<String> slides = [];
  @override
  void initState() {
    movie = widget.movie;
    // the API returns one image, hence the duplicate to show the indicators
    slides = [movie!.image!, movie!.image!, movie!.image!];

    super.initState();
  }

  double currentPage = 0.0;
  final _pageViewController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 300.h,
              child: PageView.builder(
                  controller: _pageViewController,
                  itemCount: slides.length,
                  itemBuilder: (BuildContext context, int index) {
                    _pageViewController.addListener(() {
                      setState(() {
                        currentPage = _pageViewController.page!;
                      });
                    });
                    return ImageView(
                      item: slides[index],
                    );
                  }),
            ),
            Align(
                alignment: Alignment.center,
                child: Container(
                  margin: EdgeInsets.only(top: 10.0.h),
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: slides
                        .asMap()
                        .keys
                        .map((e) =>
                            Indicator(index: e, currentPage: currentPage))
                        .toList(),
                  ),
                )),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Lorem text Messages',
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 10.0.h),
                  Row(
                    children: [
                      LabelWidget(
                        text: "Like",
                        color: Colors.white,
                        borderColor: Colors.black,
                        icon: Icons.add,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      LabelWidget(
                        text: "Comment",
                        color: Colors.white,
                        borderColor: Colors.black,
                        icon: Icons.message,
                      )
                    ],
                  ),
                  SizedBox(height: 10.0.h),
                  Text(
                    "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available.",
                    style: TextStyle(
                        fontSize: 12.0.sp, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}

class ImageView extends StatelessWidget {
  final String? item;
  const ImageView({Key? key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400.0.h,
      color: Colors.grey,
      child: CachedNetworkImage(
        imageUrl: item!,
        fit: BoxFit.cover,
      ),
    );
  }
}

class Indicator extends StatelessWidget {
  final double currentPage;
  final int index;
  const Indicator({Key? key, required this.index, required this.currentPage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 3.0),
      height: 10.0,
      width: 10.0,
      decoration: BoxDecoration(
          color: currentPage.round() == index ? Colors.grey : Colors.black,
          borderRadius: BorderRadius.circular(10.0)),
    );
  }
}
