import 'package:flutter/material.dart';

class Password extends StatelessWidget {
  static String password = '';
  bool isVisible;

  IconButton iconButton;
  Password({Key? key, required this.iconButton, required this.isVisible})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return 'Enter a Password';
        } else if (value.length < 6) {
          return 'Password must be atlest 6 character long';
        } else {
          return null;
        }
      },
      onChanged: (newValue) {
        password = newValue;
      },
      decoration: InputDecoration(
        helperText: 'Atleast 6 characters',
        labelText: 'Password',
        icon: const Icon(Icons.lock),
        suffixIcon: iconButton,
      ),
      obscureText: isVisible,
      keyboardType: TextInputType.visiblePassword,
      textInputAction: TextInputAction.done,
    );
  }
}
