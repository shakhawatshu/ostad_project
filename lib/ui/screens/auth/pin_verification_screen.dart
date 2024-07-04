import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:ostad_project/data/network_caller/network_caller.dart';
import 'package:ostad_project/data/network_caller/network_response.dart';
import 'package:ostad_project/data/network_path_url/urls.dart';
import 'package:ostad_project/ui/screens/auth/set_password_screen.dart';
import 'package:ostad_project/ui/screens/auth/sign_in_screen.dart';
import 'package:ostad_project/ui/widget/background_widget.dart';
import 'package:ostad_project/ui/widget/circle_progress_indicator_widget.dart';
import 'package:ostad_project/ui/widget/snackbar.dart';
import 'package:ostad_project/utility/app_design_data.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PinVerificationScreen extends StatefulWidget {
  const PinVerificationScreen({super.key, required this.userEmail});

  final String userEmail;

  @override
  State<PinVerificationScreen> createState() => _PinVerificationScreenState();
}

final TextEditingController _pinTEController = TextEditingController();
bool _pinVerificationInProgress = false;

class _PinVerificationScreenState extends State<PinVerificationScreen> {
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
                    'Pin Verification',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    'A 6 digit verification pin will sent to your email address',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  _buildPinCodeTextField(),
                  const SizedBox(
                    height: 19,
                  ),
                  Visibility(
                    visible: _pinVerificationInProgress == false,
                    replacement: const CircleProgressIndicatorWidget(),
                    child: ElevatedButton(
                      onPressed: _pinVerificationApi,
                      child: const Text(
                        'Verify',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
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
                              text: ' Sign in',
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  _gotoSignInScreen();
                                },
                            )
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

  Widget _buildPinCodeTextField() {
    return PinCodeTextField(
      length: 6,
      animationType: AnimationType.fade,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(8),
        fieldHeight: 60,
        fieldWidth: 50,
        activeFillColor: Colors.white,
        selectedColor: AppDesignData.defaultThemeColor,
        selectedFillColor: Colors.white,
        inactiveFillColor: Colors.white,
      ),
      animationDuration: const Duration(milliseconds: 300),
      backgroundColor: Colors.transparent,
      enableActiveFill: true,
      controller: _pinTEController,
      keyboardType: TextInputType.number,
      appContext: context,
    );
  }

  Future<void> _pinVerificationApi() async {
    _pinVerificationInProgress = true;
    if (mounted) {
      setState(() {});
    }
    final NetworkResponse response = await NetworkCaller.getRequest(
      Urls.pinVerificationUrl(
        widget.userEmail,
        _pinTEController.text.trim(),
      ),
    );
    if (response.isSuccess && response.responseData['status'] == 'success') {
      if (mounted) {
        showSnackBarMessage(context, 'Pin Matched');
      }
      _gotoResetPasswordScreen();
    } else {
      if (mounted) {
        showSnackBarMessage(context, 'Pin Verification Failed!');
      }
    }
    _pinVerificationInProgress = false;
    if (mounted) {
      setState(() {});
    }
  }

  void _gotoResetPasswordScreen() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => SetPassWordScreen(
          userEmail: widget.userEmail,
          otpCode: _pinTEController.text.trim(),
        ),
      ),
    );
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
    super.dispose();
  }
}
