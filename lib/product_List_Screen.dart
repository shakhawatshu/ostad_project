import 'package:flutter/material.dart';
import 'package:ostad_project/add_Product_Screen.dart';

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
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => const AddProductScreen(),));
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text('Product List'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.separated(
          itemCount: 5,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Image.network(
                  'https://brand.assets.adidas.com/image/upload/f_auto,q_auto,fl_lossy/if_w_gt_530,w_530/shoes_men_tcc_d_44a809233a.jpg',
                  height: 204),
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
                  IconButton(onPressed: () {}, icon: const Icon(Icons.edit)),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.delete_forever_outlined)),
                ],
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
}
