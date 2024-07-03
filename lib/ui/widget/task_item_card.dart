import 'package:flutter/material.dart';
import 'package:ostad_project/data/models/task_list_model.dart';
class TaskItemCard extends StatelessWidget {
  const TaskItemCard({
    super.key, required this.taskListModel,
  });
  final TaskListModel taskListModel;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.white,
      child: ListTile(
        title: Text(
          taskListModel.title ?? '',
          style:
          const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(taskListModel.description ?? ''),
            Text(taskListModel.createdDate ?? ''),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Chip(
                  label: Text('New'),
                ),
                ButtonBar(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.delete_forever_outlined)),
                    IconButton(
                        onPressed:(){}, icon: const Icon(Icons.edit)),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

}
