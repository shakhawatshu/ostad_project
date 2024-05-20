import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ostad_project/add_Product_Screen.dart';
import 'package:ostad_project/product.dart';
import 'package:ostad_project/update_Product_Screen.dart';
import 'package:http/http.dart';

class productListScreen extends StatefulWidget {
  const productListScreen({super.key});

  static const String routeName = '/';

  @override
  State<productListScreen> createState() => _productListScreenState();
}


class _productListScreenState extends State<productListScreen> {
  bool _productListInProgress = false;

  List<Product> productList = [];

  @override
  void initState() {
    super.initState();
    _getProductList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return AddProductScreen();
          },));
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text('Product List'),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.add))
        ],
      ),
      body: Visibility(
        visible: _productListInProgress == false,
        replacement: Center(child: CircularProgressIndicator()),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: ListView.separated(
            itemCount: productList.length,
            itemBuilder: (context, index) {
              return SingleChildScrollView(
                child: _buildProductList(productList[index]),
              );
            },
            separatorBuilder: (context, index) =>
            const Divider(
              height: 16,
            ),
          ),
        ),
      ),
    );
  }



  Future<void> _getProductList() async {
    _productListInProgress = true;
    setState(() {});
    productList.clear();
    const String productListUrl = 'https://crud.teamrabbil.com/api/v1/ReadProduct';
    Uri uri = Uri.parse(productListUrl);
    Response response = await get(uri);
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      //Step no.1 decode the data
      final decodeData = jsonDecode(response.body);
      //Step no.2 Get the list from response body using list key(we can find it on json body)
      final jsonDecodeData = decodeData['data'];
      //Step no.3 Run loop for grab values from decode data
      for (Map<String, dynamic> p in jsonDecodeData) {
        Product product = Product(
            productId: p['_id'] ?? '',
            productName: p['ProductName'] ?? '',
            productCode: p['ProductCode'] ?? '',
            image: p['Img'] ?? '',
            unitPrice: p['UnitPrice'] ?? '',
            quantity: p['Qty'] ?? '',
            totalPrice: p['TotalPrice'] ?? '',
        );
        productList.add(product);
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Product List Failed, Try Again!')));
    }

    _productListInProgress= false;
    setState(() {

    });
  }

  Widget _buildProductList(Product product) {
    return ListTile(
      /*leading: Image.network(
                  product.image ,
                  height: 80, width: 80, fit: BoxFit.fill,),*/
      title: Text(product.productName),
      subtitle:  Wrap(
        spacing: 16,
        children: [
          Text('Unit Price:\$ ${product.unitPrice}'),
          Text('Quantity: ${product.quantity}'),
          Text('Total Price\$ ${product.totalPrice}'),
        ],
      ),
      trailing: Wrap(
        children: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return UpdateProductScreen(product: product);
                },));
              },
              icon: const Icon(Icons.edit)),
          IconButton(
              onPressed: () {
                _showDeleteAlertDialog();
              },
              icon: const Icon(Icons.delete_forever_outlined)),
        ],
      ),
    );
  }

  void _showDeleteAlertDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Warning!'),
          content: const Text('Are you want to Delete?'),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('No')),
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Delete')),
          ],
        );
      },
    );
  }
}


