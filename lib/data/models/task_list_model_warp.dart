import 'package:ostad_project/data/models/task_list_model.dart';

class TaskListModelWarp {
  String? status;
  List<TaskListModel>? data;

  TaskListModelWarp({this.status, this.data});

  TaskListModelWarp.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <TaskListModel>[];
      json['data'].forEach((v) {
        data!.add(TaskListModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
