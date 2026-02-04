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
  int totalTask = 0;
  int totalDoneTasks = 0;
  double percent = 0;

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
      calculatePercent();

      todoTasks = allTasks.where((element) => !element.isDone).toList();
      completeTasks = allTasks.where((element) => element.isDone).toList();
      highPriorityTasks =
          allTasks.where((element) => element.isHighPriority).toList();
    }

    isLoading = false;
    notifyListeners();
  }

  calculatePercent() {
    percent = allTasks.isEmpty ? 0 : completeTasks.length / allTasks.length;
    notifyListeners();
  }

  void doneTask(bool? value, int id) async {
    final int index = allTasks.indexWhere((e) => e.id == id);
    allTasks[index].isDone = value ?? false;
    calculatePercent();
    loadTask();
    final updatedTask = allTasks.map((element) => element.toJson()).toList();
    await PreferencesManager().setString('tasks', jsonEncode(updatedTask));
    notifyListeners();
  }

  void deleteTask(int? id) async {
    if (id == null) return;
    allTasks.removeWhere((e) => e.id == id);
    todoTasks.removeWhere((task) => task.id == id);
    completeTasks.removeWhere((task) => task.id == id);
    highPriorityTasks.removeWhere((task) => task.id == id);
    final updatedTask = allTasks.map((element) => element.toJson()).toList();
    PreferencesManager().setString('tasks', jsonEncode(updatedTask));
    calculatePercent();
    notifyListeners();
  }
}
