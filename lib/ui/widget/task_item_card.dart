import 'package:flutter/material.dart';
class TaskItemCard extends StatelessWidget {
  const TaskItemCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.white,
      child: ListTile(
        title: Text(
          'Task title',
          style:
          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Task subtitle'),
            Text('Date: 16-06-2024'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Chip(
                  label: Text('New'),
                ),
                ButtonBar(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.delete_forever_outlined)),
                    IconButton(
                        onPressed:(){}, icon: Icon(Icons.edit)),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

}
