import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ostad_project/data/models/user_model.dart';
import 'package:ostad_project/data/network_caller/network_caller.dart';
import 'package:ostad_project/data/network_caller/network_response.dart';
import 'package:ostad_project/data/network_path_url/urls.dart';
import 'package:ostad_project/ui/controllers/auth_controllers.dart';
import 'package:ostad_project/ui/widget/background_widget.dart';
import 'package:ostad_project/ui/widget/circle_progress_indicator_widget.dart';
import 'package:ostad_project/ui/widget/profile_app_bar.dart';
import 'package:ostad_project/ui/widget/snackbar.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({super.key});

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

bool _updateProfileInProgress = false;
XFile? _selectedImage;

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _firstNameTEController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();
  final TextEditingController _mobileTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final userData = AuthControllers.userData!;
    _emailTEController.text = userData.email ?? '';
    _firstNameTEController.text = userData.firstName ?? '';
    _lastNameTEController.text = userData.lastName ?? '';
    _mobileTEController.text == userData.mobile;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: profileAppBar(context, true),
      body: BackgroundWidget(
        child: Padding(
          padding: const EdgeInsets.all(35),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 35,
                ),
                Text(
                  'Update Profile',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(
                  height: 18,
                ),
                _buildPhotoPickerWidget(),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  enabled: false,
                  controller: _emailTEController,
                  decoration: const InputDecoration(
                    hintText: 'Email',
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _firstNameTEController,
                  decoration: const InputDecoration(
                    hintText: 'First Name',
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _lastNameTEController,
                  decoration: const InputDecoration(
                    hintText: 'Last Name',
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _mobileTEController,
                  decoration: const InputDecoration(
                    hintText: 'Mobile',
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _passwordTEController,
                  decoration: const InputDecoration(
                    hintText: 'Password',
                  ),
                ),
                const SizedBox(
                  height: 22,
                ),
                Visibility(
                    visible: _updateProfileInProgress == false,
                    replacement: const CircleProgressIndicatorWidget(),
                    child: ElevatedButton(
                        onPressed: _updateProfileApi,
                        child: const Text('Update')))
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPhotoPickerWidget() {
    return GestureDetector(
      onTap: _pickProfileImage,
      child: Container(
        width: double.maxFinite,
        height: 55,
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Container(
              width: 100,
              height: 55,
              decoration: const BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  bottomLeft: Radius.circular(8),
                ),
              ),
              alignment: Alignment.center,
              child: const Text(
                'Photo',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Text(
                _selectedImage?.name ?? 'No Image Selected',maxLines: 1,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  overflow:TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _pickProfileImage() async {
    final imagePicker = ImagePicker();
    final XFile? response =
        await imagePicker.pickImage(source: ImageSource.camera);
    if (response != null) {
      _selectedImage = response;
      if (mounted) {
        setState(() {});
      }
    }
  }

  Future<void> _updateProfileApi() async {
    _updateProfileInProgress = true;
    String encodedProfileImage = AuthControllers.userData!.photo ?? '';
    if (mounted) {
      setState(() {});
    }

    Map<String, dynamic> requestInput = {
      "email": _emailTEController.text.trim(),
      "firstName": _firstNameTEController.text.trim(),
      "lastName": _lastNameTEController.text.trim(),
      "mobile": _mobileTEController.text.trim(),
    };
    
    if(_passwordTEController.text.isNotEmpty){
      requestInput['password'] = _passwordTEController.text;
    }
    
    if(_selectedImage != null){
      final File file = File(_selectedImage!.path);
      encodedProfileImage = base64Encode(file.readAsBytesSync());
      requestInput['image']= encodedProfileImage;
    }
    final NetworkResponse response = await NetworkCaller.postRequest(
        Urls.updateProfileUrl,
        body: requestInput);
    if (response.isSuccess) {
      if (mounted) {
        UserModel userModel = UserModel(
          email: _emailTEController.text,
          firstName: _firstNameTEController.text.trim(),
          lastName: _lastNameTEController.text.trim(),
          mobile: _mobileTEController.text.trim(),
          photo: encodedProfileImage,
        );
        await AuthControllers.saveUserData(userModel);
        if(mounted){
        showSnackBarMessage(context, 'Profile updated successfully');}
      }
    } else {
      if (mounted) {
        showSnackBarMessage(context, 'Update profile Failed');
      }
    }
    _updateProfileInProgress = false;
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    super.dispose();
  }
}
