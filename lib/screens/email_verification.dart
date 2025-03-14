import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'login.dart';

class EmailVerification extends StatefulWidget {
  const EmailVerification({Key? key}) : super(key: key);

  @override
  State<EmailVerification> createState() => _EmailVerificationState();
}

class _EmailVerificationState extends State<EmailVerification> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late User _user;
  bool _isEmailVerified = false;
  bool _isLoading = false;
  bool _canResendEmail = true;

  @override
  void initState() {
    super.initState();
    _user = _auth.currentUser!;
    _isEmailVerified = _user.emailVerified;

    if (!_isEmailVerified) {
      _sendVerificationEmail();
    }

    _checkEmailVerified();
  }

  Future<void> _sendVerificationEmail() async {
    try {
      if (_canResendEmail) {
        await _user.sendEmailVerification();
        setState(() => _canResendEmail = false);
        await Future.delayed(const Duration(seconds: 30));
        setState(() => _canResendEmail = true);
      }
    } catch (e) {
      print('Failed to send verification email: $e');
    }
  }

  Future<void> _checkEmailVerified() async {
    while (!_isEmailVerified) {
      await Future.delayed(const Duration(seconds: 3));
      await _user.reload();
      setState(() {
        _user = _auth.currentUser!;
        _isEmailVerified = _user.emailVerified;
      });
    }

    if (_isEmailVerified) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (_) => const Login()),
        (route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Email Verification'),
      ),
      body: Center(
        child: _isEmailVerified
            ? const CircularProgressIndicator()
            : Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'A verification email has been sent to your email address. Please check your inbox.',
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _canResendEmail ? _sendVerificationEmail : null,
                      child: const Text('Resend Email'),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () async {
                        await FirebaseAuth.instance.signOut();
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (_) => const Login()),
                          (route) => false,
                        );
                      },
                      child: const Text('Cancel'),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
