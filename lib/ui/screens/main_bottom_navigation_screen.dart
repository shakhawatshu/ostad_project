import 'package:flutter/material.dart';
import 'package:ostad_project/ui/screens/cancelled_task_screen.dart';
import 'package:ostad_project/ui/screens/completed_task_screen.dart';
import 'package:ostad_project/ui/screens/in_progress_task_screen.dart';
import 'package:ostad_project/ui/screens/new_task_screen.dart';
import 'package:ostad_project/ui/widget/profile_app_bar.dart';
import 'package:ostad_project/utility/app_design_data.dart';

class MainBottomNavigationScreen extends StatefulWidget {
  const MainBottomNavigationScreen({super.key});

  @override
  State<MainBottomNavigationScreen> createState() =>
      _MainBottomNavigationScreenState();
}

int _screenIndex = 0;
List<Widget> _screens = [
  const NewTaskScreen(),
  const CompletedTaskScreen(),
  const InProgressTaskScreen(),
  const CancelledTaskScreen()
];

class _MainBottomNavigationScreenState
    extends State<MainBottomNavigationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: profileAppBar(),
      body: _screens[_screenIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _screenIndex,
        selectedItemColor: AppDesignData.defaultThemeColor,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        onTap: (index) {
          _screenIndex = index;
          if (mounted) {
            setState(() {});
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.abc),
            label: 'New Task',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.done),
            label: 'Completed',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.ac_unit),
            label: 'In Progress',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.clear),
            label: 'Cancelled',
          ),
        ],
      ),
    );
  }


}
