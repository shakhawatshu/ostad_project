import 'package:flutter/material.dart';
import 'package:ostad_project/ui/widget/task_item_card.dart';

class CancelledTaskScreen extends StatefulWidget {
  const CancelledTaskScreen({super.key});

  @override
  State<CancelledTaskScreen> createState() => _CancelledTaskScreenState();
}

class _CancelledTaskScreenState extends State<CancelledTaskScreen> {
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
