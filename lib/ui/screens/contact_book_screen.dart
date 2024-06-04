import 'package:flutter/material.dart';
import 'package:ostad_project/entities/contact_list_data.dart';

class ContactBookScreen extends StatefulWidget {
  const ContactBookScreen({super.key});

  @override
  State<ContactBookScreen> createState() => _ContactBookScreenState();
}

final TextEditingController _nameTEController = TextEditingController();
final TextEditingController _numberTEController = TextEditingController();

List<ContactListData> contactlist = [];

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
            Column(
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
                  keyboardType: TextInputType.number,
                  controller: _numberTEController,
                  decoration: const InputDecoration(
                    labelText: 'Number',
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                _addContact();
                _nameTEController.clear();
                _numberTEController.clear();
              },
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
            const Divider(
              color: Colors.grey,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: contactlist.length,
                itemBuilder: (context, index) {
                  return _buildContactBookListTile(index);
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildContactBookListTile(int index) {
    return Card(
      color: Colors.grey.shade200,
      child: GestureDetector(
        onLongPress: () {
          showDialog(
            context: context,
            builder: (context) {
              return _deleteConfirmationAlertDialog(context, index);
            },
          );
        },
        child: ListTile(
          leading: const Icon(Icons.person),
          title: Text(contactlist[index].name),
          subtitle: Text(contactlist[index].number),
          trailing: const Icon(Icons.phone),
        ),
      ),
    );
  }

  AlertDialog _deleteConfirmationAlertDialog(BuildContext context, int index) {
    return AlertDialog(
      title: const Text(
        'Confirmation',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      content: const Text('Are you sure for Delete?'),
      actions: [
        IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.clear)),
        IconButton(
            onPressed: () {
              _deleteContact(index);
              Navigator.pop(context);
            },
            icon: const Icon(Icons.check)),
      ],
    );
  }

  void _addContact() {
    String contactName = _nameTEController.text.trim();
    String contactNumber = _numberTEController.text.trim();
    ContactListData contactListData =
        ContactListData(name: contactName, number: contactNumber);
    contactlist.add(contactListData);
    if (mounted) {
      setState(() {});
    }
  }

  void _deleteContact(int index) {
    contactlist.removeAt(index);
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    _nameTEController.dispose();
    _numberTEController.dispose();
    super.dispose();
  }
}
