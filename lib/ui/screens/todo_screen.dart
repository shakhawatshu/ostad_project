import 'package:flutter/material.dart';
import 'package:ostad_project/entities/todo_data.dart';
import 'package:ostad_project/ui/screens/add_new_todo_screen.dart';
import 'package:ostad_project/ui/widget/todo_item.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

List<TodoData> todoList = [];

class _TodoScreenState extends State<TodoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return TodoItem(
            todoData:
                TodoData('Title here', 'Description here', DateTime.now()),
            onIconButtonPressed: () {},
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddNewTodoScreen(),
              ));
        },
        label: Text('Add'),
        icon: Icon(Icons.add),
      ),
    );
  }
}
