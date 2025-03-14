// import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';
// import 'package:myapp/screens/home.dart';
// import 'package:myapp/screens/layout.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:page_transition/page_transition.dart';

// class OneTime extends StatefulWidget {
//   const OneTime({super.key});

//   @override
//   State<OneTime> createState() => _OneTimeState();
// }

// class _OneTimeState extends State<OneTime> {
//   @override
//   void initState() {
//     super.initState();
//     _checkFirstTime();
//   }

//   Future<void> _checkFirstTime() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     bool isFirstTime = prefs.getBool('first_time') ?? true;

//     if (!isFirstTime) {
//       _navigateToMainScreen();
//     } else {
//       await prefs.setBool('first_time', false);
//     }
//   }

//   void _navigateToMainScreen() {
//     Navigator.pushReplacement(
//       context,
//       PageTransition(
//         type: PageTransitionType.fade, 
//         duration: Duration(milliseconds: 300),
//         child: Layout(),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Container(
//             width: MediaQuery.of(context).size.width,
//             height: MediaQuery.of(context).size.height * 0.6,
//             decoration: BoxDecoration(
//               image: DecorationImage(
//                 image: AssetImage(
//                   Theme.of(context).brightness == Brightness.dark
//                       ? 'assets/overlaybgdark.png'
//                       : 'assets/overlaybg.png',
//                 ),
//                 fit: BoxFit.contain,
//                 alignment: Alignment.topCenter,
//               ),
//             ),
//             child: Center(
//               child: Lottie.asset('assets/getstarted.json'),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Text("Read Everytime", style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500)),
//                 Center(
//                   child: Text.rich(
//                     TextSpan(
//                       children: [
//                         TextSpan(text: "Buy and read your favorite \n"),
//                         TextSpan(text: "book with "),
//                         TextSpan(
//                           text: "best price",
//                           style: TextStyle(
//                             decoration: TextDecoration.underline,
//                             decorationColor: Theme.of(context).primaryColor,
//                             decorationThickness: 4,
//                           ),
//                         ),
//                       ],
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                 ),
//                 SizedBox(height: 30),
//                 SizedBox(
//                   width: 200,
//                   height: 50,
//                   child: ElevatedButton(
//                     onPressed: _navigateToMainScreen,
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Theme.of(context).primaryColor,
//                       foregroundColor: Colors.white,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                     ),
//                     child: const Text(
//                       'Start Reading',
//                       style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }