import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasky/core/components/task_list_widget.dart';
import 'package:tasky/features/tasks/tasks_controller.dart';

class HighPriorityScreen extends StatefulWidget {
  const HighPriorityScreen({super.key});

  @override
  State<HighPriorityScreen> createState() => _HighPriorityScreenState();
}

class _HighPriorityScreenState extends State<HighPriorityScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TasksController>(
      create: (context) => TasksController()..init,
      child: Scaffold(
        appBar: AppBar(
          title: Text('High Priority Tasks'),
        ),
        body: Builder(builder: (context) {
          final controller = context.read<TasksController>();
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: controller.isLoading
                ? Center(child: CircularProgressIndicator())
                : Consumer<TasksController>(
                    builder: (context, value, _) => TaskListWidget(
                        tasks: value.highPriorityTasks,
                        onTap: value.doneHighPriorityTask,
                        emptyMessage: 'No Task Found',
                        onDelete: value.deleteTask,
                        onEdit: value.loadTask),
                  ),
          );
        }),
      ),
    );
  }
}
