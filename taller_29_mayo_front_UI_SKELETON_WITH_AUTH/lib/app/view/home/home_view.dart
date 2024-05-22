import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taller_29_mayo_front/app/model/task.dart';
import 'package:taller_29_mayo_front/app/reutilizables/my_task.dart';
import 'package:taller_29_mayo_front/app/view/home/home_controller.dart';

import 'dialogs/config_task.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    context.read<HomeController>().getTasks(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeController>(
      builder: (_, provider, __) {
        List<Task> activeTasks =
            provider.userTasks.where((element) => element.active!).toList();
        List<Task> noActiveTasks =
            provider.userTasks.where((element) => !element.active!).toList();
        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            backgroundColor: Colors.blueAccent,
            automaticallyImplyLeading: false,
            title: const Text('Home'),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 12),
            child: SingleChildScrollView(
              child: Column(
                children: activeTasks.isEmpty && noActiveTasks.isEmpty
                    ? [emptyMessage()]
                    : [
                        ...List.generate(
                          activeTasks.length,
                          (index) => Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: MyTask(task: activeTasks[index]),
                          ),
                        ),
                        const Divider(),
                        const SizedBox(height: 10),
                        ...List.generate(
                          noActiveTasks.length,
                          (index) => Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: MyTask(task: noActiveTasks[index]),
                          ),
                        ),
                      ],
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            elevation: 5,
            onPressed: () {
              configTaskDialog(context, false, null);
            },
            backgroundColor: Colors.blueAccent,
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }

  Widget emptyMessage() {
    return const Text(
      'Para crear una tarea, presiona el botón flotante',
      style: TextStyle(fontSize: 20),
    );
  }
}
