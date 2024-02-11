import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextInput extends StatelessWidget {
  final String hint;
  final ValueChanged<String>? onChanged;
  final TextInputType? textInputType;
  final String? initValue;

  const CustomTextInput({
    Key? key,
    required this.hint,
    required this.onChanged,
    this.textInputType,
    this.initValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        margin: EdgeInsets.fromLTRB(16, 8, 16, 4),
        padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
        width: 400,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(255, 124, 156, 185),
              blurRadius: 8.0,
              spreadRadius: 0.0,
              offset: Offset(1.0, 1.0),
            )
          ],
        ),
        child: TextFormField(
          initialValue: initValue,
          onChanged: onChanged,
          controller: null,
          keyboardType: textInputType,
          obscureText:
          textInputType == TextInputType.visiblePassword ? true : false,
          decoration: InputDecoration.collapsed(
              hintText: hint, fillColor: Colors.white),
        ));
  }
}