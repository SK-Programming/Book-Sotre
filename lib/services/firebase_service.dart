import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Sign In with Email and Password
  static Future<void> signIn(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      print('Login Error: $e');
    }
  }

  // Register with Email and Password
  static Future<void> register(String username, String email, String password, String uniqueId) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await _firestore.collection('users').doc(userCredential.user?.uid).set({
        'username': username,
        'email': email,
        'userId': uniqueId,
      });

      await userCredential.user?.sendEmailVerification();
    } catch (e) {
      print('Registration Error: $e');
    }
  }

  // Forgot Password
  static Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      print('Password Reset Error: $e');
    }
  }

  // Google Sign In
  static Future<void> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) return;

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await _auth.signInWithCredential(credential);
    } catch (e) {
      print('Google Sign In Error: $e');
    }
  }

  // Facebook Sign In
  static Future<void> signInWithFacebook() async {
    try {
//    final accessToken = result.accessToken;
// if (accessToken != null && accessToken['token'] != null) {
//   final OAuthCredential credential = FacebookAuthProvider.credential(accessToken['token']);
//   await _auth.signInWithCredential(credential);
// }

    } catch (e) {
      print('Facebook Sign In Error: $e');
    }
  }
}
// Firebase configuration file lib/firebase_options.dart generated successfully with the following Firebase apps:

// Platform  Firebase App Id
// web       1:518050660195:web:a24913faf34808b7281d56
// android   1:518050660195:android:f04aa8a23953cfbc281d56

// Learn more about using this file and next steps from the documentation:
//  > https://firebase.google.com/docs/flutter/setup