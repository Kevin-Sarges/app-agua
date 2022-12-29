// ignore_for_file: must_be_immutable

import 'package:appaguaentregados/app/common/utils/colors_app.dart';
import 'package:flutter/material.dart';

class TextOnboarding extends StatelessWidget {
  TextOnboarding({
    Key? key,
    required this.text,
  }) : super(key: key);

  String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 18,
        color: ColorsApp.white,
      ),
    );
  }
}
