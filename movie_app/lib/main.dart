import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/auth/presentation/bloc/login_bloc.dart';
import 'package:movie_app/features/auth/presentation/bloc/password_hidden_cubit.dart';
import 'package:movie_app/features/auth/presentation/pages/login_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(
          create: (context) => LoginBloc(),
        ),
        BlocProvider<PasswordHiddenCubit>(
          create: (context) => PasswordHiddenCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        darkTheme: ThemeData.dark(),
        theme: ThemeData.light(),
        home: const LoginPage(),
      ),
    );
  }
}
