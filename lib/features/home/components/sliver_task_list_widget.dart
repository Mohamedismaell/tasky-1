import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasky/core/components/task_item_widget.dart';
import 'package:tasky/features/tasks/tasks_controller.dart';

class SliverTaskListWidget extends StatelessWidget {
  const SliverTaskListWidget({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Consumer<TasksController>(
        builder: (context, controller, child) => controller.allTasks.isEmpty
            ? SliverToBoxAdapter(
                child: Center(
                  child: Text(
                    // controller.
                    'No Data',
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                ),
              )
            : SliverPadding(
                padding: EdgeInsets.only(bottom: 80),
                sliver: SliverList.separated(
                  itemCount: controller.allTasks.length,
                  itemBuilder: (BuildContext context, int index) {
                    return TaskItemWidget(
                        model: controller.allTasks[index],
                        onChanged: (bool? value) {
                          controller.doneTask(
                              value, controller.allTasks[index].id);
                        },
                        onDelete: (int id) {
                          controller.deleteTask(id);
                        },
                        onEdit: () => controller.loadTask);
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(height: 8);
                  },
                ),
              ));
  }
}
