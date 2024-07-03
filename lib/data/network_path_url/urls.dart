class Urls {
  static const String _baseUrl = 'https://task.teamrabbil.com/api/v1';

  static const String registration = '$_baseUrl/registration';
  static const String login = '$_baseUrl/login';
  static const String addNewTask = '$_baseUrl/createTask';
  static const String newTaskListUrl = '$_baseUrl/listTaskByStatus/New';
  static const String completedTaskListUrl = '$_baseUrl/listTaskByStatus/Completed';
  static const String inProgressTaskListURL = '$_baseUrl/listTaskByStatus/Progress';
  static const String taskCountByStatusUrl = '$_baseUrl/taskStatusCount';
  static const String updateProfileUrl = '$_baseUrl/profileUpdate';

}