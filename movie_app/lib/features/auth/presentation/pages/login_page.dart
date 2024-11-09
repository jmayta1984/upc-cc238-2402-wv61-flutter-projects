import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/auth/presentation/blocs/login_bloc.dart';
import 'package:movie_app/features/auth/presentation/blocs/login_event.dart';
import 'package:movie_app/features/auth/presentation/blocs/login_state.dart';
import 'package:movie_app/features/auth/presentation/blocs/password_hidden_cubit.dart';
import 'package:movie_app/shared/presentation/pages/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocListener<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state is LoginSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(
                      'Welcome: ${state.user.firstName} ${state.user.lastName}')));
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  ));
            } else if (state is LoginError) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.message)));
            }
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _usernameController,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(),
                    label: Text('Username'),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: BlocBuilder<PasswordHiddenCubit, bool>(
                    builder: (context, isPasswordHidden) {
                  return TextField(
                    obscureText: isPasswordHidden,
                    controller: _passwordController,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.lock),
                        border: const OutlineInputBorder(),
                        label: const Text('Password'),
                        suffixIcon: IconButton(
                            onPressed: () => context
                                .read<PasswordHiddenCubit>()
                                .togglePasswordVisibility(),
                            icon: Icon(isPasswordHidden
                                ? Icons.visibility_off
                                : Icons.visibility))),
                  );
                }),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                        onPressed: () {
                          final String username = _usernameController.text;
                          final String password = _passwordController.text;
                          context.read<LoginBloc>().add(LoginSubmitted(
                              username: username, password: password));
                        },
                        child: const Text('Login'))),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
