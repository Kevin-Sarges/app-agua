// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class InputText extends StatelessWidget {
  InputText({
    Key? key,
    required this.controller,
    required this.labelInput,
    required this.hintText,
  });

  TextEditingController? controller;
  Widget? labelInput;
  String hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Campo esta vazio';
        }

        return null;
      },
      controller: controller,
      decoration: InputDecoration(
        label: labelInput,
        hintText: hintText,
      ),
    );
  }
}
