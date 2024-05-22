import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:taller_29_mayo_front/app/repository/http_client.dart';
import 'package:taller_29_mayo_front/app/repository/services/user_services.dart';
import 'package:taller_29_mayo_front/app/repository/shared_preference_client.dart';
import 'package:taller_29_mayo_front/app/utils/toast.dart';

class AuthController extends ChangeNotifier {
  TextEditingController registerUserName = TextEditingController();
  TextEditingController registerPassword = TextEditingController();
  TextEditingController registerConfirmPassword = TextEditingController();

  TextEditingController loginUserName = TextEditingController();
  TextEditingController loginPassword = TextEditingController();

  Future<bool> registerUser(BuildContext context) async {
    if (registerUserName.text.isEmpty) {
      showToast(context, "El usuario debe estar cumplimentado");
      return false;
    }
    if (registerPassword.text.isEmpty || registerConfirmPassword.text.isEmpty) {
      showToast(context, "Debes introducir una contraseña");
      return false;
    }
    if (registerPassword.text != registerConfirmPassword.text) {
      showToast(context, "Las contraseñas no coinciden");
      return false;
    }
    HttpResponse response = await UserServices.registerUser(
      registerUserName.text,
      registerPassword.text,
    );
    if (response.hasError) {
      showToast(context, response.msg ?? "Error en el sistema");
      return false;
    }
    showToast(context, "Usuario registrado correctamente");
    return true;
  }

  Future<bool> loginUser(BuildContext context) async {
    if (loginUserName.text.isEmpty) {
      showToast(context, "Introduce un usuario");
      return false;
    }
    if (loginPassword.text.isEmpty) {
      showToast(context, "Introduce una contraseña");
      return false;
    }
    HttpResponse response = await UserServices.loginUser(
      loginUserName.text,
      loginPassword.text,
    );
    if (response.hasError) {
      showToast(context, response.msg ?? "Error en el sistema");
      return false;
    }
    dynamic data = jsonDecode(response.data);

    await SharedPreferenceClient.setString('access_token', data['data']['access_token']);
    await SharedPreferenceClient.setString('access_token', data['data']['access_token']);
    await SharedPreferenceClient.setString('user_name', loginUserName.text);
  
    notifyListeners();
    return true;
  }
}
