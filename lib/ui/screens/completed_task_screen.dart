import 'package:flutter/material.dart';
import 'package:ostad_project/data/models/task_list_model.dart';
import 'package:ostad_project/data/models/task_list_model_warp.dart';
import 'package:ostad_project/data/network_caller/network_caller.dart';
import 'package:ostad_project/data/network_caller/network_response.dart';
import 'package:ostad_project/data/network_path_url/urls.dart';
import 'package:ostad_project/ui/widget/circle_progress_indicator_widget.dart';
import 'package:ostad_project/ui/widget/snackbar.dart';
import 'package:ostad_project/ui/widget/task_item_card.dart';

class CompletedTaskScreen extends StatefulWidget {
  const CompletedTaskScreen({super.key});

  @override
  State<CompletedTaskScreen> createState() => _CompletedTaskScreenState();
}

bool _getCompletedTaskListInProgress = false;

List<TaskListModel> completedTaskList = [];

class _CompletedTaskScreenState extends State<CompletedTaskScreen> {
  @override
  void initState() {
    super.initState();
    _getCompletedTaskList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          left: 5,
          right: 5,
          top: 5,
        ),
        child: Expanded(
          child: Visibility(
            visible: _getCompletedTaskListInProgress == false,
            replacement: const CircleProgressIndicatorWidget(),
            child: ListView.builder(
              itemCount: completedTaskList.length,
              itemBuilder: (context, index) {
                return TaskItemCard(taskListModel: completedTaskList[index],
                    onUpdateTask: () {
                      _getCompletedTaskList();
                    });
              },
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _getCompletedTaskList() async {
    _getCompletedTaskListInProgress = true;
    if (mounted) {
      setState(() {});}
      NetworkResponse response =
          await NetworkCaller.getRequest(Urls.completedTaskListUrl);
      if (response.isSuccess) {
        TaskListModelWarp taskListModelWarp =
            TaskListModelWarp.fromJson(response.responseData);
        completedTaskList = taskListModelWarp.data ?? [];
      } else {
        if (mounted) {
          showSnackBarMessage(context,
              response.errorMessage ?? 'Get Completed task list failed');
        }
      }
    _getCompletedTaskListInProgress =false;
      if(mounted){
        setState(() {});
      }
  }
}
