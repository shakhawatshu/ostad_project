import 'package:flutter/material.dart';
import 'package:ostad_project/ui/widget/background_widget.dart';
import 'package:ostad_project/ui/widget/profile_app_bar.dart';

class AddNewTaskScreen extends StatefulWidget {
  const AddNewTaskScreen({super.key});

  @override
  State<AddNewTaskScreen> createState() => _AddNewTaskScreenState();
}

final TextEditingController _titleTEController = TextEditingController();
final TextEditingController _descriptionTEController = TextEditingController();

class _AddNewTaskScreenState extends State<AddNewTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: profileAppBar(context),
      body: BackgroundWidget(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 75,),
              Text('Add New Task',style: Theme.of(context).textTheme.titleLarge,),
              const SizedBox(height: 18,),
              TextFormField(
                controller: _titleTEController,
                decoration: const InputDecoration(
                  hintText: 'Title',
                ),
              ),
              const SizedBox(height: 16,),
              TextFormField(
                controller: _descriptionTEController,
                maxLines: 7,
                decoration: const InputDecoration(
                  hintText: 'Description',
                ),
              ),
              const SizedBox(height: 22,),
              ElevatedButton(onPressed: (){}, child: const Text('Add'))
            ],
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
