import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/resource.dart';
import 'package:movie_app/features/auth/data/repository/auth_repository.dart';
import 'package:movie_app/features/auth/domain/user.dart';
import 'package:movie_app/features/auth/presentation/blocs/login_event.dart';
import 'package:movie_app/features/auth/presentation/blocs/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInital()) {
    on<LoginSubmitted>(
      (event, emit) async {
        emit(LoginLoading());
        Resource<User> result =
            await AuthRepository().login(event.username, event.password);
        if (result is Success) {
          emit(LoginSuccess(user: result.data!));
        } else {
          emit(LoginError(message: result.message!));
        }
      },
    );
  }
}
