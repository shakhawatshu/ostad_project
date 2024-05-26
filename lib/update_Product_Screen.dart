import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:ostad_project/product.dart';

class UpdateProductScreen extends StatefulWidget {
  const UpdateProductScreen({super.key, required this.product,});
  static const String routeName= '/updateproductscreen';
  final Product product;

  @override
  State<UpdateProductScreen> createState() => _UpdateProductScreenState();
}

final TextEditingController _nameTEController = TextEditingController();
final TextEditingController _productCodeTEController = TextEditingController();
final TextEditingController _quantityTEController = TextEditingController();
final TextEditingController _unitPriceTEController = TextEditingController();
final TextEditingController _totalPriceTEController = TextEditingController();
final TextEditingController _photoTEController = TextEditingController();
final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


class _UpdateProductScreenState extends State<UpdateProductScreen> {

  bool _updateProductInProgress= false;

  @override
  void initState() {
    super.initState();
    _nameTEController.text= widget.product.productName;
    _productCodeTEController.text= widget.product.productCode;
    _quantityTEController.text= widget.product.quantity;
    _unitPriceTEController.text= widget.product.unitPrice;
    _totalPriceTEController.text= widget.product.totalPrice;
    _photoTEController.text= widget.product.image;

  }
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
                  visible: _updateProductInProgress==false,
                  replacement: const CircularProgressIndicator(),
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _updateProductList();
                      }
                    },
                    child: const Text(
                      'Update',
                      style: TextStyle(fontSize: 22),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _updateProductList()async{
    _updateProductInProgress=true;
    setState(() {});
    Map<String, String> inputDate={
      "Img":_photoTEController.text,
      "ProductCode":_productCodeTEController.text,
      "ProductName":_nameTEController.text,
      "Qty":_quantityTEController.text,
      "TotalPrice":_totalPriceTEController.text,
      "UnitPrice":_unitPriceTEController.text,
    };
     String updateProductListUrl='https://crud.teamrabbil.com/api/v1/UpdateProduct/${widget.product.productId}';
     Uri uri =Uri.parse(updateProductListUrl);
     Response response= await post(uri, headers: {'content-type':'application/json'},body: jsonEncode(inputDate));
     print(response.statusCode);
     print(response.body);
     if(response.statusCode==200){
       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Product Updated')));
       Navigator.pop(context);
     }

     else{
       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Failed')));
     }

     _updateProductInProgress= false;
     setState(() {

     });

  }
@override
  void dispose() {
    super.dispose();
    _photoTEController.dispose();
    _nameTEController.dispose();
    _productCodeTEController.dispose();
    _quantityTEController.dispose();
    _unitPriceTEController.dispose();
    _totalPriceTEController.dispose();
  }


}

