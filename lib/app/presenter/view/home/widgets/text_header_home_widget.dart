// ignore_for_file: must_be_immutable

import 'package:appaguaentregados/app/domain/utils/colors_app.dart';
import 'package:flutter/material.dart';

class TextHeaderHomeWidget extends StatelessWidget {
  TextHeaderHomeWidget({
    Key? key,
    required this.text,
  }) : super(key: key);

  String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 11,
        color: ColorsApp.white,
      ),
    );
  }
}
