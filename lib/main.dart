import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:myapp/screens/oneTime.dart';
import 'package:myapp/screens/splashScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
        primaryColor: const Color(0xFFD4A157),
        scaffoldBackgroundColor: Colors.white,
        secondaryHeaderColor: Colors.white,
        hoverColor: Colors.black,
        focusColor: const Color.fromARGB(255, 255, 255, 255),
        cardColor: Color(0xFFf6efe4),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
          bodyMedium: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
          bodySmall: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
        ),
        iconTheme: const IconThemeData(color: Color(0xFFD4A157)),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFD4A157),
            foregroundColor: Colors.white,
          ),
        ),
      ),
      darkTheme: ThemeData(
        fontFamily: 'Poppins',
        primaryColor: const Color(0xFFD4A157),
        scaffoldBackgroundColor: const Color(0xFF1F1F1F),
        secondaryHeaderColor: const Color(0xFF1F1F1F),
        hoverColor: Colors.white,
        focusColor: const Color.fromARGB(255, 0, 0, 0),
        cardColor: Color.fromARGB(255, 44, 44, 44),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w300,
            color: Colors.white,
          ),
          bodyMedium: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w300,
            color: Colors.white,
          ),
          bodySmall: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w300,
            color: Colors.white,
          ),
        ),
        iconTheme: const IconThemeData(color: Color(0xFFD4A157)),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFD4A157),
            foregroundColor: Colors.white,
          ),
        ),
      ),
      themeMode: ThemeMode.system,
      home: const Main(),
    ),
  );
}

class Main extends StatefulWidget {
  const Main({super.key});

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen();
  }
}
