import 'package:flutter/material.dart';
import 'package:ostad_project/ui/widget/task_item_card.dart';

class InProgressTaskScreen extends StatefulWidget {
  const InProgressTaskScreen({super.key});

  @override
  State<InProgressTaskScreen> createState() => _InProgressTaskScreenState();
}

class _InProgressTaskScreenState extends State<InProgressTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 5,
          right: 5,
          top: 5,),
        child: Expanded(
          child: ListView.builder(
            itemCount: 4,
            itemBuilder: (context, index) {
              return TaskItemCard();
            },
          ),
        ),
      ),
    );
  }
}
