import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasky/core/components/task_list_widget.dart';
import 'package:tasky/core/constants/app_sizes.dart';
import 'package:tasky/features/tasks/controllers/tasks_controller.dart';

class HighPriorityScreen extends StatelessWidget {
  const HighPriorityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.read<TasksController>();
    return Scaffold(
      appBar: AppBar(
        title: Text('High Priority Tasks'),
      ),
      body: Padding(
        padding:  EdgeInsets.all(AppSizes.pw16),
        child: controller.isLoading
            ? Center(child: CircularProgressIndicator())
            : Consumer<TasksController>(
                builder: (BuildContext context, valueController, Widget? child) {
                  return TaskListWidget(
                    tasks: valueController.highPriorityTasks,
                    onTap: (value, index) async {
                      controller.doneTask(value, valueController.highPriorityTasks[index!].id);
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
  }
}
