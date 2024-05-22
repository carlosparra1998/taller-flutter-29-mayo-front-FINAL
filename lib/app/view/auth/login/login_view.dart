import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taller_29_mayo_front/app/reutilizables/my_button.dart';
import 'package:taller_29_mayo_front/app/reutilizables/my_text_field.dart';
import 'package:taller_29_mayo_front/app/view/auth/auth_controller.dart';
import 'package:taller_29_mayo_front/app/view/auth/register/register_view.dart';
import 'package:taller_29_mayo_front/app/view/home/home_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthController>(
      builder: (_, provider, __) => Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          title: const Text('Login'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 7.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'Bienvenido a My TODO App!',
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 40),
                MyTextField(
                  labelText: 'Usuario',
                  controller: provider.loginUserName,
                ),
                const SizedBox(height: 20),
                MyTextField(
                  labelText: 'Contraseña',
                  passwordMode: true,
                  controller: provider.loginPassword,
                ),
                const SizedBox(height: 30),
                MyButton(
                  label: 'Inicio',
                  onPressed: () async {
                    bool success = await provider.loginUser(context);
                    if (success) {
                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => HomeView()),
                        (Route<dynamic> route) => false,
                      );
                    }
                  },
                ),
                const SizedBox(height: 20),
                MyButton(
                  label: 'No tienes cuenta, regístrate',
                  containsBorder: false,
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const RegisterView(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
