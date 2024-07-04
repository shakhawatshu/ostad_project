import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:ostad_project/data/network_caller/network_caller.dart';
import 'package:ostad_project/data/network_caller/network_response.dart';
import 'package:ostad_project/data/network_path_url/urls.dart';
import 'package:ostad_project/ui/screens/auth/pin_verification_screen.dart';
import 'package:ostad_project/ui/widget/background_widget.dart';
import 'package:ostad_project/ui/widget/circle_progress_indicator_widget.dart';
import 'package:ostad_project/ui/widget/snackbar.dart';
import 'package:ostad_project/utility/app_constants.dart';
import 'package:ostad_project/utility/app_design_data.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

final TextEditingController _emailTEController = TextEditingController();
final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
bool _emailVerificationInProgress = false;

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
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
                    'Your Email Address',
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
                  Form(
                    key: _formKey,
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
                              return 'Enter valid Email';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 26,
                        ),
                        Visibility(
                          visible: _emailVerificationInProgress == false,
                          replacement: const CircleProgressIndicatorWidget(),
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                _emailVerificationApi();
                              }
                            },
                            child:
                                const Icon(Icons.arrow_circle_right_outlined),
                          ),
                        ),
                      ],
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

  Future<void> _emailVerificationApi() async {
    _emailVerificationInProgress = true;
    if (mounted) {
      setState(() {});
    }
    final String requestUrl =
        Urls.emailVerificationUrl + _emailTEController.text.trim();
    final NetworkResponse response = await NetworkCaller.getRequest(requestUrl);
    if (response.isSuccess) {
      _emailVerificationInProgress = false;
      if (mounted) {
        setState(() {
          showSnackBarMessage(context, 'Otp code send to your email');
        });
        _gotoPinVerificationScreen();
      }
    } else {
      if (mounted) {
        showSnackBarMessage(context, 'Email Verification Failed!');
      }
    }
  }

  void _gotoSignInScreen() {
    Navigator.pop(context);
  }

  void _gotoPinVerificationScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PinVerificationScreen(
          userEmail: _emailTEController.text,
        ),
      ),
    );
  }

}
