import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:food/components/bottom_navaigation.dart';
import 'package:food/screens/body_home.dart';
import 'package:food/screens/drawer_screen.dart';
import 'package:food/screens/get_started.dart';
import 'package:food/components/home.dart';
import 'package:food/screens/login.dart';
import 'package:food/screens/profile.dart';
import 'package:food/screens/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        'home': (context) => Home(),
        'login': (context) => Login(),
      },
      theme: ThemeData(fontFamily: 'Mplush'),
      // home: AnimatedSplashScreen(
      //   splash: const Splash(),
      //   splashIconSize: double.maxFinite,
      //   centered: true,
      //   nextScreen: GetStarted(),
      // ),
      home: const BottomNavigation(openDrawer: openDrawer),
    );
  }
}
