import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taller_29_mayo_front/app/model/task.dart';
import 'package:taller_29_mayo_front/app/utils/get_color_from_key.dart';
import 'package:taller_29_mayo_front/app/view/home/dialogs/config_task.dart';
import 'package:taller_29_mayo_front/app/view/home/home_controller.dart';

class MyTask extends StatelessWidget {
  final Task task;
  const MyTask({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: task.active ?? false ? 1 : 0.7,
      child: GestureDetector(
        onTap: () {
          configTaskDialog(context, true, task);
        },
        child: Material(
          elevation: 5.0,
          shadowColor: Colors.black,
          borderRadius: BorderRadius.circular(7),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: circleButton(context, task.color),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        task.title ?? '',
                        style: const TextStyle(fontSize: 15),
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        task.description ?? '',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black.withOpacity(0.7),
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: deleteButton(context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget circleButton(BuildContext context, String? taskColor) {
    return GestureDetector(
      onTap: () {
        context.read<HomeController>().changeStatusTask(context, task);
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: getColorFromKey(taskColor) ?? const Color(0xFF000000),
          ),
          shape: BoxShape.circle,
        ),
        child: Icon(
          task.active! ? null : Icons.check,
          color: getColorFromKey(taskColor),
        ),
      ),
    );
  }

  Widget deleteButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<HomeController>().deleteTask(
              context,
              task.uuidTask!,
            );
      },
      child: const Icon(Icons.delete, size: 20),
    );
  }
}
