import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:ostad_project/add_Product_Screen.dart';
import 'package:ostad_project/update_Product_Screen.dart';
import 'package:http/http.dart';
import 'package:ostad_project/product_model_data.dart';

class productListScreen extends StatefulWidget {
  const productListScreen({super.key});

  static const String routeName = '/';

  @override
  State<productListScreen> createState() => _productListScreenState();
}


class _productListScreenState extends State<productListScreen> {
  bool _productListInProgress = false;

  List<PorudctModel> productList = [];

  @override
  void initState() {
    super.initState();
    _getProductList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async{
          final popResult=await Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const AddProductScreen();
          },));
        if(popResult == true){
          _getProductList();
          _productListInProgress=true;
          setState(() {

          });
        }
          },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text('Product List'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.add))
        ],
      ),
      body: Visibility(
        visible: _productListInProgress == false,
        replacement: const Center(child: CircularProgressIndicator()),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
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
      for (Map<String, dynamic> json in jsonDecodeData) {
        PorudctModel porudctModel= PorudctModel.fromJson(json);
        productList.add(porudctModel);


      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Product List Failed, Try Again!')));
    }

    _productListInProgress= false;
    setState(() {

    });
  }

  Widget _buildProductList(PorudctModel product) {
    return ListTile(
      /*leading: Image.network(
                  product.image ,
                  height: 80, width: 80, fit: BoxFit.fill,),*/
      title: Text(product.productName ?? 'Unknown'),
      subtitle:  Wrap(
        spacing: 16,
        children: [
          Text('Unit Price:\$ ${product.unitPrice}'),
          Text('Quantity: ${product.qty}'),
          Text('Total Price\$ ${product.totalPrice}'),
        ],
      ),
      trailing: Wrap(
        children: [
          IconButton(
              onPressed: () async{
               final popResult= await Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return UpdateProductScreen(product: product);
                },));
              if(popResult==true){
                _getProductList();
              }
               },
              icon: const Icon(Icons.edit)),
          IconButton(
              onPressed: () {
                _showDeleteAlertDialog(product.sId?? '');
              },
              icon: const Icon(Icons.delete_forever_outlined)),
        ],
      ),
    );
  }

  void _showDeleteAlertDialog(String productId) {
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
                  _deleteProduct(productId);
                  Navigator.pop(context);
                },
                child: const Text('Delete')),
          ],
        );
      },
    );
  }

  Future<void> _deleteProduct(String productId) async {
    _productListInProgress=false;
    setState(() {
    });
    String deleteProductUrl = 'https://crud.teamrabbil.com/api/v1/DeleteProduct/$productId';
    Uri uri = Uri.parse(deleteProductUrl);
    Response response = await get(uri);
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      _getProductList();

      _productListInProgress=true;
      setState(() {

      });

    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Delete Product Failed, Try Again!')));
    }

  }
}
