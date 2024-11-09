import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final TextEditingController _usernameController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();
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
                controller: _passwordController,
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.lock),
                    border: const OutlineInputBorder(),
                    label: const Text('Password'),
                    suffixIcon: IconButton(
                        onPressed: () {}, icon: const Icon(Icons.visibility))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
