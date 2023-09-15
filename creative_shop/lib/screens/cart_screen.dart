import 'package:flutter/material.dart';

import '../shared/component.dart';
import '../shared/constant.dart';
import 'check_out_screen.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    super.initState();
    for (int i = 0; i < listOfCartItems.length; i++) {
      total += listOfCartItems[i].price;
    }
  }

  int total = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        centerTitle: true,
        title: const Text('Your Cart'),
        actions: [
          listOfCartItems.isEmpty
              ? const SizedBox()
              : IconButton(
                  icon: const Icon(Icons.delete_outline),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        content: SizedBox(
                          height: 230,
                          child: Column(
                            children: [
                              const Text('Warning!',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  )),
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Divider(),
                              ),
                              const Text(
                                  'Are you sure to remove\nAll products?',
                                  textAlign: TextAlign.center),
                              const Spacer(),
                              buildBigButton(
                                context,
                                child: const Text('Yes'),
                                color: secondaryColor,
                                onPressed: () {
                                  if (Navigator.of(context).canPop()) {
                                    Navigator.of(context).pop();
                                  }
                                  setState(() {
                                    listOfCartItems.clear();
                                  });
                                },
                              ),
                              buildBigButton(
                                color: greyColor2,
                                context,
                                child: const Text('Cancel'),
                                onPressed: () {
                                  if (Navigator.of(context).canPop()) {
                                    Navigator.of(context).pop();
                                  }
                                },
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
        ],
      ),
      backgroundColor: greyColor3,
      body: listOfCartItems.isEmpty
          ?  Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('asset/images/cart_screen_empty.png', width: 250, height: 250,),
                  const Text('Your shopping cart is empty',
                      style: TextStyle(fontSize: 20, fontFamily: 'Poppins')),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text('Try shopping',
                      style: TextStyle(fontSize: 20, fontFamily: 'Poppins')),
                ],
              ))
          : SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
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
                              bottomRight: Radius.circular(15),
                              bottomLeft: Radius.circular(15),
                            ),
                          ),
                          child: Column(
                            children: [
                              const SizedBox(height: 20),
                              for (int i = 0; i < listOfCartItems.length; i++)
                                buildlistTile(context,
                                    imageUrl: listOfCartItems[i].imageUrl,
                                    title: listOfCartItems[i].name,
                                    subTitle:
                                        listOfCartItems[i].price.toString(), numOfProduct: listOfCartItems[i].amountOfItem),
                                        
                              const SizedBox(height: 10),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      'Goods:',
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 17,
                                      ),
                                    ),
                                    Text(
                                      '$total SYP',
                                      style: const TextStyle(fontSize: 17),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 10),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Delivery:',
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 17,
                                      ),
                                    ),
                                    Text(
                                      '0.00 SYP',
                                      style: TextStyle(fontSize: 17),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 10),
                              distance(),
                              const SizedBox(height: 10),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      'Total Price:',
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17,
                                      ),
                                    ),
                                    Text(
                                      '$total SYP',
                                      style: const TextStyle(
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
                    bottom: 15,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width - 20,
                      child: buildBigButton(
                        context,
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        color: secondaryColor,
                        child: const Text('Check Out',
                            style: TextStyle(fontSize: 20)),
                        onPressed: () {
                          // setState(() {
                          //   listOfCartItems = [];
                          // });
                          Navigator.of(context)
                              .push(
                                MaterialPageRoute(
                                  builder: (context) => CheckOutScreen(
                                    total: total,
                                  ),
                                ),
                              )
                              .then((value) => setState(() {}));
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