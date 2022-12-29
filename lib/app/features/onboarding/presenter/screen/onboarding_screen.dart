import 'package:appaguaentregados/app/common/utils/colors_app.dart';
import 'package:appaguaentregados/app/common/utils/routes_app.dart';
import 'package:appaguaentregados/app/features/onboarding/presenter/widget/info_app_widget.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorsApp.bluePrimary,
        body: TabBarView(
          controller: _tabController,
          children: [
            InfoAppWidget(
              title: '1ª Dica',
              text:
                  'O app precisa de permissão para acessar a sua localização então não se esqueça de verificar a sua localização quando for comprar água no app.',
              image: 'assets/images/map.png',
              onPress: null,
            ),
            InfoAppWidget(
              title: '2ª Dica',
              text:
                  'Informe seu nome e número, o entregador entrará em contato com você caso seja necessário.',
              image: 'assets/images/user.png',
              onPress: null,
            ),
            InfoAppWidget(
              title: '3ª Dica',
              text:
                  'Caso tenha algum problema ou demora na entrega, você pode entra em contato direto com o fornecedor.',
              image: 'assets/images/garrafa-de-agua.png',
              onPress: () {
                Navigator.pushNamed(context, RoutesApp.home);
              },
            ),
          ],
        ),
      ),
    );
  }
}
