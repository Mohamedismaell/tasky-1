import 'package:flutter/material.dart';
import 'package:tasky/core/services/file_storage_manager.dart';
import 'package:tasky/models/task_model.dart';

class AddTaskController extends ChangeNotifier {
  final GlobalKey<FormState> key = GlobalKey<FormState>();

  final TextEditingController taskNameController = TextEditingController();

  final TextEditingController taskDescriptionController =
      TextEditingController();

  bool isHighPriority = true;

  void addTask(BuildContext context) async {
    if (key.currentState?.validate() ?? false) {
      List<dynamic> listTasks = await FileStorageManager().loadTasks();

      TaskModel model = TaskModel(
        id: listTasks.length + 1,
        taskName: taskNameController.text,
        taskDescription: taskDescriptionController.text,
        isHighPriority: isHighPriority,
      );

      listTasks.add(model.toJson());

      await FileStorageManager().saveTasks(listTasks);

      Navigator.of(context).pop(true);
    }
  }

  void toggle(bool value) {
    isHighPriority = value;
    notifyListeners();
  }
}
