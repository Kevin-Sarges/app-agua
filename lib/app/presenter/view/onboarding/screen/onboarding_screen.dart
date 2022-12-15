import 'package:appaguaentregados/app/domain/utils/colors_app.dart';
import 'package:appaguaentregados/app/domain/utils/routes_app.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorsApp.bluePrimary,
        body: Center(
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            direction: Axis.vertical,
            spacing: 40,
            children: [
              const Text(
                'Dicas',
                style: TextStyle(
                  color: ColorsApp.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Image.asset(
                'assets/images/garrafa-de-agua.png',
                width: 200,
              ),
              const SizedBox(
                width: 230,
                child: Text(
                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: ColorsApp.white,
                    fontSize: 17,
                  ),
                ),
              ),
              Container(
                width: 55,
                height: 55,
                decoration: BoxDecoration(
                  color: ColorsApp.blueDarck,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, RoutesApp.home);
                  },
                  icon: const Icon(Icons.arrow_forward_ios),
                  color: ColorsApp.white,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
