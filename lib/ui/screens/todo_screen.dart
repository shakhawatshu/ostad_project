import 'package:flutter/material.dart';
import 'package:ostad_project/entities/todo_data.dart';
import 'package:ostad_project/ui/screens/add_new_todo_screen.dart';
import 'package:ostad_project/ui/screens/all_todo_screen_tab.dart';
import 'package:ostad_project/ui/screens/done_todo_screen_tab.dart';
import 'package:ostad_project/ui/screens/undone_todo_screen_tab.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

List<Todo> _todoList = [];

class _TodoScreenState extends State<TodoScreen>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Todo List'),
          centerTitle: true,
          bottom: _buildTodoTabBar(),
        ),
        floatingActionButton: _buildAddNewTodoFAB(context),
        body: TabBarView(
          children: [
            AllTodoScreenTab(
              onDelete: (int index) {
                _deleteTodo(index);
              },
              onStatusChange: (int index) {
                _toggleStatusChange(index);
              },
              todoList: _todoList,
            ),
            UndoneTodoScreenTab(
              onDelete: (int index) {
                _deleteTodo(index);
              },
              onStatusChange: (int index) {
                _toggleStatusChange(index);
              },
              todoList: _todoList
                  .where(
                    (item) => item.isDone == false,
                  )
                  .toList(),
            ),
            DoneTodoScreenTab(
              onDelete: (int index) {
                _deleteTodo(index);
              },
              onStatusChange: (int index) {
                _toggleStatusChange(index);
              }, todoList: _todoList.where((item) => item.isDone == true,).toList(),
            ),
          ],
        ),
      ),
    );
  }

  FloatingActionButton _buildAddNewTodoFAB(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AddNewTodoScreen(
              onAddTodo: _addNewTodo,
            ),
          ),
        );
      },
      icon: const Icon(Icons.add),
      label: const Text('Add'),
    );
  }

  TabBar _buildTodoTabBar() {
    return const TabBar(
      tabs: [
        Tab(
          text: 'All',
        ),
        Tab(
          text: 'Undone',
        ),
        Tab(
          text: 'Done',
        ),
      ],
    );
  }

  void _addNewTodo(Todo todo) {
    _todoList.add(todo);
    if (mounted) {
      setState(() {});
    }
  }

  void _deleteTodo(int index) {
    _todoList.removeAt(index);
    if (mounted) {
      setState(() {});
    }
  }

  void _toggleStatusChange(int index) {
    _todoList[index].isDone = !_todoList[index].isDone;
    if (mounted) {
      setState(() {});
    }
  }
}
