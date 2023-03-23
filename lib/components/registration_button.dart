import 'package:flutter/material.dart';

import 'package:step_box/const.dart';

class RegistrationButton extends StatelessWidget {
  RegistrationButton({
    required this.buttonText,
    required this.onPressed,
    required this.buttonColor,
    required this.textColor,
  });
  final String buttonText;
  final VoidCallback onPressed;
  final Color textColor;
  final Color buttonColor;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: buttonColor,
        onPrimary: textColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
      ),
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Text(buttonText, style: kSignupLoginText),
      ),
    );
  }
}
