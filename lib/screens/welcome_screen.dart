import 'package:flutter/material.dart';
import 'package:step_box/const.dart';
import 'package:step_box/components/registration_button.dart';
import 'package:step_box/screens/login_screen.dart';
import 'package:step_box/screens/signup_screen.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = 'welcome_screen';
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kblackColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: const [
                Text('Step Box', style: kwlcmHeadText),
                SizedBox(height: 15),
                Text('Track your steps', style: kwlcmSubText),
              ],
            ),
            Image.asset('assets/Walking.gif'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RegistrationButton(
                    buttonText: 'Sign Up',
                    buttonColor: Colors.white,
                    textColor: kblackColor,
                    onPressed: () {
                      Navigator.pushNamed(context, SignupScreen.id);
                    }),
                RegistrationButton(
                    buttonText: 'Log In',
                    buttonColor: Colors.white,
                    textColor: kblackColor,
                    onPressed: () {
                      Navigator.pushNamed(context, LoginScreen.id);
                    }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
