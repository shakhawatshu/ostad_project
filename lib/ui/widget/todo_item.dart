import 'package:flutter/material.dart';
import 'package:ostad_project/entities/todo_data.dart';

class TodoItem extends StatelessWidget {
  const TodoItem({
    super.key,
    required this.todoData,
    required this.onIconButtonPressed,
  });

  final TodoData todoData;
  final VoidCallback onIconButtonPressed;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      margin: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      child: ListTile(
          title: Text(
            todoData.title,
            style: TextStyle(decoration: _getTextDecoration(todoData.isDone)),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(todoData.description),
              Text(todoData.time.toString()),
            ],
          ),
          trailing: _buildRoundedIconButton(todoData.isDone)),
    );
  }

  Widget _buildRoundedIconButton(bool isDone) {
    return GestureDetector(
      onTap: onIconButtonPressed,
      child: CircleAvatar(
        child: Icon(_getIcon(true)),
      ),
    );
  }

  IconData _getIcon(bool isDone) {
    return isDone ? Icons.check : Icons.clear;
  }

  TextDecoration? _getTextDecoration(bool isDone) {
    return isDone ? TextDecoration.lineThrough : null;
  }
}
