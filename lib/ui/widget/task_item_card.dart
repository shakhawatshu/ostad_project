import 'package:flutter/material.dart';
import 'package:ostad_project/data/models/task_list_model.dart';
import 'package:ostad_project/data/network_caller/network_caller.dart';
import 'package:ostad_project/data/network_caller/network_response.dart';
import 'package:ostad_project/data/network_path_url/urls.dart';
import 'package:ostad_project/ui/widget/circle_progress_indicator_widget.dart';
import 'package:ostad_project/ui/widget/snackbar.dart';

class TaskItemCard extends StatefulWidget {
  const TaskItemCard({
    super.key,
    required this.taskListModel,
    required this.onUpdateTask,
  });

  final TaskListModel taskListModel;
  final VoidCallback onUpdateTask;

  @override
  State<TaskItemCard> createState() => _TaskItemCardState();
}

bool _taskDeleteInProgress = false;

class _TaskItemCardState extends State<TaskItemCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.white,
      child: ListTile(
        title: Text(
          widget.taskListModel.title ?? '',
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.taskListModel.description ?? ''),
            Text(widget.taskListModel.createdDate ?? ''),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Chip(
                  label: Text('New'),
                ),
                ButtonBar(
                  children: [
                    Visibility(
                      visible: _taskDeleteInProgress == false,
                      replacement: const CircleProgressIndicatorWidget(),
                      child: IconButton(
                          onPressed: _deleteTaskApi,
                          icon: const Icon(Icons.delete_forever_outlined)),
                    ),
                    IconButton(onPressed: () {}, icon: const Icon(Icons.edit)),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Future<void> _deleteTaskApi() async {
    _taskDeleteInProgress = true;
    if (mounted) {
      setState(() {});
    }
    final NetworkResponse response = await NetworkCaller.getRequest(
      Urls.deleteTaskUrl(widget.taskListModel.sId!),
    );
    if (response.isSuccess) {
      widget.onUpdateTask();
      if(mounted){
        showSnackBarMessage(context, 'Task deleted');
      }
    } else {
      if (mounted) {
        showSnackBarMessage(context, 'Delete task failed!');
      }
    }
    _taskDeleteInProgress = false;
    if(mounted){
      setState(() {});
    }
  }
}
