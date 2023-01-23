// ignore_for_file: unrelated_type_equality_checks

import 'package:appaguaentregados/app/common/utils/colors_app.dart';
import 'package:appaguaentregados/app/common/utils/routes_app.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageDecoration _pageDecoration() {
    return const PageDecoration(
      pageColor: ColorsApp.bluePrimary,
      titleTextStyle: TextStyle(
        color: ColorsApp.white,
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
      bodyTextStyle: TextStyle(
        color: ColorsApp.white,
        fontSize: 15,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final largura = MediaQuery.of(context).size.width;

    return SafeArea(
      child: IntroductionScreen(
        showBackButton: true,
        showNextButton: false,
        back: const Icon(Icons.arrow_back),
        pages: [
          PageViewModel(
            title: '1ª Dica',
            body:
                'O app precisa de permissão para acessar a sua localização então não se esqueça de verificar a sua localização quando for comprar água no app. Você só precisa fazer isso somente uma vez.',
            image: Center(
              child: Image.asset(
                'assets/images/map.png',
                width: largura * 0.30,
              ),
            ),
            decoration: _pageDecoration(),
          ),
          PageViewModel(
            title: '2ª Dica',
            body:
                'Informe seu nome e número, o entregador entrará em contato com você caso seja necessário.',
            image: Center(
              child: Image.asset(
                'assets/images/user.png',
                width: largura * 0.30,
              ),
            ),
            decoration: _pageDecoration(),
          ),
          PageViewModel(
            title: '3ª Dica',
            body:
                'Caso tenha algum problema ou demora na entrega, você pode entra em contato direto com o fornecedor.',
            image: Center(
              child: Image.asset(
                'assets/images/garrafa-de-agua.png',
                width: largura * 0.30,
              ),
            ),
            decoration: _pageDecoration(),
          ),
        ],
        done: const Text(
          'Entrar',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
        onDone: () {
          Navigator.pushNamed(context, RoutesApp.home);
        },
      ),
    );
  }
}
