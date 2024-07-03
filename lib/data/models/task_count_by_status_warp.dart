import 'package:ostad_project/data/models/task_count_by_status_model.dart';

class TaskCountByStatusWarp {
  String? status;
  List<TaskCountByStatusModel>? taskCountByStatusList;

  TaskCountByStatusWarp({this.status, this.taskCountByStatusList});

  TaskCountByStatusWarp.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      taskCountByStatusList = <TaskCountByStatusModel>[];
      json['data'].forEach((v) {
        taskCountByStatusList!.add(TaskCountByStatusModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (taskCountByStatusList != null) {
      data['data'] = taskCountByStatusList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

