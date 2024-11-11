import 'package:movie_app/features/auth/domain/user.dart';

abstract class LoginState {
  const LoginState();
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final User user;
  const LoginSuccess({required this.user});
}

class LoginError extends LoginState {
  final String message;
  const LoginError({required this.message});
}

