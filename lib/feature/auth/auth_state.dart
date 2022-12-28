part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class LoginLoading extends AuthState {}

class LoginSuccess extends AuthState {
  final User user;
  LoginSuccess({required this.user});
}

class LoginError extends AuthState {
  final String message;
  LoginError({required this.message});
}
