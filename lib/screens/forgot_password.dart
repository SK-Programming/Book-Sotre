import 'package:flutter/material.dart';
import '../services/firebase_service.dart';

class ForgotPassword extends StatelessWidget {
  final FirebaseService _authService = FirebaseService();
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forgot Password'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Enter your email'),
            ),
            ElevatedButton(
              onPressed: () async {
          await FirebaseService.sendPasswordResetEmail(_emailController.text.trim());

              },
              child: Text('Reset Password'),
            ),
          ],
        ),
      ),
    );
  }
}
