import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/cart_screen/cubit.dart';
import '../cubits/cart_screen/states.dart';
import '../shared/component/constant.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          AppCubit cubit = AppCubit.get(context);
          return Scaffold(
            backgroundColor: backgroundColor,
            appBar: AppBar(
              backgroundColor: backgroundColor,
              elevation: 0,
              centerTitle: true,
              title: const Text(
                'My Cart',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: fontColor,
                    fontSize: 24),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Column(
                children: [
                  Expanded(
                      child: ListView.separated(
                          itemBuilder: (context, index) =>
                              cartItemBuilder(cubit: cubit),
                          separatorBuilder: (context, index) => const SizedBox(
                                height: 15,
                              ),
                          itemCount: 11)),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (BuildContext context) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20.0),
                                  child: Column(
                                    children: [
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        height: 5,
                                        width: 80,
                                        color: subfontColor,
                                      ),
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      TextFormField(
                                        keyboardType: TextInputType.text,
                                        cursorColor: activeColor,
                                        decoration: InputDecoration(
                                          hintText: 'Promo Code',
                                          fillColor: subfontColor,
                                          filled: true,
                                          focusedBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  color: activeColor),
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                          border: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  color: Colors.black),
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            'Subtotal',
                                            style: TextStyle(
                                                color: Colors.grey[400],
                                                fontSize: 20),
                                          ),
                                          const SizedBox(
                                            width: 150,
                                          ),
                                          Text(
                                            '456',
                                            style: TextStyle(
                                                color: Colors.grey[400],
                                                fontSize: 20),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            'Delivery Fee',
                                            style: TextStyle(
                                                color: Colors.grey[400],
                                                fontSize: 20),
                                          ),
                                          const SizedBox(
                                            width: 118,
                                          ),
                                          Text(
                                            '456',
                                            style: TextStyle(
                                                color: Colors.grey[400],
                                                fontSize: 20),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 40,
                                      ),
                                      const Row(
                                        children: [
                                          Text(
                                            'Total Cost',
                                            style: TextStyle(
                                                color: fontColor,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20),
                                          ),
                                          SizedBox(
                                            width: 135,
                                          ),
                                          Text(
                                            '456',
                                            style: TextStyle(
                                                color: fontColor,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20),
                                          ),
                                        ],
                                      ),
                                      Expanded(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 20.0),
                                              child: SizedBox(
                                                height: 50,
                                                width: double.infinity,
                                                child: ElevatedButton(
                                                  onPressed: () {},
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    padding:
                                                        const EdgeInsets.all(0),
                                                    backgroundColor:
                                                        activeColor,
                                                    elevation: 0,
                                                    shape:
                                                        const RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                        Radius.circular(15),
                                                      ),
                                                    ),
                                                  ),
                                                  child: const Text(
                                                    'Checkout',
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: containerColor,
                                                      fontSize: 30,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                              shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                topRight: Radius.circular(15),
                                topLeft: Radius.circular(15),
                              )));
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(0),
                          backgroundColor: activeColor,
                          elevation: 0,
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                        ),
                        child: const Text(
                          'Total',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: containerColor,
                            fontSize: 30,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

Widget cartItemBuilder({AppCubit? cubit}) => Container(
      width: double.infinity,
      height: 151,
      decoration: BoxDecoration(
        color: containerColor,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        children: [
          Column(
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    width: 100,
                    height: 135,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Image.asset(
                      'asset/images/test.jpg',
                      fit: BoxFit.cover,
                    )),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
            child: SizedBox(
              width: 150,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Object Name',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: fontColor,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Row(
                    children: [
                      Text(
                        'Size : ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: subfontColor,
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        'M',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: fontColor,
                          fontSize: 15,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Row(
                    children: [
                      Text(
                        'Color : ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: subfontColor,
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        'Black',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: fontColor,
                          fontSize: 15,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Container(
                        height: 22,
                        width: 22,
                        decoration: BoxDecoration(
                            // shape: BoxShape.circle,
                            borderRadius: BorderRadius.circular(90),
                            color: backgroundColor),
                        child: ElevatedButton(
                          onPressed: () {
                            cubit?.removeNumberOfItemsInCart();
                          },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(0),
                            backgroundColor: backgroundColor,
                            elevation: 4,
                            shape: const CircleBorder(),
                          ),
                          child: const Icon(
                            Icons.remove,
                            size: 15,
                            color: fontColor,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        '${cubit?.n}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: fontColor,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: 22,
                        width: 22,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(90),
                          color: backgroundColor,
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            cubit?.addNumberOfItemsInCart();
                          },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(0),
                            backgroundColor: backgroundColor,
                            elevation: 4,
                            shape: const CircleBorder(),
                          ),
                          child: const Icon(
                            Icons.add,
                            size: 15,
                            color: fontColor,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
