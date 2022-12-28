import 'package:flutter/material.dart';

import '../../feature/auth/root.dart';
import '../../feature/auth/route/route.dart';
import '../../feature/home/widget/details.dart';
import '../../feature/root/root.dart';
import '../../feature/root/route/routes.dart';
import '../../feature/root/splash_screen.dart';
import 'animations/fade_route.dart';
import 'animations/slide_up.dart';

// ignore: prefer_function_declarations_over_variables
var routes = (RouteSettings settings) {
  switch (settings.name) {
    case RootRoutes.initial:
      return FadeRoute(
        page: const SplashScreen(),
      );
    case RootRoutes.home:
      Map? args = settings.arguments as Map?;
      if (settings.arguments == null) {
        args = {"index": 0};
      }
      return SlideUpRoute(
          page: RootWidget(
        index: args!["index"],
      ));
    case AuthRoutes.login:
      return FadeRoute(
        page: const LoginScreen(),
      );
    case RootRoutes.detailsPage:
      Map args = settings.arguments as Map;
      return FadeRoute(
        page: DetailsPage(
          movie: args["movie"],
        ),
      );
  }

  return null;
};
