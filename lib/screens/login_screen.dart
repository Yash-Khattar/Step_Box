import 'package:flutter/material.dart';
import 'package:step_box/components/password_field.dart';
import 'package:step_box/components/registration_button.dart';
import 'package:step_box/const.dart';
import 'package:step_box/components/email_field.dart';
import 'package:step_box/screens/bottom_nav.dart';
import 'package:step_box/screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  static String id = 'login_screen';
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  final formkey = GlobalKey<FormState>();
  String errorText = '';
  String email = '';
  String password = '';
  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // backgroundColor: Colors.white,
        body: Center(
          child: Form(
            key: formkey,
            // autovalidateMode: AutovalidateMode.onUserInteraction,
            child: ListView(shrinkWrap: true, children: [
              SizedBox(
                height: 150,
                child: Image.asset('assets/logo_white.png'),
              ),
              const Center(
                  child: Text('Step Box', style: kSignupLoginHeadText)),
              Email.emailField(),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 45, vertical: 20),
                child: Password(
                  isVisible: isVisible,
                  iconButton: IconButton(
                    icon: isVisible
                        ? Icon(Icons.visibility_off)
                        : Icon(Icons.visibility),
                    onPressed: () {
                      setState(() {
                        isVisible = !isVisible;
                      });
                    },
                  ),
                ),
              ),
              Center(child: Text(errorText, style: kerrorSignUpText)),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 60),
                child: RegistrationButton(
                  buttonText: 'Log In',
                  onPressed: () async {
                    //to remove keypad from screen
                    FocusScope.of(context).unfocus();
                    final isValid = formkey.currentState!.validate();
                    if (isValid) {
                      try {
                        final user = await _auth.signInWithEmailAndPassword(
                            email: email, password: password);

                        Navigator.pushNamed(context, BotttomNavigation.id);
                      } catch (e) {
                        setState(() {
                          if (e.toString() ==
                              '[firebase_auth/wrong-password] The password is invalid or the user does not have a password.') {
                            errorText = 'Wrong Password!';
                          } else if (e.toString() ==
                              '[firebase_auth/user-not-found] There is no user record corresponding to this identifier. The user may have been deleted.') {
                            errorText = '''No User found, SignUp instead''';
                          }
                        });

                        print(e);
                      }

                      email = Email.email;
                      password = Password.password;
                      // print(email);
                      // print(password);
                    }
                  },
                  buttonColor: kblackColor,
                  textColor: Colors.white,
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
// [firebase_auth/user-not-found] There is no user record corresponding to this identifier. The user may have been deleted.