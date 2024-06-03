import 'package:flutter/material.dart';
import 'package:ostad_project/entities/todo_data.dart';
import 'package:ostad_project/ui/widget/empty_list_widget.dart';
import 'package:ostad_project/ui/widget/todo_item.dart';

class DoneTodoScreenTab extends StatelessWidget {
  const DoneTodoScreenTab(
      {super.key,
      required this.onDelete,
      required this.onStatusChange,
      required this.todoList});

  final Function(int) onDelete;
  final Function(int) onStatusChange;
  final List<Todo> todoList;

  @override
  Widget build(BuildContext context) {
    if(todoList.isEmpty){
      return const EmptyListWidget();
    }
    return ListView.builder(
      itemCount: todoList.length,
      itemBuilder: (context, index) {
        return Dismissible(
          key: UniqueKey(),
          onDismissed: (_) {
            onDelete(index);
          },
          child: TodoListTile(
            todo: todoList[index],
            onIconButtonPressed: () {
              onStatusChange(index);
            },
          ),
        );
      },
    );
  }
}
