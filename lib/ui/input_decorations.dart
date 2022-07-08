import 'package:flutter/material.dart';

class Inputdecorations {
  static InputDecoration authInputDecoration(
      {required String hintText,
      required String labelText,
      IconData? prefixIcon}) {
    return InputDecoration(
      enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.amber,
        ),
      ),
      focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
        color: Colors.amber,
        width: 2,
      )),
      hintText: hintText,
      labelText: labelText,
      labelStyle: const TextStyle(
        color: Colors.amber,
      ),
      prefixIcon: prefixIcon != null
          ? Icon(
              prefixIcon,
              color: Colors.amber,
            )
          : null,
    );
  }
}
