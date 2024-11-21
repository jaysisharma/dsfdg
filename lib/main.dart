import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tourpulse/FirstPage.dart';
import 'package:tourpulse/firebase_options.dart';
// import 'package:tourpulse/SecondPage.dart';
// import 'package:tourpulse/bali.dart';
// import 'package:tourpulse/category.dart';
// import 'package:tourpulse/explore.dart';
// import 'package:tourpulse/favorites.dart';
// import 'package:tourpulse/forgot_password.dart';
// import 'package:tourpulse/india.dart';
// import 'package:tourpulse/manali.dart';
// import 'package:tourpulse/popular_destination.dart';
// import 'package:tourpulse/profile.dart';
// import 'package:tourpulse/usa.dart';
// import 'package:tourpulse/verification.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp(
options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'TourPulse',
      debugShowCheckedModeBanner: false, // Hides the debug banner
      home:FirstPage(), // Set India as the home widget
    );
  }
}
