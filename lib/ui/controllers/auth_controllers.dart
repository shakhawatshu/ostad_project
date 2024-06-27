import 'dart:convert';

import 'package:ostad_project/data/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthControllers{

  static String accessToken ='';
  static const String _accessTokenKey='access-token';
  static const String _userDataKey='user-data';

  static UserModel? userData;

 static Future<void> saveUserAccessToken(String token)async{
   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
   await sharedPreferences.setString(_accessTokenKey, token);
   accessToken = token;
 }

 static Future<String?> getUserToken()async{
   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
   return sharedPreferences.getString(_accessTokenKey);
 }
 
 static Future<void> saveUserData(UserModel user)async{
   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
   await sharedPreferences.setString(_userDataKey, jsonEncode(user.toJson()));
   userData = user;
 }
 
 static Future<UserModel?> getUserData()async{
   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? data = sharedPreferences.getString(_userDataKey);
    if(data == null) return null;
    UserModel userModel = UserModel.fromJson(jsonDecode(data));
    return userModel;
 }

 static Future<void> clearUserData()async{
   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
   await sharedPreferences.clear();
 }

 static Future<bool> checkAuthState()async{
   String? token= await getUserToken();
   if(token == null) return false;

   accessToken = token;
   userData = await getUserData();
   return true;
 }
}