import 'package:appaguaentregados/app/common/utils/colors_app.dart';
import 'package:appaguaentregados/app/common/utils/routes_app.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      timeSplash(context);
    });
  }

  void timeSplash(BuildContext ctx) {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushNamed(context, RoutesApp.onboarding);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.bluePrimary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/garrafa-de-agua1.png',
              width: 200,
            ),
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              width: 30,
              child: LinearProgressIndicator(
                color: ColorsApp.white,
                minHeight: 3.5,
              ),
            )
          ],
        ),
      ),
    );
  }
}
