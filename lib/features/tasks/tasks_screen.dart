import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasky/core/components/task_list_widget.dart';
import 'package:tasky/features/tasks/tasks_controller.dart';

class ToDoTasksScreen extends StatelessWidget {
  const ToDoTasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TasksController>(
      create: (context) => TasksController()..init(),
      child: Builder(builder: (context) {
        final controller = context.read<TasksController>();
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text(
                'To Do Tasks',
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: controller.isLoading
                    ? Center(child: CircularProgressIndicator())
                    : Consumer<TasksController>(
                        builder: (context, value, _) => TaskListWidget(
                          tasks: value.todoTasks,
                          onTap: value.doneTask,
                          emptyMessage: 'No Task Found',
                          onDelete: value.deleteTask,
                          onEdit: value.loadTask,
                        ),
                      ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
