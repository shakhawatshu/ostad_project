import 'package:flutter/material.dart';

class ContactBookScreen extends StatefulWidget {
  const ContactBookScreen({super.key});

  @override
  State<ContactBookScreen> createState() => _ContactBookScreenState();
}

final TextEditingController _nameTEController =TextEditingController();
final TextEditingController _numberTEController =TextEditingController();

class _ContactBookScreenState extends State<ContactBookScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact List'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: _nameTEController,
              decoration: const InputDecoration(
                labelText: 'Name',
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: _numberTEController,
              decoration: const InputDecoration(
                labelText: 'Number',
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text(
                'Add',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(
              height: 38,
            ),
            Divider(
              color: Colors.grey,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                return _buildContactBookListTile();
              },),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildContactBookListTile() {
    return Card(
      color: Colors.grey.shade200,
      child: ListTile(
                  leading: Icon(Icons.person),
                  title: Text('Name'),
                  subtitle: Text('123456789'),
                  trailing: Icon(Icons.phone),
                ),
    );
  }
}
