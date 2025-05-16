import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasky/core/components/task_list_widget.dart';
import 'package:tasky/core/constants/storage_key.dart';
import 'package:tasky/core/services/preferences_manager.dart';
import 'package:tasky/features/tasks/controllers/tasks_controller.dart';
import 'package:tasky/models/task_model.dart';

class HighPriorityScreen extends StatelessWidget {
  const HighPriorityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TasksController()..init(),
      builder: (context , _){
        final controller = context.read<TasksController>();
        return Scaffold(
          appBar: AppBar(
            title: Text('High Priority Tasks'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: controller.isLoading
                ? Center(child: CircularProgressIndicator())
                : Consumer<TasksController>(
                  builder: (BuildContext context, value, Widget? child) {
                    return TaskListWidget(
                      tasks: value.highPriorityTasks,
                      onTap: (value, index) async {
                        controller.doneHighPriorityTask(value, index);
                      },
                      emptyMessage: 'No Task Found',
                      onDelete: (int? id) {
                        controller.deleteTask(id);
                      },
                      onEdit: () {
                        controller.init();
                      },
                    );
                  },

                ),
          ),
        );
      },

    );
  }
}
