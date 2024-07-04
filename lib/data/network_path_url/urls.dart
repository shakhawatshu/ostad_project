class Urls {
  static const String _baseUrl = 'https://task.teamrabbil.com/api/v1';

  static const String registration = '$_baseUrl/registration';
  static const String login = '$_baseUrl/login';
  static const String addNewTask = '$_baseUrl/createTask';
  static const String newTaskListUrl = '$_baseUrl/listTaskByStatus/new';
  static const String completedTaskListUrl =
      '$_baseUrl/listTaskByStatus/completed';
  static const String inProgressTaskListURL =
      '$_baseUrl/listTaskByStatus/progress';
  static const String cancelledTaskListURL =
      '$_baseUrl/listTaskByStatus/cancelled';
  static const String taskCountByStatusUrl = '$_baseUrl/taskStatusCount';
  static const String updateProfileUrl = '$_baseUrl/profileUpdate';
  static String emailVerificationUrl(String email) => '$_baseUrl/RecoverVerifyEmail/$email';
  static String pinVerificationUrl(String email, String otp) => '$_baseUrl/RecoverVerifyOtp/$email/$otp';
  static const String resetPasswordUrl = '$_baseUrl/RecoverResetPass';

  static String deleteTaskUrl(String id) => '$_baseUrl/deleteTask/$id';

  static String changeTaskStatusUrl(String id, String status) =>
      '$_baseUrl/updateTaskStatus/$id/$status';
}
