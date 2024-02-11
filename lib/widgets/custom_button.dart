import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final VoidCallback onPress;
  final Text text;
  final Color? backgroundColor;
  final Color? foregroundColor;

  const MyButton(
      {super.key,
        required this.onPress,
        required this.text,
        this.backgroundColor,
        this.foregroundColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 10, 16, 0),
      height: 70,
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        onPressed: onPress,
        child: text,
        style: ElevatedButton.styleFrom(
            foregroundColor: foregroundColor,
            backgroundColor: backgroundColor,
            textStyle: TextStyle(fontSize: 18),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            )),
      ),
    );
  }
}

class BlueButton extends StatelessWidget {
  final VoidCallback onPress;
  final Text text;

  BlueButton({super.key, required this.onPress, required this.text});

  @override
  Widget build(BuildContext context) {
    return MyButton(
      onPress: onPress,
      text: text,
      backgroundColor: Color.fromARGB(255, 62, 69, 121),
      foregroundColor: Colors.white,
    );
  }
}