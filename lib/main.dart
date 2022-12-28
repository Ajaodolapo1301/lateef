import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:loader_overlay/loader_overlay.dart';

import 'core/app_startup.dart';
import 'core/navigation/navigation_service.dart';
import 'core/navigation/routes.dart';
import 'feature/root/route/routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  await AppStartUp().setUp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (BuildContext context, child) {
          return GlobalLoaderOverlay(
            overlayColor: const Color(0xFF354052),
            overlayOpacity: 0.5,
            useDefaultLoading: false,
            disableBackButton: false,
            overlayWidget: SizedBox(
              width: double.maxFinite,
              height: double.maxFinite,
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Container(
                    height: 56.w,
                    width: 56.w,
                    padding: EdgeInsets.all(20.w),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                  ),
                  Container(
                      height: 56.w,
                      width: 56.w,
                      padding: EdgeInsets.all(15.w),
                      child: CircularProgressIndicator())
                ],
              ),
            ),
            child: GestureDetector(
              onTap: () {
                FocusScopeNode currentFocus = FocusScope.of(context);

                if (!currentFocus.hasPrimaryFocus &&
                    currentFocus.focusedChild != null) {
                  currentFocus.focusedChild?.unfocus();
                }
              },
              child: MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Brit',
                themeMode: ThemeMode.light,
                // theme: lightTheme,

                navigatorKey: GetIt.I<NavigationService>().navigatorKey,
                initialRoute: RootRoutes.initial,
                onGenerateRoute: routes,
              ),
            ),
          );
        });
  }
}
