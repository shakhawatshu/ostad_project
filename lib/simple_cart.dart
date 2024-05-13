import 'package:flutter/material.dart';
import 'package:ostad_project/product_date.dart';
import 'package:ostad_project/button_Style.dart';
import 'package:ostad_project/box_Decoration_Data.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  final List product = [
    ProductTable(
      Name: 'Pullover',
      Photo:
          'https://s3-alpha-sig.figma.com/img/6e2a/6075/d2aebb9b52db31deea621f309362bab4?Expires=1716163200&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=g56LRANcTKnqj2EF8wBDcJWCNQnmv4kXtTH-tjg7diUp7dJTP~rJsLHycZuHJhGkFX7JwZPyA8l8ff8Ql5ankjgGuwiQ1VeZdOt8GDX3c~iLF1P1a6Odvv3ikCbCwLZf9S6D-XK~JSDX844TgxsM0p9W4j~RCE1LyjzruBAiv2mYs7UmPQOlPdZrHA-RfdHgQ3OJPxvicUhM2HXVRSvQ2lRCuJsEeiBPHCgYA9N9YKwSWFCqITWQozlm~VxF2H~yrwr-rZZeK3GLkh4n65WbSXQkJve-mcSnhztkM92kpyC9UOQikzi5evTUwaMPjzEdXz~u-kWawlEo~Bgx2KJ6Og__',
      Price: 51,
    ),
    ProductTable(
      Name: 'T-Shirt',
      Photo:
          'https://s3-alpha-sig.figma.com/img/5e93/8ec8/ffc8353c2e4119cf43ecf6db7e381d9d?Expires=1716768000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=AOW41X2lZLKhWJbYWBA~lsERRXbNpPH~z8OVng-N8F1OK9gyL1PgwEUz5WBua2uuj7rW4Z92kLtSGMxgLWtkky0RpRctYr5mMHZFPTl7Tm4C8xvK51CeRgn5Nzv3kPSp1lnonfMGBFPvjWMkjONpQEo-XkRvnG9CzKA6R9~IEsx4lkPrFRlnMGsKVoWowoE0jX~mVsr~sQcINviFql2PkaWvpFXm1AjCZPRUPK8UzjtILEi7ACkdBCyJrN9cZKAApiqUDWAP~9GVERsYTqSJ6kIrlElJbsx2qtPGekHLFOf4VNyZijDLIP~l2wsjtcD35zTLMOlFpD4xeGL~j8R6IQ__',
      Price: 30,
    ),
    ProductTable(
      Name: 'Sportswear',
      Photo:
          'https://s3-alpha-sig.figma.com/img/1821/5f62/e259b4c9081785e2fb7f4b553d1a8023?Expires=1716768000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=V2cNFYhw-GsKjP2xFh73rGAH7UQqjpryJ3n4C0A~lLqd1g8CBzjsdCHBLaEokxbgN8r5xvY74yBlit8e1oVcynIuI0IDZy0RW8WmMuL4mUqMIOFVs~QcWd9C721fHMHjKasXvTtDfnHNxDzNvF24kQ3LXdgJfa8BLGizFI-dOA1gifHxmeUFpI~iDn7KFc4zmZ2TEFxmYZk1Bq4ZiOb8xGgsOb0tcT2z7SgCrQO683uneLCqzJ3F6eyk7PGP5tux9r4oueAX4954RpYTAs5~8q13e3vDoNR83LbffgHe5gQ9~gvosnUdmmsyMX~AnY-D5ZBlIzjjHhlYUDznJ4pLWw__',
      Price: 43,
    ),
  ];
  int productIdOneCount = 1;
  int productIdTwoCount = 1;
  int productIdThreeCount = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40,
        title: const Text('Cart'),
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.arrow_back_ios_new_outlined)),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
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
                    height: 104,
                    width: 343,
                    decoration: DecorationData.boxDecoration,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            SizedBox(
                              height: 104,
                              width: 104,
                              child: Image.network(
                                product[0].Photo,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ],
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
                                  width: 35,
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
                                      if (productIdOneCount > 1) {
                                        productIdOneCount--;
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
                                  '$productIdOneCount',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                IconButton(
                                  onPressed: () {
                                    if (productIdOneCount >= 4) {
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return Expanded(
                                              child: AlertDialog(
                                            title: const Center(
                                              child: Text(
                                                'Congratulations!',
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            backgroundColor: Colors.white,
                                            content: const SizedBox(
                                                height: 90,
                                                width: double.infinity,
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      'You have added',
                                                      style: TextStyle(
                                                          fontSize: 20),
                                                    ),
                                                    Text(
                                                      '5',
                                                      style: TextStyle(
                                                          fontSize: 20),
                                                    ),
                                                    Text(
                                                      'Pullover on your bag!',
                                                      style: TextStyle(
                                                          fontSize: 20),
                                                    ),
                                                  ],
                                                )),
                                            actions: [
                                              Center(
                                                  child: ElevatedButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                style: ElevatedButton.styleFrom(
                                                  fixedSize:
                                                      const Size(249, 50),
                                                ),
                                                child: const Text('Okay'),
                                              )),
                                            ],
                                          ));
                                        },
                                      );
                                    }
                                    setState(() {
                                      if (productIdOneCount < 5) {
                                        productIdOneCount++;
                                      }
                                    });
                                  },
                                  icon: const Icon(Icons.add),
                                  style: buttonStyle.iconButton,
                                ),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.more_vert)),
                            Text(
                              '${product[0].Price}\$',
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Container(
                    height: 104,
                    width: 343,
                    decoration: DecorationData.boxDecoration,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            SizedBox(
                              height: 104,
                              width: 104,
                              child: Image.network(
                                product[1].Photo,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              product[1].Name,
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            const Row(
                              children: [
                                Text('Color: Black'),
                                SizedBox(
                                  width: 35,
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
                                      if (productIdTwoCount > 1) {
                                        productIdTwoCount--;
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
                                  '$productIdTwoCount',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                IconButton(
                                  onPressed: () {
                                    if (productIdTwoCount >= 4) {
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return Expanded(
                                              child: AlertDialog(
                                            title: const Center(
                                              child: Text(
                                                'Congratulations!',
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            backgroundColor: Colors.white,
                                            content: const SizedBox(
                                                height: 90,
                                                width: double.infinity,
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      'You have added',
                                                      style: TextStyle(
                                                          fontSize: 20),
                                                    ),
                                                    Text(
                                                      '5',
                                                      style: TextStyle(
                                                          fontSize: 20),
                                                    ),
                                                    Text(
                                                      'T-Shirt on your bag!',
                                                      style: TextStyle(
                                                          fontSize: 20),
                                                    ),
                                                  ],
                                                )),
                                            actions: [
                                              Center(
                                                  child: ElevatedButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                style: ElevatedButton.styleFrom(
                                                  fixedSize:
                                                      const Size(249, 50),
                                                ),
                                                child: const Text('Okay'),
                                              )),
                                            ],
                                          ));
                                        },
                                      );
                                    }
                                    setState(() {
                                      if (productIdTwoCount < 5) {
                                        productIdTwoCount++;
                                      }
                                    });
                                  },
                                  icon: const Icon(Icons.add),
                                  style: buttonStyle.iconButton,
                                ),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.more_vert)),
                            Text(
                              '${product[1].Price}\$',
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Container(
                    height: 104,
                    width: 343,
                    decoration: DecorationData.boxDecoration,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            SizedBox(
                              height: 104,
                              width: 104,
                              child: Image.network(
                                product[2].Photo,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              product[2].Name,
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            const Row(
                              children: [
                                Text('Color: Black'),
                                SizedBox(
                                  width: 35,
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
                                      if (productIdThreeCount > 1) {
                                        productIdThreeCount--;
                                      }
                                    });
                                  },
                                  icon: const Icon(Icons.remove),
                                  style: buttonStyle.iconButton,
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  '$productIdThreeCount',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22),
                                ),
                                const SizedBox(width: 8),
                                IconButton(
                                  onPressed: () {
                                    if (productIdThreeCount >= 4) {
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return Expanded(
                                              child: AlertDialog(
                                            title: const Center(
                                              child: Text(
                                                'Congratulations!',
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            backgroundColor: Colors.white,
                                            content: const SizedBox(
                                                height: 90,
                                                width: double.infinity,
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      'You have added',
                                                      style: TextStyle(
                                                          fontSize: 20),
                                                    ),
                                                    Text(
                                                      '5',
                                                      style: TextStyle(
                                                          fontSize: 20),
                                                    ),
                                                    Text(
                                                      'Sprotswear on your bag!',
                                                      style: TextStyle(
                                                          fontSize: 20),
                                                    ),
                                                  ],
                                                )),
                                            actions: [
                                              Center(
                                                  child: ElevatedButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                style: ElevatedButton.styleFrom(
                                                  fixedSize:
                                                      const Size(249, 50),
                                                ),
                                                child: const Text('Okay'),
                                              )),
                                            ],
                                          ));
                                        },
                                      );
                                    }
                                    setState(() {
                                      if (productIdThreeCount < 5) {
                                        productIdThreeCount++;
                                      }
                                    });
                                  },
                                  icon: const Icon(Icons.add),
                                  style: buttonStyle.iconButton,
                                ),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.more_vert)),
                            Text(
                              '${product[2].Price}\$',
                              style: const TextStyle(
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
                  style: TextStyle(fontSize: 18),),
                Text(
                  '${_totalAmountCount().toString()}\$',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Center(
                child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(fixedSize: const Size(350, 55)),
              child: const Text('Check Out'),
            ))
          ],
        ),
      ),
    );
  }
  _totalAmountCount() {
    int ProductOneAmountTotal = product[0].Price * productIdOneCount;
    int ProductTwoAmountTotal = product[1].Price * productIdTwoCount;
    int ProductThreeAmountTotal = product[2].Price * productIdThreeCount;

    int totalAmount =
        ProductOneAmountTotal + ProductTwoAmountTotal + ProductThreeAmountTotal;
    return totalAmount;
  }

  @override
  void dispose() {
    super.dispose();
  }
}
