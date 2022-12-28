import 'package:get_it/get_it.dart';
import 'package:lateef/feature/auth/auth_cubit.dart';

void setupAuthServices(GetIt ioc) {
  ioc.registerSingleton<AuthCubit>(AuthCubit());
}
