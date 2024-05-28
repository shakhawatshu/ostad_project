import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});
  static const String routeName= '/addproductscreen';

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

final TextEditingController _nameTEController = TextEditingController();
final TextEditingController _productCodeTEController = TextEditingController();
final TextEditingController _quantityTEController = TextEditingController();
final TextEditingController _unitPriceTEController = TextEditingController();
final TextEditingController _totalPriceTEController = TextEditingController();
final TextEditingController _photoTEController = TextEditingController();
final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
bool _addNewProductInProgress= false;

class _AddProductScreenState extends State<AddProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Product'),
        backgroundColor: Colors.deepPurpleAccent.shade100,
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
                  controller: _productCodeTEController,
                  decoration: const InputDecoration(
                    label: Text('Product Code'),
                  ),
                  validator: (String? Value) {
                    if (Value == null || Value.trim().isEmpty) {
                      return 'Product Code';
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
                Visibility(
                  visible: _addNewProductInProgress == false,
                  replacement: const CircularProgressIndicator(),
                  child:ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _addNewProduct();
                    }
                  },
                  child: const Text(
                    'Add',
                    style: TextStyle(fontSize: 22),
                  ),
                ), )
              ],
            ),
          ),
        ),
      ),
    );

  }

  Future<void> _addNewProduct()async{
    _addNewProductInProgress =true;
    setState(() {

    });

    Map<String, dynamic> inputData={
      "Img":_photoTEController.text.trim(),
      "ProductCode":_productCodeTEController.text.trim(),
      "ProductName":_nameTEController.text.trim(),
      "Qty":_quantityTEController.text.trim(),
      "TotalPrice":_totalPriceTEController.text.trim(),
      "UnitPrice":_unitPriceTEController.text.trim()
    };
    const String addNewProductUrl='https://crud.teamrabbil.com/api/v1/CreateProduct';
    Uri baseuri= Uri.parse(addNewProductUrl);
    Response response = await post(baseuri, body:jsonEncode(inputData),headers:{
      'content-type':'application/json'
    } );
    print(response.statusCode);
    _addNewProductInProgress=false;
    setState(() {

    });

    if(response.statusCode == 200){
      _nameTEController.clear();
      _productCodeTEController.clear();
      _quantityTEController.clear();
      _unitPriceTEController.clear();
      _totalPriceTEController.clear();
      _photoTEController.clear();
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('New Product Added')));

      Navigator.pop(context, true);
    }

  }
  @override
  void dispose() {
    super.dispose();
  }
}
