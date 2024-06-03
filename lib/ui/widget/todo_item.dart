import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ostad_project/entities/todo_data.dart';

class TodoListTile extends StatelessWidget {
  const TodoListTile({
    super.key,
    required this.todo,
    required this.onIconButtonPressed,
  });

  final Todo todo;
  final VoidCallback onIconButtonPressed;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(
        vertical: 5,
        horizontal: 12,
      ),
      color: _getColor(todo.isDone),
      surfaceTintColor: _getSurfaceTintColor(todo.isDone),
      elevation: 12,
      child: ListTile(
          title: Text(
            todo.title,
            style: TextStyle(decoration: _getTextDecoration(todo.isDone)),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(todo.description),
              Text(DateFormat.yMEd().add_jms().format(todo.time))
            ],
          ),
          trailing: _buildRoundedIconButton(todo.isDone)),
    );
  }

  Widget _buildRoundedIconButton(bool isDone) {
    return GestureDetector(
      onTap: onIconButtonPressed,
      child: CircleAvatar(
        child: Icon(
          _getIcon(todo.isDone),
        ),
      ),
    );
  }

  IconData _getIcon(bool isDone) {
    return isDone ? Icons.check : Icons.clear;
  }

  TextDecoration? _getTextDecoration(bool isDone) {
    return isDone ? TextDecoration.lineThrough : null;
  }

  Color? _getColor(bool isDone) {
    return isDone ? Colors.green.shade200 : null;
  }

  Color? _getSurfaceTintColor(bool isDone) {
    return isDone ? Colors.green : null;
  }
}
