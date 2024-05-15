import 'package:flutter/material.dart';

class UpdateProductScreen extends StatefulWidget {
  const UpdateProductScreen({super.key,  required this.humanName});
  static const String routeName= '/updateproductscreen';

  final List<String> humanName;
  @override
  State<UpdateProductScreen> createState() => _UpdateProductScreenState(humanName:humanName);
}

final TextEditingController _nameTEController = TextEditingController();
final TextEditingController _quantityTEController = TextEditingController();
final TextEditingController _unitPriceTEController = TextEditingController();
final TextEditingController _totalPriceTEController = TextEditingController();
final TextEditingController _photoTEController = TextEditingController();
final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

class _UpdateProductScreenState extends State<UpdateProductScreen> {
  final List<String> humanName;
_UpdateProductScreenState({required this.humanName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Product'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _nameTEController,
                  decoration: const InputDecoration(
                    label: Text('Name'),
                  ),
                  validator: (String? Value) {
                    if (Value == null || Value.trim().isEmpty) {
                      return 'Product Name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _quantityTEController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    label: Text('Quantity'),
                  ),
                  validator: (String? Value) {
                    if (Value == null || Value.trim().isEmpty) {
                      return 'Quantity';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _unitPriceTEController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    label: Text('Unit Price'),
                  ),
                  validator: (String? Value) {
                    if (Value == null || Value.trim().isEmpty) {
                      return 'Unit Price';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _totalPriceTEController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    label: Text('Total Price'),
                  ),
                  validator: (String? Value) {
                    if (Value == null || Value.trim().isEmpty) {
                      return 'Total Price';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _photoTEController,
                  decoration: const InputDecoration(
                    label: Text('Photo'),
                  ),
                  validator: (String? Value) {
                    if (Value == null || Value.trim().isEmpty) {
                      return 'Photo';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {}
                  },
                  child: const Text(
                    'Update',
                    style: TextStyle(fontSize: 22),
                  ),
                ),
              Text(humanName.toString()),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameTEController.dispose();
    _quantityTEController.dispose();
    _unitPriceTEController.dispose();
    _totalPriceTEController.dispose();
    _photoTEController.dispose();
    super.dispose();
  }
}
