class NetworkResponse {
  final int statusCode;
  final bool isSuccess;
  final dynamic responseData;
  final String? errorMessage;

  NetworkResponse(
      {required this.statusCode,
      this.responseData,
      required this.isSuccess,
      this.errorMessage});
}
