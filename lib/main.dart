import 'package:appaguaentregados/app/common/inject/inject_dependecy.dart';
import 'package:appaguaentregados/app/main_app.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  InjectDependency.init();
  runApp(const MainApp());
}
