import 'package:flutter/material.dart';
import 'package:step_box/screens/login_screen.dart';
import 'package:step_box/screens/welcome_screen.dart';
import 'package:step_box/screens/home_screen.dart';
import 'package:step_box/screens/signup_screen.dart';
import 'package:step_box/screens/bottom_nav.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'providers.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ((context) => PedometerProvider())),
      ],
      child: MaterialApp(
        title: 'Step Box',
        theme: ThemeData(
          fontFamily: 'Ubuntu',
        ),
        initialRoute: user == null ? WelcomeScreen.id : BotttomNavigation.id,
        routes: {
          WelcomeScreen.id: (context) => WelcomeScreen(),
          LoginScreen.id: (context) => LoginScreen(),
          SignupScreen.id: (context) => SignupScreen(),
          HomeScreen.id: (context) => HomeScreen(),
          BotttomNavigation.id: (context) => BotttomNavigation(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
