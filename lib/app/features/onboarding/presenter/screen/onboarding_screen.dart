// ignore_for_file: unrelated_type_equality_checks

import 'package:appaguaentregados/app/common/utils/colors_app.dart';
import 'package:appaguaentregados/app/common/utils/routes_app.dart';
import 'package:appaguaentregados/app/features/onboarding/presenter/widget/info_app_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int _current = 0;
  final CarouselController _carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    List<Widget> infoWidget = [
      InfoAppWidget(
        key: Key(1.toString()),
        title: '1ª Dica',
        text:
            'O app precisa de permissão para acessar a sua localização então não se esqueça de verificar a sua localização quando for comprar água no app.',
        image: 'assets/images/map.png',
        onPress: null,
      ),
      InfoAppWidget(
        key: const Key('2'),
        title: '2ª Dica',
        text:
            'Informe seu nome e número, o entregador entrará em contato com você caso seja necessário.',
        image: 'assets/images/user.png',
        onPress: null,
      ),
      InfoAppWidget(
        key: const Key('3'),
        title: '3ª Dica',
        text:
            'Caso tenha algum problema ou demora na entrega, você pode entra em contato direto com o fornecedor.',
        image: 'assets/images/garrafa-de-agua.png',
        onPress: () {
          Navigator.pushNamed(context, RoutesApp.home);
        },
      ),
    ];

    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorsApp.bluePrimary,
        body: Column(
          children: [
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                color: Colors.red,
                child: CarouselSlider(
                  carouselController: _carouselController,
                  options: CarouselOptions(
                    autoPlay: false,
                    aspectRatio: 1,
                    enlargeStrategy: CenterPageEnlargeStrategy.height,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _current = index;
                      });
                    },
                  ),
                  items: infoWidget,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: infoWidget.map(
                (info) {
                  final intKey = info.key;

                  print('int $intKey');
                  return Container(
                    width: 8.0,
                    height: 8.0,
                    margin: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 4.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: (Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : ColorsApp.black)
                          .withOpacity(
                        _current == info.key ? 0.9 : 0.4,
                      ),
                    ),
                  );
                },
              ).toList(),
            )
          ],
        ),
        // body: Center(
        //   child: CarouselSlider(
        //     carouselController: _carouselController,
        //     options: CarouselOptions(
        //       autoPlay: false,
        //       aspectRatio: 1,
        //       enlargeStrategy: CenterPageEnlargeStrategy.height,
        //       onPageChanged: (index, reason) {
        //         setState(() {
        //           _current = index;
        //         });
        //       },
        //     ),
        //     items: [
        //       InfoAppWidget(
        //         title: '1ª Dica',
        //         text:
        //             'O app precisa de permissão para acessar a sua localização então não se esqueça de verificar a sua localização quando for comprar água no app.',
        //         image: 'assets/images/map.png',
        //         onPress: null,
        //       ),
        //       InfoAppWidget(
        //         title: '2ª Dica',
        //         text:
        //             'Informe seu nome e número, o entregador entrará em contato com você caso seja necessário.',
        //         image: 'assets/images/user.png',
        //         onPress: null,
        //       ),
        //       InfoAppWidget(
        //         title: '3ª Dica',
        //         text:
        //             'Caso tenha algum problema ou demora na entrega, você pode entra em contato direto com o fornecedor.',
        //         image: 'assets/images/garrafa-de-agua.png',
        //         onPress: () {
        //           Navigator.pushNamed(context, RoutesApp.home);
        //         },
        //       ),
        //     ],
        //   ),
        // ),
      ),
    );
  }
}
