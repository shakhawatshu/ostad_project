import 'package:flutter/material.dart';
import 'package:ostad_project/data/models/task_list_model.dart';
import 'package:ostad_project/data/models/task_list_model_warp.dart';
import 'package:ostad_project/data/network_caller/network_caller.dart';
import 'package:ostad_project/data/network_caller/network_response.dart';
import 'package:ostad_project/data/network_path_url/urls.dart';
import 'package:ostad_project/ui/widget/circle_progress_indicator_widget.dart';
import 'package:ostad_project/ui/widget/snackbar.dart';
import 'package:ostad_project/ui/widget/task_item_card.dart';

class InProgressTaskScreen extends StatefulWidget {
  const InProgressTaskScreen({super.key});

  @override
  State<InProgressTaskScreen> createState() => _InProgressTaskScreenState();
}

bool _inProgressTaskListInProgress = false;

List<TaskListModel> inProgressTaskList = [];

class _InProgressTaskScreenState extends State<InProgressTaskScreen> {
  @override
  void initState() {
    super.initState();
    _inProgressTaskListApi();
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
            visible: _inProgressTaskListInProgress == false,
            replacement: const CircleProgressIndicatorWidget(),
            child: ListView.builder(
              itemCount: inProgressTaskList.length,
              itemBuilder: (context, index) {
                return TaskItemCard(
                  taskListModel: inProgressTaskList[index],
                  onUpdateTask: () {
                    _inProgressTaskListApi();
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _inProgressTaskListApi() async {
    _inProgressTaskListInProgress = true;
    if (mounted) {
      setState(() {});
    }
    NetworkResponse response =
        await NetworkCaller.getRequest(Urls.inProgressTaskListURL);
    if (response.isSuccess) {
      TaskListModelWarp taskListModelWarp =
          TaskListModelWarp.fromJson(response.responseData);
      inProgressTaskList = taskListModelWarp.data ?? [];
    } else {
      if (mounted) {
        showSnackBarMessage(
            context, response.errorMessage ?? 'Get progress task list failed!');
      }
    }
    _inProgressTaskListInProgress = false;
    if (mounted) {
      setState(() {});
    }
  }
}
