import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tasky/core/services/preferences_manager.dart';
import 'package:tasky/models/task_model.dart';

class AddTaskController with ChangeNotifier {
  late GlobalKey<FormState> key;
  late TextEditingController taskNameController;
  late TextEditingController taskDescriptionController;

  bool isHighPriority = true;
  List<dynamic> listTasks = [];

  void init() {
    key = GlobalKey<FormState>();
    taskNameController = TextEditingController();
    taskDescriptionController = TextEditingController();
  }

  void changePriorty(value) {
    isHighPriority = value;
    notifyListeners();
  }

  void addTask(BuildContext context) async {
    if (key.currentState?.validate() ?? false) {
      final taskJson = PreferencesManager().getString('tasks');

      List<dynamic> listTasks = [];

      if (taskJson != null) {
        listTasks = jsonDecode(taskJson);
      }

      // listTasks.length = 1 -> 1 + 1
      TaskModel model = TaskModel(
        id: listTasks.length + 1,
        taskName: taskNameController.text,
        taskDescription: taskDescriptionController.text,
        isHighPriority: isHighPriority,
      );

      listTasks.add(model.toJson());

      final taskEncode = jsonEncode(listTasks);
      await PreferencesManager().setString('tasks', taskEncode);
      Navigator.of(context).pop(true);
    }
  }

  void onDispose() {
    taskNameController.dispose();
    taskDescriptionController.dispose();
  }
}
