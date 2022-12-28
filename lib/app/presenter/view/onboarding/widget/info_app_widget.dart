// ignore_for_file: must_be_immutable

import 'package:appaguaentregados/app/domain/utils/colors_app.dart';
import 'package:appaguaentregados/app/presenter/view/onboarding/widget/text_onboarding.dart';
import 'package:flutter/material.dart';

class InfoAppWidget extends StatelessWidget {
  InfoAppWidget({
    Key? key,
    required this.text,
    required this.title,
    required this.image,
    required this.onPress,
  }) : super(key: key);

  String text;
  String title;
  String image;
  VoidCallback? onPress;

  @override
  Widget build(BuildContext context) {
    final largura = MediaQuery.of(context).size.width;

    return Center(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: ColorsApp.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Image.asset(
              image,
              width: largura * 0.30,
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 200,
              child: TextOnboarding(
                text: text,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Container(
              width: 55,
              height: 55,
              decoration: BoxDecoration(
                color: onPress == null ? Colors.grey : ColorsApp.blueDarck,
                borderRadius: BorderRadius.circular(12),
              ),
              child: IconButton(
                onPressed: onPress,
                icon: const Icon(Icons.arrow_forward_ios),
                color: ColorsApp.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
