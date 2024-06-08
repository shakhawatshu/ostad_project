import 'package:flutter/material.dart';
import 'package:ostad_project/ui/widget/background_widget.dart';
import 'package:ostad_project/utility/app_design_data.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundWidget(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 110,
                ),
                Text(
                  'Get Started With',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(
                  height: 28,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Email',
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Password',
                  ),
                ),
                const SizedBox(
                  height: 26,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Icon(Icons.arrow_circle_right_outlined),
                ),
                const SizedBox(
                  height: 60,
                ),
                Center(
                    child: TextButton(
                  onPressed: () {},
                  child: const Text('Forget Password ?'),
                )),
                Center(
                  child: RichText(
                    text: const TextSpan(
                        style: TextStyle(
                            color: Colors.black,
                            letterSpacing: 1.5,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                        text: "Don't have account?",
                        children: [
                          TextSpan(
                            style: TextStyle(
                                color: AppDesignData.defaultThemeColor,
                                fontWeight: FontWeight.bold),
                            text: 'Sign up',
                          )
                        ]),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
