import 'package:flutter/material.dart';
import 'package:ostad_project/entities/todo_data.dart';
import 'package:ostad_project/ui/widget/todo_item.dart';

class UndoneTodoScreenTab extends StatelessWidget {
  const UndoneTodoScreenTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return Dismissible(
          key: UniqueKey(),
          onDismissed: (_){

          },
          child: TodoListTile(
            todo: Todo(
              'Title here',
              'Description here',
              DateTime.now(),
            ),
            onIconButtonPressed: () {},
          ),
        );
      },
    );
  }
}
