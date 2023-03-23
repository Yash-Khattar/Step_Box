import 'package:flutter/material.dart';

class Email {
  static var email = '';
  static Widget emailField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 20),
      child: TextFormField(
        validator: ((value) {
          final regExp = RegExp(
              r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
          if (value!.isEmpty) {
            return 'Enter an Email';
          } else if (!regExp.hasMatch(value)) {
            return 'Invalid Email';
          } else {
            return null;
          }
        }),
        onChanged: (newValue) {
          email = newValue;
          // print(email);
        },
        // controller: emailController,
        decoration: const InputDecoration(
          labelText: 'Email',
          icon: Icon(
            Icons.mail,
          ),
        ),
        keyboardType: TextInputType.emailAddress,
        textInputAction: TextInputAction.done,
      ),
    );
  }
}
