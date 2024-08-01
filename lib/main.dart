import 'package:flutter/material.dart';
import 'package:railway_intership/screens/help_screen.dart';
import 'package:railway_intership/screens/home_page.dart';
import 'package:railway_intership/screens/login_page.dart';
import 'package:railway_intership/screens/report_screen.dart';
import 'package:railway_intership/screens/setting_screen.dart';
import 'package:railway_intership/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UTS ticketing System',
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/login': (context) => const LoginPage(),
        '/home': (context) => const HomePage(),
        '/setting': (context) => const SettingScreen(),
        '/help': (context) => const HelpScreen(),
        '/report': (context) => const ReportScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
