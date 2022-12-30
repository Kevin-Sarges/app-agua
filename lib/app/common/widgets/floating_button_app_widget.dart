// ignore_for_file: must_be_immutable

import 'package:appaguaentregados/app/common/utils/colors_app.dart';
import 'package:flutter/material.dart';

class FloatingButtonAppWidget extends StatelessWidget {
  FloatingButtonAppWidget({
    Key? key,
    required this.label,
    required this.onPressed,
    required this.icon,
  }) : super(key: key);

  String label;
  VoidCallback? onPressed;
  Widget icon;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: onPressed,
      backgroundColor: ColorsApp.blueDarck,
      label: Text(label),
      icon: icon,
    );
  }
}
