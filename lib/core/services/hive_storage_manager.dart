import 'package:hive_ce_flutter/adapters.dart';
import 'package:tasky/core/constants/constants.dart';
import 'package:tasky/models/task_model.dart';

class HiveStorageManager {
  static final HiveStorageManager _instance = HiveStorageManager._();

  HiveStorageManager._();

  factory HiveStorageManager() {
    return _instance;
  }

  late Box<TaskModel> _taskBox;

  init() async {
    await Hive.initFlutter();

    Hive.registerAdapter(TaskModelAdapter());

    _taskBox = await Hive.openBox<TaskModel>(Constants.tasksNameCollection);
  }

  saveTasks(List<TaskModel> list) async {
    await _taskBox.clear();
    await _taskBox.addAll(list);
  }

  List<TaskModel> loadTasks() {
    return _taskBox.values.toList();
  }

  clear() async {
    await _taskBox.clear();
  }
}
