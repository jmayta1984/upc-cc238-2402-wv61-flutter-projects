import 'package:flutter/material.dart';

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
                child: OutlinedButton(onPressed: (){}, child: const Text('Login'))),
            )
          ],
        ),
      ),
    );
  }
}
