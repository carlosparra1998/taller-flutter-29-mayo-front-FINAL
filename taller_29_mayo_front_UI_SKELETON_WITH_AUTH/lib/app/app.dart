import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taller_29_mayo_front/app/view/auth/auth_controller.dart';
import 'package:taller_29_mayo_front/app/view/home/home_controller.dart';

import 'view/auth/login/login_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthController>(create: (_) => AuthController()),
        ChangeNotifierProvider<HomeController>(create: (_) => HomeController()),
      ],
      child: MaterialApp(
        title: 'My TODO App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
          useMaterial3: true,
        ),
        home: const LoginView(),
      ),
    );
  }
}
