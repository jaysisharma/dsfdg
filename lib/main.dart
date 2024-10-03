import 'package:flutter/material.dart';
import 'package:tourpulse/FirstPage.dart';
import 'package:tourpulse/Home.dart';
import 'package:tourpulse/SecondPage.dart';
import 'package:tourpulse/bali.dart';
import 'package:tourpulse/category.dart';
import 'package:tourpulse/explore.dart';
import 'package:tourpulse/favorites.dart';
import 'package:tourpulse/forgot_password.dart';
import 'package:tourpulse/india.dart';
import 'package:tourpulse/manali.dart';
import 'package:tourpulse/popular_destination.dart';
import 'package:tourpulse/profile.dart';
import 'package:tourpulse/usa.dart';
import 'package:tourpulse/verification.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TourPulse',
      debugShowCheckedModeBanner: false, // Hides the debug banner
      home:FirstPage(), // Set India as the home widget
    );
  }
}
