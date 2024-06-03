import 'package:flutter/material.dart';
import 'package:ostad_project/entities/todo_data.dart';

class AddNewTodoScreen extends StatefulWidget {
  const AddNewTodoScreen({super.key, required this.onAddTodo});

  final Function(Todo) onAddTodo;

  @override
  State<AddNewTodoScreen> createState() => _AddNewTodoScreenState();
}

final TextEditingController _titleTEController= TextEditingController();
final TextEditingController _descriptionTEController= TextEditingController();

final GlobalKey<FormState> _formKey= GlobalKey<FormState>();

class _AddNewTodoScreenState extends State<AddNewTodoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Todo'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(

                validator: (String? value){
                  if(value?.trim().isEmpty ?? true){
                    return'Enter Title';
                  }
                  return null;
                },
                controller: _titleTEController,
                decoration: InputDecoration(
                  label: Text('Title'),
                  border: OutlineInputBorder(
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red)
                  )
                ),
              ),
            ),
            SizedBox(
              height: 6,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                validator: (String? value){
                  if(value?.trim().isEmpty ?? true){
                    return'Enter Title';
                  }
                  return null;
                },
                controller: _descriptionTEController,
                maxLength: 200,
                decoration: InputDecoration(
                    label: Text('Description'),
                    border: OutlineInputBorder(
                    ),
                    errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red)
                    )
                ),
              ),
            ),

            SizedBox(
              height: 6,
            ),
            ElevatedButton(onPressed: (){
              if(_formKey.currentState!.validate()){
                Todo todo= Todo(_titleTEController.text.trim(), _descriptionTEController.text.trim(), DateTime.now());
                widget.onAddTodo(todo);
                Navigator.pop(context);

              }
            }, child: Text('ADD'))

          ],
        ),
      ),
    );
  }
@override
  void dispose() {
    _titleTEController.clear();
    _descriptionTEController.clear();
    super.dispose();
  }
}

