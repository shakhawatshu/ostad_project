import 'package:flutter/material.dart';
import 'package:ostad_project/data/network_caller/network_caller.dart';
import 'package:ostad_project/data/network_caller/network_response.dart';
import 'package:ostad_project/data/network_path_url/urls.dart';
import 'package:ostad_project/ui/widget/background_widget.dart';
import 'package:ostad_project/ui/widget/circle_progress_indicator_widget.dart';
import 'package:ostad_project/ui/widget/profile_app_bar.dart';
import 'package:ostad_project/ui/widget/snackbar.dart';

class AddNewTaskScreen extends StatefulWidget {
  const AddNewTaskScreen({super.key});

  @override
  State<AddNewTaskScreen> createState() => _AddNewTaskScreenState();
}

final TextEditingController _titleTEController = TextEditingController();
final TextEditingController _descriptionTEController = TextEditingController();

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
bool _addNewTaskInProgress = false;

class _AddNewTaskScreenState extends State<AddNewTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: profileAppBar(context),
      body: BackgroundWidget(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 75,
                  ),
                  Text(
                    'Add New Task',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  TextFormField(
                    controller: _titleTEController,
                    decoration: const InputDecoration(
                      hintText: 'Title',
                    ),
                    validator: (String? value) {
                      if (value?.trim().isEmpty ?? true) {
                        return 'Enter New Task Title';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    controller: _descriptionTEController,
                    maxLines: 7,
                    decoration: const InputDecoration(
                      hintText: 'Description',
                    ),
                    validator: (String? value) {
                      if (value?.trim().isEmpty ?? true) {
                        return 'Enter Description Here';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  Visibility(
                    visible: _addNewTaskInProgress == false,
                    replacement:const CircleProgressIndicatorWidget(),
                    child: ElevatedButton(
                      onPressed: _addNewTask,
                      child: const Text('Add'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _addNewTask() {
    if (_formKey.currentState!.validate()) {
      _addNewTaskApi();
    }
  }

  Future<void> _addNewTaskApi() async {
    _addNewTaskInProgress = true;
    if (mounted) {
      setState(() {});
    }

    Map<String, dynamic> requestInput = {
      "title": _titleTEController.text,
      "description": _descriptionTEController.text,
      "status": "New"
    };
    NetworkResponse response = await NetworkCaller.postRequest(
      Urls.addNewTask,
      body: requestInput,
    );
    _addNewTaskInProgress = false;
    if (mounted) {
      setState(() {});
    }

    if (response.isSuccess) {
      if (mounted) {
        showSnackBarMessage(context, 'New Task Added');
      }
    } else {
      if (mounted) {
        showSnackBarMessage(
            context, response.errorMessage ?? 'Add New Task Failed, Try Again');
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
  }
}
