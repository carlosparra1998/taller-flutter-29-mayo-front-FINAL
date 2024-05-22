import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:taller_29_mayo_front/app/model/task.dart';
import 'package:taller_29_mayo_front/app/repository/http_client.dart';
import 'package:taller_29_mayo_front/app/repository/services/task_services.dart';
import 'package:taller_29_mayo_front/app/repository/shared_preference_client.dart';
import 'package:taller_29_mayo_front/app/utils/toast.dart';

class HomeController extends ChangeNotifier {
  TextEditingController titleTask = TextEditingController();
  TextEditingController descriptionTask = TextEditingController();
  TextEditingController colorTask = TextEditingController();

  List<Task> userTasks = [];

  void getTasks(BuildContext context) async {
    HttpResponse response = await TaskServices.getTasks();
    if (response.hasError) {
      showToast(context, response.msg ?? "Error en el sistema");
      return;
    }
    userTasks = (jsonDecode(response.data)["data"] as List)
        .map((element) => Task.fromJson(element))
        .toList();
    notifyListeners();
  }

  Future<bool> addNewTask(BuildContext context) async {
    if (titleTask.text.isEmpty) {
      showToast(context, "Debes introducir al menos un título");
      return false;
    }
    Task newTask = Task(
      uuidTask: "default",
      userName: await SharedPreferenceClient.getString('user_name'),
      title: titleTask.text,
      description: descriptionTask.text,
      color: colorTask.text.isEmpty ? null : colorTask.text,
      active: true,
    );
    HttpResponse response = await TaskServices.addTask(newTask);
    if (response.hasError) {
      showToast(context, response.msg ?? "Error en el sistema");
      return false;
    }
    newTask.uuidTask = jsonDecode(response.data)['data']['uuidTask'];
    userTasks.add(newTask);
    notifyListeners();
    return true;
  }

  Future<bool> modifierTask(BuildContext context, Task task) async {
    if (titleTask.text.isEmpty) {
      showToast(context, "Debes introducir al menos un título");
      return false;
    }
    task.title = titleTask.text;
    task.description = descriptionTask.text;
    task.color = colorTask.text.isEmpty ? null : colorTask.text;

    HttpResponse response = await TaskServices.modTask(task);
    if (response.hasError) {
      showToast(context, response.msg ?? "Error en el sistema");
      return false;
    }
    int taskIndex = userTasks.indexWhere((e) => e.uuidTask == task.uuidTask);
    userTasks[taskIndex] = task;
    notifyListeners();
    return true;
  }

  void changeStatusTask(BuildContext context, Task task) async {
    task.active = !task.active!;
    HttpResponse response = await TaskServices.modTask(task);
    if (response.hasError) {
      showToast(context, response.msg ?? "Error en el sistema");
      return;
    }
    int index = userTasks.indexWhere((e) => task.uuidTask == e.uuidTask);
    userTasks[index].active = task.active!;
    notifyListeners();
  }

  void deleteTask(BuildContext context, String uuidTask) async {
    HttpResponse response = await TaskServices.deleteTask(uuidTask);
    if (response.hasError) {
      showToast(context, response.msg ?? "Error en el sistema");
      return;
    }
    userTasks.removeWhere((e) => e.uuidTask == uuidTask);
    notifyListeners();
  }

  void setTaskInForm(Task task) {
    titleTask.text = task.title ?? "";
    descriptionTask.text = task.description ?? "";
    colorTask.text = task.color ?? "";
    notifyListeners();
  }

  void changeColorFromDropdown(String? color) {
    colorTask.text = color ?? "";
    notifyListeners();
  }

  void clearForms() {
    titleTask.clear();
    descriptionTask.clear();
    colorTask.clear();
    notifyListeners();
  }
}
