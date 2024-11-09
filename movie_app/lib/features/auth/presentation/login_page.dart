import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/auth/presentation/blocs/login_bloc.dart';
import 'package:movie_app/features/auth/presentation/blocs/login_event.dart';
import 'package:movie_app/features/auth/presentation/blocs/login_state.dart';
import 'package:movie_app/features/movies/presentation/pages/movies_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  bool _isPasswordHidden = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocListener<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state is LoginSuccess) {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MoviesPage(),
                  ));
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(
                      'Welcome: ${state.user.firstName} ${state.user.lastName}')));
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
                child: TextField(
                  obscureText: _isPasswordHidden,
                  controller: _passwordController,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.lock),
                      border: const OutlineInputBorder(),
                      label: const Text('Password'),
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _isPasswordHidden = !_isPasswordHidden;
                            });
                          },
                          icon: Icon(_isPasswordHidden
                              ? Icons.visibility
                              : Icons.visibility_off))),
                ),
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
}
