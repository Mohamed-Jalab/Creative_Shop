import 'package:creative_shop/screens/widgets/order_tracking_page.dart';
import 'package:flutter/material.dart';

import '../shared/component.dart';
import '../shared/constant.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Check Out'),
        centerTitle: true,
        backgroundColor: primaryColor,
      ),
      backgroundColor: greyColor3,
      body: SizedBox(
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
                        //       onPressed: () {
                        //         Navigator.of(context).pop();
                        //       },
                        //     ),
                        //     const Center(
                        //       child: Text(
                        //         'Check Out',
                        //         style: TextStyle(
                        //           fontSize: 20,
                        //           fontWeight: FontWeight.bold,
                        //         ),
                        //       ),
                        //     ),
                        //     //? this is a failed solve
                        //     const IconButton(
                        //       icon: Icon(Icons.delete_outlined,
                        //           color: Colors.transparent),
                        //       onPressed: null,
                        //     ),
                        //   ],
                        // ),
                        const SizedBox(height: 20),
                        ListTile(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (_) => const OrderTrackingPage()));
                          },
                          leading: const Icon(Icons.location_on_outlined,
                              color: Colors.black),
                          title: const Text('Set your location'),
                          subtitle: const Text(
                              'to deliver your goods to your location'),
                          trailing: const Icon(Icons.arrow_forward_ios_rounded),
                        ),
                        distance(),
                        RadioListTile(
                            fillColor: MaterialStateProperty.all<Color>(
                                secondaryColor),
                            value: 1,
                            groupValue: 1,
                            onChanged: (value) {},
                            title: const Text('I will pay cash')),
                        distance(),
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
                  child: const Text('Pay', style: TextStyle(fontSize: 20)),
                  onPressed: () {
                    buildMessage(
                      context,
                      image: 'asset/images/check-all.png',
                      subTitle:
                          "Your order has been successfully\npaid. Your product(s) are recived\nafter one hour.",
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
