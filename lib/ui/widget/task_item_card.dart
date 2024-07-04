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

class _TaskItemCardState extends State<TaskItemCard> {
  bool _taskDeleteInProgress = false;
  bool _taskStatusUpdateInProgress = false;

  String popUpMenuButtonValue = '';
  List<String> statusList = ['new', 'completed', 'progress', 'cancelled'];

  @override
  void initState() {
    super.initState();
    popUpMenuButtonValue = widget.taskListModel.status!;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
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
                Chip(
                  label: Text(widget.taskListModel.status!),
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
                    Visibility(
                      visible: _taskStatusUpdateInProgress == false,
                      replacement: const CircleProgressIndicatorWidget(),
                      child: PopupMenuButton<String>(
                        icon: const Icon(Icons.edit),
                        onSelected: (String selectedValue) {
                          popUpMenuButtonValue = selectedValue;
                          if (mounted) {
                            setState(() {});
                          }
                          _updateTaskStatusApi();
                        },
                        itemBuilder: (BuildContext context) {
                          return statusList.map((String value) {
                            return PopupMenuItem<String>(
                              value: value,
                              child: ListTile(
                                title: Text(value),
                                trailing: popUpMenuButtonValue == value
                                    ? const Icon(Icons.done)
                                    : null,
                              ),
                            );
                          }).toList();
                        },
                      ),
                    ),
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
      if (mounted) {
        showSnackBarMessage(context, 'Task deleted');
      }
    } else {
      if (mounted) {
        showSnackBarMessage(context, 'Delete task failed!');
      }
    }
    _taskDeleteInProgress = false;
    if (mounted) {
      setState(() {});
    }
  }

  Future<void> _updateTaskStatusApi() async {
    _taskStatusUpdateInProgress = true;
    if (mounted) {
      setState(() {});
    }
    final NetworkResponse response = await NetworkCaller.getRequest(
      Urls.changeTaskStatusUrl(widget.taskListModel.sId!, popUpMenuButtonValue),
    );
    if (response.isSuccess) {
      if (mounted) {
        showSnackBarMessage(context, 'Task status updated');
      }
      widget.onUpdateTask();
    } else {
      if (mounted) {
        showSnackBarMessage(context, 'Change task Status failed');
      }
    }
    _taskStatusUpdateInProgress = false;
    if (mounted) {
      setState(() {});
    }
  }
}
