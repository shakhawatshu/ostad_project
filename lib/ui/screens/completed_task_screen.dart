import 'package:flutter/material.dart';
import 'package:ostad_project/ui/widget/task_item_card.dart';

class CompletedTaskScreen extends StatefulWidget {
  const CompletedTaskScreen({super.key});

  @override
  State<CompletedTaskScreen> createState() => _CompletedTaskScreenState();
}

class _CompletedTaskScreenState extends State<CompletedTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 5,
          right: 5,
          top: 5,),
        child: Expanded(
          child: ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index) {
              return TaskItemCard();
            },
          ),
        ),
      ),
    );
  }
}
