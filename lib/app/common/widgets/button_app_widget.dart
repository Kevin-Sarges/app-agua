import 'package:flutter/material.dart';

class ButtonAppWidget extends StatelessWidget {
  const ButtonAppWidget({
    Key? key,
    required this.onPressed,
    required this.text,
    required this.style,
  }) : super(key: key);

  final VoidCallback? onPressed;
  final Widget text;
  final ButtonStyle style;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: style,
      child: text,
    );
  }
}
