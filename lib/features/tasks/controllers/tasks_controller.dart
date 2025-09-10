import 'package:flutter/cupertino.dart';
import 'package:tasky/core/services/file_storage_manager.dart';
import 'package:tasky/models/task_model.dart';

class TasksController extends ChangeNotifier {
  bool isLoading = false;

  List<TaskModel> tasks = [];
  List<TaskModel> completeTasks = [];
  List<TaskModel> todoTasks = [];
  List<TaskModel> highPriorityTasks = [];

  int totalTask = 0;
  int totalDoneTasks = 0;
  double percent = 0;

  init() {
    _loadTasks();
  }

  void _loadTasks() async {
    isLoading = true;

    final tasksData = await FileStorageManager().loadTasks();

    tasks = tasksData.map((element) => TaskModel.fromJson(element)).toList();

    _loadData();

    _calculatePercent();

    isLoading = false;

    notifyListeners();
  }

  void _loadData() async {
    todoTasks = tasks.where((element) => !element.isDone).toList();
    completeTasks = tasks.where((element) => element.isDone).toList();
    highPriorityTasks =
        tasks.where((element) => element.isHighPriority).toList();
    highPriorityTasks = highPriorityTasks.reversed.toList();
  }

  void doneTask(bool? value, int id) async {
    final index = tasks.indexWhere((e) => e.id == id);
    tasks[index].isDone = value ?? false;

    _loadData();
    _calculatePercent();

    final updatedTask = tasks.map((element) => element.toJson()).toList();

    FileStorageManager().saveTasks(updatedTask);

    notifyListeners();
  }

  deleteTask(int? id) async {
    if (id == null) return;

    tasks.removeWhere((e) => e.id == id);

    _loadData();
    _calculatePercent();

    final updatedTask = tasks.map((element) => element.toJson()).toList();

    FileStorageManager().saveTasks(updatedTask);

    notifyListeners();
  }

  _calculatePercent() {
    totalTask = tasks.length;
    totalDoneTasks = tasks.where((e) => e.isDone).length;
    percent = totalTask == 0 ? 0 : totalDoneTasks / totalTask;
  }

  clearTasks(){
    _loadTasks();
  }
}
