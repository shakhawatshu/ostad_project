import 'package:flutter/material.dart';
import 'package:ostad_project/data/models/task_count_by_status_model.dart';
import 'package:ostad_project/data/models/task_count_by_status_warp.dart';
import 'package:ostad_project/data/models/task_list_model.dart';
import 'package:ostad_project/data/models/task_list_model_warp.dart';
import 'package:ostad_project/data/network_caller/network_caller.dart';
import 'package:ostad_project/data/network_caller/network_response.dart';
import 'package:ostad_project/data/network_path_url/urls.dart';
import 'package:ostad_project/ui/screens/add_new_task_screen.dart';
import 'package:ostad_project/ui/widget/circle_progress_indicator_widget.dart';
import 'package:ostad_project/ui/widget/snackbar.dart';
import 'package:ostad_project/ui/widget/task_item_card.dart';
import 'package:ostad_project/ui/widget/task_summary_card.dart';
import 'package:ostad_project/utility/app_design_data.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

bool _getNewTaskInProgress = false;
bool _getTaskCountByStatusInProgress = false;

List<TaskListModel> newTaskList = [];
List<TaskCountByStatusModel> taskCountList = [];

class _NewTaskScreenState extends State<NewTaskScreen> {
  @override
  void initState() {
    super.initState();
    _getTaskCountByStatus();
    _getNewTask();
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
        child: Column(
          children: [
            _buildTaskSummarySection(),
            const SizedBox(
              height: 4,
            ),
            Expanded(
              child: RefreshIndicator(
                onRefresh: () async {
                  _getTaskCountByStatus();
                  _getNewTask();
                },
                child: Visibility(
                  visible: _getNewTaskInProgress == false,
                  replacement: const CircleProgressIndicatorWidget(),
                  child: ListView.builder(
                    itemCount: newTaskList.length,
                    itemBuilder: (context, index) {
                      return TaskItemCard(
                        taskListModel: newTaskList[index],
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _newTaskScreenButton,
        backgroundColor: AppDesignData.defaultThemeColor,
        foregroundColor: Colors.white,
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildTaskSummarySection() {
    return  Visibility(
      visible: _getTaskCountByStatusInProgress == false,
      replacement: const CircleProgressIndicatorWidget(),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children:taskCountList.map((e){
            return TaskSummaryCard(
              title: (e.sId ?? 'Unknown').toUpperCase(),
              taskCount: e.sum.toString(),
            );
          }).toList()
        ),
      ),
    );
  }

  Future<void> _getNewTask() async {
    _getNewTaskInProgress = true;
    if (mounted) {
      setState(() {});
    }

    NetworkResponse response =
        await NetworkCaller.getRequest(Urls.newTaskListUrl);
    if (response.isSuccess) {
      TaskListModelWarp taskListModelWarp =
          TaskListModelWarp.fromJson(response.responseData);
      newTaskList = taskListModelWarp.data ?? [];
    } else {
      if (mounted) {
        showSnackBarMessage(
            context, response.errorMessage ?? 'Get new task failed!');
      }
    }
    _getNewTaskInProgress = false;
    if (mounted) {
      setState(() {});
    }
  }

  Future<void> _getTaskCountByStatus() async {
    _getTaskCountByStatusInProgress = true;
    if (mounted) {
      setState(() {});
    }
    NetworkResponse response =
        await NetworkCaller.getRequest(Urls.taskCountByStatusUrl);
    if (response.isSuccess) {
      TaskCountByStatusWarp taskCountByStatusWarp =
          TaskCountByStatusWarp.fromJson(response.responseData);
      taskCountList = taskCountByStatusWarp.taskCountByStatusList ?? [];
    } else {
      if (mounted) {
        showSnackBarMessage(
            context, response.errorMessage ?? 'Unable to Get Status Count');
      }
    }
    _getTaskCountByStatusInProgress =false;
    if(mounted){
      setState(() {});
    }
  }

  void _newTaskScreenButton() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const AddNewTaskScreen(),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
