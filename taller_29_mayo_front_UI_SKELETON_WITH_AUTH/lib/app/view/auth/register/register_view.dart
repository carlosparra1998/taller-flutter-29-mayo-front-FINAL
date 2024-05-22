import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taller_29_mayo_front/app/reutilizables/my_button.dart';
import 'package:taller_29_mayo_front/app/reutilizables/my_text_field.dart';
import 'package:taller_29_mayo_front/app/view/auth/auth_controller.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthController>(
      builder: (_, provider, __) => Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          title: const Text('Registro'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 7.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'Únete a nuestro gran servicio para gestionar tus tareas',
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),
                MyTextField(
                  labelText: 'Usuario',
                  controller: provider.registerUserName,
                ),
                const SizedBox(height: 20),
                MyTextField(
                  labelText: 'Contraseña',
                  passwordMode: true,
                  controller: provider.registerPassword,
                ),
                const SizedBox(height: 20),
                MyTextField(
                  labelText: 'Repite la contraseña',
                  passwordMode: true,
                  controller: provider.registerConfirmPassword,
                ),
                const SizedBox(height: 30),
                MyButton(
                  label: 'Registro',
                  onPressed: () async {
                    bool success = await provider.registerUser(context);
                    if (success) {
                      Navigator.pop(context);
                    }
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
