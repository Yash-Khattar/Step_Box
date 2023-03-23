import 'package:flutter/material.dart';

import 'package:step_box/const.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({
    Key? key,
    required this.buttonText,
  }) : super(key: key);
  final String buttonText;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: kblackColor,
        onPrimary: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
      ),
      onPressed: () {},
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Text(buttonText, style: kSignupLoginText),
      ),
    );
  }
}
