import 'package:flutter/material.dart';
import '../services/firebase_service.dart';

class AuthModal {
  static void showForgotPassword(BuildContext context) {
    final TextEditingController emailController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Forgot Password'),
          content: TextField(
            controller: emailController,
            decoration: InputDecoration(
              labelText: 'Enter your email',
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                FirebaseService.sendPasswordResetEmail(emailController.text);
                Navigator.pop(context);
              },
              child: Text('Send Email'),
            ),
          ],
        );
      },
    );
  }

  static void showEmailVerification(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Email Verification'),
          content: Text('A verification link has been sent to your email.'),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
