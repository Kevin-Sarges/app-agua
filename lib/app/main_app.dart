import 'package:appaguaentregados/app/common/utils/routes_app.dart';
import 'package:appaguaentregados/app/features/checked/presenter/screen/checked_screen.dart';
import 'package:appaguaentregados/app/features/info/presenter/screen/info_screen.dart';
import 'package:appaguaentregados/app/features/map/presenter/screen/map_screen.dart';
import 'package:appaguaentregados/app/features/onboarding/presenter/screen/onboarding_screen.dart';
import 'package:appaguaentregados/app/features/splash/presenter/screen/splash_screen.dart';
import 'package:appaguaentregados/app/features/home/presenter/screen/home_screen.dart';
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
