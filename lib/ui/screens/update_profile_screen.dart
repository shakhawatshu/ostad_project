import 'package:flutter/material.dart';
import 'package:ostad_project/ui/widget/background_widget.dart';
import 'package:ostad_project/ui/widget/profile_app_bar.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({super.key});

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

final TextEditingController _photoTEController = TextEditingController();
final TextEditingController _emailTEController = TextEditingController();
final TextEditingController _firstNameTEController = TextEditingController();
final TextEditingController _lastNameTEController = TextEditingController();
final TextEditingController _mobileTEController = TextEditingController();
final TextEditingController _passwordTEController = TextEditingController();


class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: profileAppBar(),
      body: BackgroundWidget(
        child: Padding(
          padding: const EdgeInsets.all(35),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 35,),
                Text('Update Profile',style: Theme.of(context).textTheme.titleLarge,),
                const SizedBox(height: 18,),
                TextFormField(
                  controller: _photoTEController,
                  decoration: const InputDecoration(
                    hintText: 'Photos',
                  ),
                ),
                const SizedBox(height: 10,),
                TextFormField(
                  controller: _emailTEController,
                  decoration: const InputDecoration(
                    hintText: 'Email',
                  ),
                ),
                const SizedBox(height: 10,),
                TextFormField(
                  controller: _firstNameTEController,
                  decoration: const InputDecoration(
                    hintText: 'First Name',
                  ),
                ),
                const SizedBox(height: 10,),
                TextFormField(
                  controller: _lastNameTEController,
                  decoration: const InputDecoration(
                    hintText: 'Last Name',
                  ),
                ),
                const SizedBox(height: 10,),
                TextFormField(
                  controller: _mobileTEController,
                  decoration: const InputDecoration(
                    hintText: 'Mobile',
                  ),
                ),
                const SizedBox(height: 10,),
                TextFormField(
                  controller: _passwordTEController,
                  decoration: const InputDecoration(
                    hintText: 'Password',
                  ),
                ),
                const SizedBox(height: 22,),
                ElevatedButton(onPressed: (){}, child: const Text('Update'))
              ],
            ),
          ),
        ),
      ),
    );
  }
  @override
  void dispose() {
    super.dispose();
  }
}
