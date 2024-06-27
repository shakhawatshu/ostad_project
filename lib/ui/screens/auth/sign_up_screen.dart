import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:ostad_project/data/network_caller/network_caller.dart';
import 'package:ostad_project/data/network_caller/network_response.dart';
import 'package:ostad_project/data/network_path_url/urls.dart';
import 'package:ostad_project/ui/widget/background_widget.dart';
import 'package:ostad_project/ui/widget/circle_progress_indicator_widget.dart';
import 'package:ostad_project/ui/widget/snackbar.dart';
import 'package:ostad_project/utility/app_constants.dart';
import 'package:ostad_project/utility/app_design_data.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

final TextEditingController _emailTEController = TextEditingController();
final TextEditingController _firstNameTEController = TextEditingController();
final TextEditingController _lastNameTEController = TextEditingController();
final TextEditingController _mobileTEController = TextEditingController();
final TextEditingController _passwordTEController = TextEditingController();

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
bool _showPassword = false;
bool _registrationInProgress = false;

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundWidget(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(42),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 70,
                  ),
                  Text(
                    'Join With Us',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Form(
                    key: _formKey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _emailTEController,
                          decoration: const InputDecoration(
                            hintText: 'Email',
                          ),
                          validator: (String? value) {
                            if (value?.trim().isEmpty ?? true) {
                              return 'Enter Email';
                            }
                            if (AppConstants.emailRegEx.hasMatch(value!) ==
                                false) {
                              return 'Enter Valid Email!';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        TextFormField(
                          controller: _firstNameTEController,
                          decoration: const InputDecoration(
                            hintText: 'First Name',
                          ),
                          validator: (String? value) {
                            if (value?.trim().isEmpty ?? true) {
                              return 'Enter First Name';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        TextFormField(
                          controller: _lastNameTEController,
                          decoration: const InputDecoration(
                            hintText: 'Last Name',
                          ),
                          validator: (String? value) {
                            if (value?.trim().isEmpty ?? true) {
                              return 'Enter Last Name';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        TextFormField(
                          controller: _mobileTEController,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            hintText: 'Mobile',
                          ),
                          validator: (String? value) {
                            if (value?.trim().isEmpty ?? true) {
                              return 'Enter Mobile No';
                            }
                            if (AppConstants.mobileregEx.hasMatch(value!) ==
                                false) {
                              return 'Enter Valid Mobile no.';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        TextFormField(
                          controller: _passwordTEController,
                          obscureText: _showPassword == false,
                          decoration: InputDecoration(
                            hintText: 'Password',
                            suffixIcon: IconButton(
                              onPressed: () {
                                _showPassword = !_showPassword;
                                if (mounted) {
                                  setState(() {});
                                }
                              },
                              icon: Icon(_showPassword
                                  ? Icons.remove_red_eye
                                  : Icons.visibility_off),
                            ),
                          ),
                          validator: (String? value) {
                            if (value?.trim().isEmpty ?? true) {
                              return 'Enter Password';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Visibility(
                          visible: _registrationInProgress == false,
                          replacement: const CircleProgressIndicatorWidget(),
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                _registrationUser();
                              }
                            },
                            child: const Icon(Icons.arrow_circle_right_outlined),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  _buildSignInSection()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSignInSection() {
    return Center(
      child: RichText(
        text: TextSpan(
            style: const TextStyle(
                color: Colors.black,
                letterSpacing: 1.5,
                fontSize: 15,
                fontWeight: FontWeight.w500),
            text: "Have account?",
            children: [
              TextSpan(
                style: const TextStyle(
                    color: AppDesignData.defaultThemeColor,
                    fontWeight: FontWeight.bold),
                text: ' Sign in',
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    _gotoSignInScreen();
                  },
              )
            ]),
      ),
    );
  }

  Future<void> _registrationUser() async {
    _registrationInProgress = true;
    if (mounted) {
      setState(() {});
    }

    Map<String, dynamic> requestInput = {
      "email": _emailTEController.text.trim(),
      "firstName": _firstNameTEController.text.trim(),
      "lastName": _lastNameTEController.text.trim(),
      "mobile": _mobileTEController.text.trim(),
      "password": _passwordTEController.text,
      "photo": ""
    };

    NetworkResponse response =
        await NetworkCaller.postRequest(Urls.registration, body: requestInput);

    _registrationInProgress = false;
    if(mounted){
      setState(() {});
    }

    if (response.isSuccess) {
      _textFieldClear();
      if (mounted) {
        showSnackBarMessage(context, 'Registration Successfully');
        _gotoSignInScreen();
      }
    } else {
      if (mounted) {
        showSnackBarMessage(context,
            response.errorMessage ?? 'Registration Failed. Try again!');
      }
    }
  }

  void _textFieldClear() {
    _emailTEController.clear();
    _firstNameTEController.clear();
    _lastNameTEController.clear();
    _mobileTEController.clear();
    _passwordTEController.clear();
  }

  void _gotoSignInScreen() {
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _emailTEController.dispose();
    super.dispose();
  }
}
