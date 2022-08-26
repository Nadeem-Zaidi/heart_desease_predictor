import 'package:flutter/material.dart';

TextFormField customTextFormField(
    String labeltext, TextEditingController? controller) {
  return TextFormField(
    controller: controller,
    decoration: InputDecoration(
      labelText: labeltext,
      labelStyle: const TextStyle(fontSize: 22),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(width: 2),
        borderRadius: BorderRadius.circular(20),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(width: 2),
        borderRadius: BorderRadius.circular(20),
      ),
    ),
    validator: (value) {
      if (value == null || value.isEmpty) {
        return "Please enter mobile number";
      }
      return null;
    },
  );
}
