import 'package:flutter/material.dart';

class AddNewTodoScreen extends StatefulWidget {
  const AddNewTodoScreen({super.key});

  @override
  State<AddNewTodoScreen> createState() => _AddNewTodoScreenState();
}

final TextEditingController _titleTEController= TextEditingController();
final TextEditingController _descriptionTEController= TextEditingController();

final GlobalKey<FormState> _formKey =GlobalKey<FormState>();

class _AddNewTodoScreenState extends State<AddNewTodoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add new Todo'),
        centerTitle: true,
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
                    return 'Enter Title';
                  }
                  return null;
                },
                controller: _titleTEController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(


                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red)
                  ),
                  labelText: 'Title',
                ),
              ),
            ),
            SizedBox(height: 12,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                validator: (String? value){
                  if(value?.trim().isEmpty ?? true){
                    return 'Enter Description';
                  }
                  return null;
                },
                controller: _descriptionTEController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(

                  ),
                  errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red)
                  ),

                  labelText: 'Description',
                ),
              ),
            ),
            SizedBox(height: 12,),
            ElevatedButton(onPressed: (){
              if(_formKey.currentState!.validate()){

              }

            }, child:Text('Add New'))
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _titleTEController.dispose();
    _descriptionTEController.dispose();
    super.dispose();
  }
}
