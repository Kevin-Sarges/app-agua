import 'package:appaguaentregados/app/domain/utils/routes_app.dart';
import 'package:appaguaentregados/app/presenter/view/checked/screen/checked_screen.dart';
import 'package:appaguaentregados/app/presenter/view/home/screen/home_screen.dart';
import 'package:appaguaentregados/app/presenter/view/info/screen/info_screen.dart';
import 'package:appaguaentregados/app/presenter/view/map/screen/map_screen.dart';
import 'package:appaguaentregados/app/presenter/view/onboarding/screen/onboarding_screen.dart';
import 'package:appaguaentregados/app/presenter/view/splash/screen/splash_screen.dart';
import 'package:flutter/material.dart';

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        RoutesApp.initialRouter: (context) => const SplashScreen(),
        RoutesApp.onboarding: (context) => const OnboardingScreen(),
        RoutesApp.home: (context) => const HomeScreen(),
        RoutesApp.infoUser: (context) => const InfoScreen(),
        RoutesApp.map: (context) => const MapScreen(),
        RoutesApp.checkedScreen: (context) => const CheckedScreen(),
      },
    );
  }
}
