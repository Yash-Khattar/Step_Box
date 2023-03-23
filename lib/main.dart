import 'package:flutter/material.dart';
import 'package:step_box/screens/login_screen.dart';
import 'package:step_box/screens/welcome_screen.dart';
import 'package:step_box/screens/home_screen.dart';
import 'package:step_box/screens/signup_screen.dart';
import 'package:step_box/screens/bottom_nav.dart';
import 'package:firebase_core/firebase_core.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Step Box',
      theme: ThemeData(
        fontFamily: 'Ubuntu',
      ),
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        SignupScreen.id: (context) => SignupScreen(),
        HomeScreen.id: (context) => HomeScreen(),
        BotttomNavigation.id: (context) => BotttomNavigation(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
