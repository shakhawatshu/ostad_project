import 'package:flutter/material.dart';
import 'package:ostad_project/ui/screens/add_new_task_screen.dart';
import 'package:ostad_project/ui/widget/task_item_card.dart';
import 'package:ostad_project/ui/widget/task_summary_card.dart';
import 'package:ostad_project/utility/app_design_data.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          left: 5,
          right: 5,
          top: 5,
        ),
        child: Column(
          children: [
            _buildTaskSummarySection(),
            const SizedBox(
              height: 4,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return TaskItemCard();
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _newTaskScreenButton,
        child: Icon(Icons.add),
        backgroundColor: AppDesignData.defaultThemeColor,
        foregroundColor: Colors.white,
      ),
    );
  }

  Widget _buildTaskSummarySection() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          TaskSummaryCard(
            taskCount: '13',
            title: 'New Task',
          ),
          TaskSummaryCard(
            taskCount: '7',
            title: 'Completted',
          ),
          TaskSummaryCard(
            taskCount: '11',
            title: 'In Progress',
          ),
          TaskSummaryCard(
            taskCount: '3',
            title: 'Cancelled',
          ),
        ],
      ),
    );
  }

  void _newTaskScreenButton() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddNewTaskScreen(),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

}
