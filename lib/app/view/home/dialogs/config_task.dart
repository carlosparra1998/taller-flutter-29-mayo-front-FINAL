import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taller_29_mayo_front/app/model/task.dart';
import 'package:taller_29_mayo_front/app/reutilizables/my_button.dart';
import 'package:taller_29_mayo_front/app/reutilizables/my_dropdown.dart';
import 'package:taller_29_mayo_front/app/reutilizables/my_text_field.dart';
import 'package:taller_29_mayo_front/app/utils/get_color_from_key.dart';
import 'package:taller_29_mayo_front/app/view/home/home_controller.dart';

Future<String?> configTaskDialog(
  BuildContext context,
  bool editMode,
  Task? taskEdit,
) async {
  editMode && taskEdit != null
      ? context.read<HomeController>().setTaskInForm(taskEdit)
      : context.read<HomeController>().clearForms();
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          icon: const Icon(Icons.task),
          title: Text(editMode ? 'Editar Tarea' : 'Añadir Tarea'),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const SizedBox(height: 15.0),
                MyTextField(
                  labelText: 'Título (requerido)',
                  smallMode: true,
                  controller: context.read<HomeController>().titleTask,
                ),
                const SizedBox(height: 20),
                MyTextField(
                  labelText: 'Descripción',
                  controller: context.read<HomeController>().descriptionTask,
                ),
                const SizedBox(height: 20),
                MyDropdown(
                  labelText: 'Color',
                  items: colorKeys,
                  value: context.read<HomeController>().colorTask.text.isEmpty
                      ? null
                      : context.read<HomeController>().colorTask.text,
                  onChanged: (v) {
                    context.read<HomeController>().changeColorFromDropdown(v);
                  },
                  smallMode: true,
                ),
                const SizedBox(height: 20),
                MyButton(
                  label: 'Guardar',
                  onPressed: () async {
                    bool success = editMode
                        ? await context.read<HomeController>().modifierTask(
                              context,
                              taskEdit!,
                            )
                        : await context.read<HomeController>().addNewTask(context);

                    if(success){
                      Navigator.pop(context);
                    }
                  },
                )
              ],
            ),
          ),
        );
      });
}
