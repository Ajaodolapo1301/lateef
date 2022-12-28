import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';

import '../feature/auth/di.dart';
import '../feature/home/di.dart';
import 'di.dart';

// This is our global ServiceLocator
GetIt getIt = GetIt.instance;

class AppStartUp {
  Future<void> setUp() async {
    getIt.allowReassignment = true;
    await initializedFirebase();
    await registerServices(getIt);

    loadStartUpConfig();
  }

  Future<void> registerServices(ioc) async {
    setupSharedServices(ioc);
    setupMovieServices(ioc);
    setupAuthServices(ioc);
  }

  void loadStartUpConfig() async {}

  Future<void> initializedFirebase() async {
    await Firebase.initializeApp();
  }
}
