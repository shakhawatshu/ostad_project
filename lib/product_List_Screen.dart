import 'package:flutter/material.dart';
import 'package:ostad_project/add_Product_Screen.dart';
import 'package:ostad_project/update_Product_Screen.dart';

class productListScreen extends StatefulWidget {
  const productListScreen({super.key});

  @override
  State<productListScreen> createState() => _productListScreenState();
}

class _productListScreenState extends State<productListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AddProductScreen(),
              ));
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text('Product List'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.separated(
          itemCount: 15,
          itemBuilder: (context, index) {
            return SingleChildScrollView(
              child: ListTile(
                leading: Image.network(
                    'https://brand.assets.adidas.com/image/upload/f_auto,q_auto,fl_lossy/if_w_gt_530,w_530/shoes_men_tcc_d_44a809233a.jpg',
                    height: 80,width: 80,fit:BoxFit.fill,),
                title: const Text('Product Name'),
                subtitle: const Wrap(
                  spacing: 16,
                  children: [
                    Text('Unit Price:'),
                    Text('Quantity:'),
                    Text('Total Price'),
                  ],
                ),
                trailing: Wrap(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const UpdateProductScreen(),
                              ));
                        },
                        icon: const Icon(Icons.edit)),
                    IconButton(
                        onPressed: () {
                          _showDeleteAlertDialog();
                        },
                        icon: const Icon(Icons.delete_forever_outlined)),
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (context, index) => const Divider(
            height: 16,
          ),
        ),
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
