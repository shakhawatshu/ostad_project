import 'package:flutter/material.dart';

class TaskSummaryCard extends StatelessWidget {
  const TaskSummaryCard({
    super.key, required this.taskCount, required this.title,
  });

  final String taskCount;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding:  const EdgeInsets.all(18),
        child: Column(
          children: [
            Text(taskCount,style: Theme.of(context).textTheme.titleLarge,),
            Text(title,style: Theme.of(context).textTheme.titleSmall,),
          ],
        ),
      ),
    );
  }
}