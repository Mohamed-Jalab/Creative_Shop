import 'package:flutter/material.dart';

import '../shared/component.dart';
import '../shared/constant.dart';
import 'check_out_screen.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        centerTitle: true,
        title: const Text('Your Cart'),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_outline),
            onPressed: () {},
          ),
        ],
      ),
      backgroundColor: greyColor3,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFFD8D8D8),
                          offset: Offset(0.0, .4),
                          blurRadius: 10.0,
                          blurStyle: BlurStyle.outer,
                        ),
                      ],
                      color: whiteColor,
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(16),
                        bottomLeft: Radius.circular(16),
                      ),
                    ),
                    child: Column(
                      children: [
                        // const SizedBox(height: 25),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //   children: [
                        //     IconButton(
                        //       icon: const Icon(Icons.arrow_back),
                        //       onPressed: () {},
                        //     ),
                        //     const Text(
                        //       'Your Cart',
                        //       style: TextStyle(
                        //         fontSize: 20,
                        //         fontWeight: FontWeight.bold,
                        //       ),
                        //     ),
                        //     IconButton(
                        //       icon: const Icon(Icons.delete_outlined),
                        //       onPressed: () {},
                        //     ),
                        //   ],
                        // ),
                        const SizedBox(height: 20),
                        buildlistTile(
                          context,
                          imageUrl: 'asset/images/1.jpg',
                          title: 'Product name',
                          subTitle: '69.99',
                        ),
                        buildlistTile(
                          context,
                          imageUrl: 'asset/images/1.jpg',
                          title: 'Product name',
                          subTitle: '69.99',
                        ),
                        buildlistTile(
                          context,
                          imageUrl: 'asset/images/1.jpg',
                          title: 'Product name',
                          subTitle: '69.99',
                        ),
                        const SizedBox(height: 10),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Goods:',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 17,
                                ),
                              ),
                              Text(
                                '\$11,772.7',
                                style: TextStyle(fontSize: 17),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Delivery:',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 17,
                                ),
                              ),
                              Text(
                                '\$0.00',
                                style: TextStyle(fontSize: 17),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        distance(),
                        const SizedBox(height: 10),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Toatal Price:',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                ),
                              ),
                              Text(
                                '\$11,772.7',
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 30),
                      ],
                    ),
                  ),
                  const SizedBox(height: 130),
                ],
              ),
            ),
            Positioned(
              bottom: 10,
              child: SizedBox(
                width: MediaQuery.of(context).size.width - 20,
                child: buildBigButton(
                  context,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  color: secondaryColor,
                  child:
                      const Text('Check Out', style: TextStyle(fontSize: 20)),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const CheckOutScreen(),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

              // ListTile(
              //   leading: Image.asset(
              //     'asset/images/1.jpg',
              //     width: 80,
              //     height: 110,
              //     fit: BoxFit.fill,
              //   ),
              //   title: const Text('Product name'),
              //   subtitle: const Text('\$5.99'),
              //   trailing: Column(
              //     children: [
              //       IconButton(
              //         iconSize: 14,
              //         splashRadius: 18,
              //         icon: const Icon(Icons.add),
              //         onPressed: () {},
              //       ),
              //       const Text('1'),
              //       IconButton(
              //         iconSize: 14,
              //         style: IconButton.styleFrom(),
              //         icon: const Icon(Icons.remove),
              //         onPressed: () {},
              //       ),
              //     ],
              //   ),
              // ),