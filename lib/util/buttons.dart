import 'package:flutter/material.dart';

class MyButtons extends StatelessWidget {
  final String text;
  VoidCallback onPressed;

  MyButtons({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(onPressed: onPressed,
    color: Colors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4), // Set the border radius here
      ),
    child: Text(text,
    style: const TextStyle(
      color: Colors.white,
      )
    ),
    );
  }
}
