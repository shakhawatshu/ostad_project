import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:ostad_project/data/network_caller/network_caller.dart';
import 'package:ostad_project/data/network_caller/network_response.dart';
import 'package:ostad_project/data/network_path_url/urls.dart';
import 'package:ostad_project/ui/screens/auth/sign_in_screen.dart';
import 'package:ostad_project/ui/widget/background_widget.dart';
import 'package:ostad_project/ui/widget/circle_progress_indicator_widget.dart';
import 'package:ostad_project/ui/widget/snackbar.dart';
import 'package:ostad_project/utility/app_design_data.dart';

class SetPassWordScreen extends StatefulWidget {
  const SetPassWordScreen(
      {super.key, required this.userEmail, required this.otpCode});

  final String userEmail;
  final String otpCode;

  @override
  State<SetPassWordScreen> createState() => _SetPassWordScreenState();
}

final TextEditingController _passwordTEController = TextEditingController();
final TextEditingController _passwordConfirmTEController =
    TextEditingController();
bool _setPasswordInProgress = false;
bool _showPassword = false;

class _SetPassWordScreenState extends State<SetPassWordScreen> {
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
                    'Set Password',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Minimum length password 8 character with letter and number combination',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    obscureText: _showPassword == false,
                    controller: _passwordTEController,
                    decoration: InputDecoration(
                      suffixIcon: _buildPasswordVisibleButton(),
                      hintText: 'Password',
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    obscureText: _showPassword == false,
                    controller: _passwordConfirmTEController,
                    decoration:  InputDecoration(
                      suffixIcon: _buildPasswordVisibleButton(),
                      hintText: 'Confirm Password',
                    ),
                  ),
                  const SizedBox(
                    height: 26,
                  ),
                  Visibility(
                    visible: _setPasswordInProgress == false,
                    replacement: const CircleProgressIndicatorWidget(),
                    child: ElevatedButton(
                      onPressed: () {
                        if (_passwordTEController.text ==
                            _passwordConfirmTEController.text) {
                          _resetPasswordApi();
                        } else {
                          if (mounted) {
                            showSnackBarMessage(
                                context, 'Password do not match');
                          }
                        }
                      },
                      child: const Icon(Icons.arrow_circle_right_outlined),
                    ),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  Center(
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
                                text: ' Sign ip',
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    _gotoSignInScreen();
                                  })
                          ]),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  IconButton _buildPasswordVisibleButton() {
    return IconButton(
                      onPressed: () {
                        _showPassword = !_showPassword;
                        if (mounted) {
                          setState(() {});
                        }
                      },
                      icon: Icon(_showPassword
                          ? Icons.remove_red_eye
                          : Icons.visibility_off),
                    );
  }

  Future<void> _resetPasswordApi() async {
    _setPasswordInProgress = true;
    if (mounted) {
      setState(() {});
    }

    Map<String, dynamic> requestBody = {
      "email": widget.userEmail,
      "OTP": widget.otpCode,
      "password": _passwordTEController.text,
    };

    final NetworkResponse response = await NetworkCaller.postRequest(
        Urls.resetPasswordUrl,
        body: requestBody);
    if (response.isSuccess && response.responseData['status'] == 'success') {
      if (mounted) {
        showSnackBarMessage(context, 'Reset password successfully');
      }
      _gotoSignInScreen();
    } else {
      if (mounted) {
        showSnackBarMessage(context, 'Reset password Failed!');
      }
    }
    _setPasswordInProgress = false;
    if (mounted) {
      setState(() {});
    }
  }

  void _gotoSignInScreen() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const SignInScreen()),
      (route) => false,
    );
  }

  @override
  void dispose() {
    _passwordTEController.dispose();
    _passwordConfirmTEController.dispose();
    super.dispose();
  }
}
