import 'package:flutter/material.dart';
import 'package:myapp/screens/layout.dart';
import 'package:myapp/screens/oneTime.dart';
import 'package:myapp/screens/home.dart'; // Import your Home screen
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateAfterSplash();
  }

  Future<void> _navigateAfterSplash() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isFirstTime = prefs.getBool('first_time') ?? false;

    await Future.delayed(Duration(seconds: 2)); // Splash delay

    if (isFirstTime) {
      await prefs.setBool('first_time', false); // Mark as not first time
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Layout()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Home()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: Image.asset("assets/bookstoreIcon.png", width: 150),
      ),
    );
  }
}
