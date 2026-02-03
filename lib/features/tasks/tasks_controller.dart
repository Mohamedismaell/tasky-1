import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tasky/core/services/preferences_manager.dart';
import 'package:tasky/models/task_model.dart';

class TasksController with ChangeNotifier {
  List<TaskModel> allTasks = [];
  List<TaskModel> todoTasks = [];
  List<TaskModel> completeTasks = [];
  List<TaskModel> highPriorityTasks = [];
  bool isLoading = false;

  void init() {
    loadTask();
    print(allTasks);
    print(todoTasks);
    print(completeTasks);
  }

  void loadTask() async {
    isLoading = true;

    final tasks = PreferencesManager().getString('tasks');
    if (tasks != null) {
      final taskAfterDecode = jsonDecode(tasks) as List<dynamic>;

      allTasks = taskAfterDecode
          .map((element) => TaskModel.fromJson(element))
          .toList();
      // calculatePercent();

      todoTasks = allTasks.where((element) => !element.isDone).toList();
      completeTasks = allTasks.where((element) => element.isDone).toList();
      highPriorityTasks =
          allTasks.where((element) => element.isHighPriority).toList();
    }

    isLoading = false;
    notifyListeners();
  }

  void doneTask(bool? value, int? index) async {
    if (index == null) return;
    todoTasks[index].isDone = value ?? false;

    final int newIndex =
        allTasks.indexWhere((e) => e.id == todoTasks[index].id);
    allTasks[newIndex] = todoTasks[index];

    await PreferencesManager().setString('tasks', jsonEncode(allTasks));
    loadTask();
    notifyListeners();
  }

  void doneCompleteTask(bool? value, int? index) async {
    if (index == null) return;
    completeTasks[index].isDone = value ?? false;

    final int newIndex =
        allTasks.indexWhere((e) => e.id == completeTasks[index].id);
    allTasks[newIndex] = completeTasks[index];

    await PreferencesManager().setString('tasks', jsonEncode(allTasks));
    loadTask();
    notifyListeners();
  }

  void doneHighPriorityTask(bool? value, int? index) async {
    if (index == null) return;
    highPriorityTasks[index].isDone = value ?? false;

    final int newIndex =
        allTasks.indexWhere((e) => e.id == highPriorityTasks[index].id);
    allTasks[newIndex] = highPriorityTasks[index];

    await PreferencesManager().setString('tasks', jsonEncode(allTasks));
    loadTask();
    notifyListeners();
  }

  void deleteTask(int? id) async {
    if (id == null) return;
    allTasks.removeWhere((e) => e.id == id);
    todoTasks.removeWhere((task) => task.id == id);
    //!
    completeTasks.removeWhere((task) => task.id == id);
    highPriorityTasks.removeWhere((task) => task.id == id);
    final updatedTask = allTasks.map((element) => element.toJson()).toList();
    PreferencesManager().setString('tasks', jsonEncode(updatedTask));
    notifyListeners();
  }
}
