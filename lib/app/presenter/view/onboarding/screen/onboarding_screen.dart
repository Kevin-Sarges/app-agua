import 'package:appaguaentregados/app/domain/utils/colors_app.dart';
import 'package:appaguaentregados/app/domain/utils/routes_app.dart';
import 'package:appaguaentregados/app/presenter/view/onboarding/widget/text_onboarding.dart';
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Dicas',
                style: TextStyle(
                  color: ColorsApp.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Image.asset(
                'assets/images/garrafa-de-agua.png',
                width: 100,
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 200,
                child: Column(
                  children: [
                    TextOnboarding(
                      text:
                          '1. O app precisa de permissão para acessar a sua localização então não se esqueça de verificar a sua localização quando for comprar água no app.',
                    ),
                    const SizedBox(height: 10),
                    TextOnboarding(
                      text:
                          '2. Informe seu nome e número, o entregador entrará em contato com você caso seja necessário.',
                    ),
                    const SizedBox(height: 10),
                    TextOnboarding(
                      text:
                          '3. Caso tenha algum problema ou demora na entrega, você pode entra em contato direto com o fornecedor.',
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
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
