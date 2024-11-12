import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/auth_provider.dart';

class SignupScreen extends ConsumerWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);

    return Scaffold(
      appBar: AppBar(title: Text('Signup')),
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
                      ref.read(authProvider.notifier).signup(
                        emailController.text,
                        passwordController.text,
                      );
                    },
                    child: Text('Signup'),
                  ),
            if (authState.status == AuthStatus.error)
              Text(authState.errorMessage ?? 'Signup failed', style: TextStyle(color: Colors.red)),
          ],
        ),
      ),
    );
  }
}
