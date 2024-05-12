import 'package:flutter/material.dart';
import 'package:ostad_project/product_date.dart';
import 'package:ostad_project/button_Style.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  int Count = 1;
  final List product = [
    ProductTable(
        Name: 'PullOver',
        Photo:
            'https://s3-alpha-sig.figma.com/img/6e2a/6075/d2aebb9b52db31deea621f309362bab4?Expires=1716163200&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=g56LRANcTKnqj2EF8wBDcJWCNQnmv4kXtTH-tjg7diUp7dJTP~rJsLHycZuHJhGkFX7JwZPyA8l8ff8Ql5ankjgGuwiQ1VeZdOt8GDX3c~iLF1P1a6Odvv3ikCbCwLZf9S6D-XK~JSDX844TgxsM0p9W4j~RCE1LyjzruBAiv2mYs7UmPQOlPdZrHA-RfdHgQ3OJPxvicUhM2HXVRSvQ2lRCuJsEeiBPHCgYA9N9YKwSWFCqITWQozlm~VxF2H~yrwr-rZZeK3GLkh4n65WbSXQkJve-mcSnhztkM92kpyC9UOQikzi5evTUwaMPjzEdXz~u-kWawlEo~Bgx2KJ6Og__',
        Price: 51),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.arrow_back_ios_new_outlined)),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'My Bag',
              style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 24,
            ),
            Expanded(
              child: ListView(
                children: [
                  Container(
                    height: 114,
                    width: 360,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.5),
                          spreadRadius: 0,
                          blurRadius: 8,
                          offset: Offset(5, 12),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          height: 114,
                          width: 114,
                          child: Image.network(
                            product[0].Photo,
                            fit: BoxFit.fill,
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              product[0].Name,
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            const Row(
                              children: [
                                Text('Color: Black'),
                                SizedBox(
                                  width: 12,
                                ),
                                Text('Size: L'),
                              ],
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      if (Count > 1) {
                                        Count--;
                                      }
                                    });
                                  },
                                  icon: const Icon(Icons.remove),
                                  style: buttonStyle.iconButton,
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  '$Count',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                IconButton(
                                  onPressed: () {
                                    if (Count >= 4) {
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return Expanded(
                                              child: AlertDialog(
                                            title: Center(
                                              child: Text(
                                                'Congratulations!',
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            backgroundColor: Colors.white,
                                                content: SizedBox(
                                                    height: 90,
                                                    width: double.infinity,
                                                    child: Column(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                      children: [
                                                        Text('You have added',style: TextStyle(fontSize: 20),),
                                                        Text('5',style: TextStyle(fontSize: 20),),
                                                        Text('T-shirt on your bag!',style: TextStyle(fontSize: 20),),

                                                      ],
                                                    )),
                                                actions: [
                                                  Center(child: ElevatedButton(onPressed: (){Navigator.of(context).pop();}, child: Text('Okay'),style: ElevatedButton.styleFrom(
                                                    fixedSize: Size(249, 50),
                                                  ),)),
                                                ],
                                              ));
                                        },
                                      );
                                    }
                                    setState(() {
                                      if (Count < 5) {
                                        Count++;
                                      }
                                    });
                                  },
                                  icon:  Icon(Icons.add),
                                  style: buttonStyle.iconButton,
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 80,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.more_vert)),
                            Text('${product[0].Price.toString()}\$',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Total Amount:',
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  '${_totalAmountCount().toString()}\$',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            Center(
                child: ElevatedButton(
              onPressed: () {},
              child: const Text('Check Out'),
              style: ElevatedButton.styleFrom(
                  fixedSize: const Size(350, 55)),
            ))
          ],
        ),
      ),
    );
  }

  _totalAmountCount() {
    var TotalAmount = product[0].Price * Count;
    return TotalAmount;
  }

  @override
  void dispose() {
    super.dispose();
  }
}
