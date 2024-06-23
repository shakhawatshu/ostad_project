class AppConstants {
  static RegExp emailRegEx = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
 static RegExp mobileregEx = RegExp(r'(^([+]{1}[8]{2}|0088)?(01){1}[3-9]{1}\d{8})$');
}
