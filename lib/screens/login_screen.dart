import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/auth_provider.dart';

class LoginScreen extends ConsumerWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);

    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 16),
            authState.status == AuthStatus.loading
                ? CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: () {
                      ref.read(authProvider.notifier).login(
                        emailController.text,
                        passwordController.text,
                      );
                    },
                    child: Text('Login'),
                  ),
            if (authState.status == AuthStatus.error)
              Text(authState.errorMessage ?? 'Login failed', style: TextStyle(color: Colors.red)),
          ],
        ),
      ),
    );
  }
}
