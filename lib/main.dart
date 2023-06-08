import 'package:flutter/material.dart';
import 'package:instaclone/pages/home_page.dart';
import 'package:instaclone/pages/signin_page.dart';
import 'package:instaclone/pages/signup_page.dart';
import 'package:instaclone/pages/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Instagram Clone',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashPage(),
      routes: {
        SplashPage.id:(context) => const SplashPage(),
        SignInPage.id:(context) => const SignInPage(),
        SignUpPage.id:(context) => const SignUpPage(),
        HomePage.id:(context) => const HomePage(),
      },
    );
  }
}