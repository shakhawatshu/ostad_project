import 'package:flutter/material.dart';
import 'package:ostad_project/data/models/task_list_model.dart';
import 'package:ostad_project/data/models/task_list_model_warp.dart';
import 'package:ostad_project/data/network_caller/network_caller.dart';
import 'package:ostad_project/data/network_caller/network_response.dart';
import 'package:ostad_project/data/network_path_url/urls.dart';
import 'package:ostad_project/ui/widget/circle_progress_indicator_widget.dart';
import 'package:ostad_project/ui/widget/snackbar.dart';
import 'package:ostad_project/ui/widget/task_item_card.dart';

class CancelledTaskScreen extends StatefulWidget {
  const CancelledTaskScreen({super.key});

  @override
  State<CancelledTaskScreen> createState() => _CancelledTaskScreenState();
}

bool _getCancelledTaskInProgress = false;

class _CancelledTaskScreenState extends State<CancelledTaskScreen> {
  List<TaskListModel> cancelTaskList = [];

  @override
  void initState() {
    super.initState();
    _getCancelledTaskApi();
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
            visible: _getCancelledTaskInProgress == false,
            replacement: const CircleProgressIndicatorWidget(),
            child: ListView.builder(
              itemCount: cancelTaskList.length,
              itemBuilder: (context, index) {
                return TaskItemCard(
                  taskListModel: cancelTaskList[index],
                  onUpdateTask: () {_getCancelledTaskApi();},
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _getCancelledTaskApi() async {
    _getCancelledTaskInProgress = true;
    if (mounted) {
      setState(() {});}
      final NetworkResponse response =
          await NetworkCaller.getRequest(Urls.cancelledTaskListURL);
      if (response.isSuccess) {
        TaskListModelWarp taskListModelWarp =
        TaskListModelWarp.fromJson(response.responseData);
        cancelTaskList = taskListModelWarp.data ?? [];
      }else{
        if(mounted){
          showSnackBarMessage(context, 'Get cancelled task list failed');
        }
      }
      _getCancelledTaskInProgress =false;
      if(mounted){
        setState(() {});
      }
  }
}
