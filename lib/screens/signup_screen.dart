import 'package:flutter/material.dart';
import 'package:step_box/components/email_field.dart';
import 'package:step_box/components/password_field.dart';
import 'package:step_box/components/registration_button.dart';
import 'package:step_box/screens/bottom_nav.dart';
import 'package:step_box/screens/home_screen.dart';
import 'package:step_box/screens/login_screen.dart';
import '../const.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignupScreen extends StatefulWidget {
  static String id = 'signup_screen';

  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _auth = FirebaseAuth.instance;
  final formkey = GlobalKey<FormState>();
  String errorText = '';
  String email = '';
  String password = '';
  bool isVisible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Form(
          key: formkey,
          // autovalidateMode: AutovalidateMode.onUserInteraction,
          child: ListView(
            shrinkWrap: true,
            children: [
              SizedBox(
                height: 150,
                child: Image.asset('assets/logo_white.png'),
              ),
              const Center(
                  child: Text('Step Box', style: kSignupLoginHeadText)),
              // email
              Email.emailField(),
              //  password
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 45, vertical: 20),
                child: Password(
                  isVisible: isVisible,
                  iconButton: IconButton(
                    icon: isVisible
                        ? const Icon(Icons.visibility_off)
                        : const Icon(Icons.visibility),
                    onPressed: () {
                      setState(() {
                        isVisible = !isVisible;
                      });
                    },
                  ),
                ),
              ),
              // error message
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, LoginScreen.id);
                },
                child: Text(errorText, style: kerrorSignUpText),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 60),
                child: RegistrationButton(
                  buttonText: 'Sign Up',
                  onPressed: () async {
                    final isValid = formkey.currentState!.validate();
                    if (isValid) {
                      email = Email.email;
                      password = Password.password;
                      print(email);
                      print(password);
                      try {
                        final newUser =
                            await _auth.createUserWithEmailAndPassword(
                                email: email, password: password);
                        Navigator.pushNamed(context, BotttomNavigation.id);
                      } catch (e) {
                        setState(() {
                          if (e.toString() ==
                              '[firebase_auth/email-already-in-use] The email address is already in use by another account.') {
                            errorText =
                                '''User already registered! Click to login instead.''';
                          }
                          print(e);
                        });
                      }
                    }
                  },
                  buttonColor: kblackColor,
                  textColor: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
