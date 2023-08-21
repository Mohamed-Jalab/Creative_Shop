import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

import '../cubits/product_screen/cubit.dart';
import '../shared/component.dart';

int selectedItem = 0;
int selectedItemForSize = 0;

class ProductScreen extends StatelessWidget {
  const ProductScreen({
    super.key,
    required this.imageUrl,
    required this.category,
    required this.title,
  });
  final String imageUrl;
  final String category;
  final String title;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductCubit>(
      create: (context) => ProductCubit(),
      child: BlocConsumer<ProductCubit, ProductState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = ProductCubit.get(context);
          return SafeArea(
            child: Scaffold(
              backgroundColor: Colors.white,
              body: Column(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        SizedBox(
                          height: double.infinity,
                          child: IconButton(
                            icon: const Icon(
                              Icons.arrow_back_ios_new_rounded,
                              color: Colors.grey,
                            ),
                            onPressed: () {},
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: HexColor('232F3E'),
                              ),
                              height: double.infinity,
                              child: Image.asset(
                                'asset/images/1.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: double.infinity,
                          child: IconButton(
                            icon: const Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Colors.grey,
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            offset: const Offset(0, 0.4),
                            spreadRadius: 4,
                            blurRadius: 4,
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Column(
                          children: [
                            const SizedBox(height: 5),
                            Expanded(
                              child: Container(
                                child: productDetile(
                                  removeOnPressed: () {
                                    cubit.removeFromAmountOfItem();
                                  },
                                  addOnPressed: () {
                                    cubit.addToAmountOfItem();
                                  },
                                  amountOfProduct: cubit.amountOfItem,
                                  priseOfProduct: cubit.amountOfItem * 1500.99,
                                  imageOfProduct: 'asset/images/1.jpg',
                                  typeOfProduct: 'KITON',
                                  nameOfProduct: 'Cashmere Jacket',
                                ),
                              ),
                            ),
                            const Divider(
                              endIndent: 5,
                              indent: 5,
                              thickness: 1,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Color',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                SizedBox(
                                  height: 50,
                                  child: ListView.separated(
                                    physics: const BouncingScrollPhysics(),
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) =>
                                        itemOfColorList(
                                      productColor: colorItem[index],
                                      selectedColor: selectedItem == index
                                          ? Colors.orangeAccent
                                          : colorItem[index],
                                      inkwellWork: () {
                                        selectedItem =
                                            cubit.changeSelectedItem(index);
                                      },
                                    ),
                                    separatorBuilder: (context, index) =>
                                        const SizedBox(
                                      width: 10,
                                    ),
                                    itemCount: colorItem.length,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Size',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                SizedBox(
                                  height: 50,
                                  child: ListView.separated(
                                    physics: const BouncingScrollPhysics(),
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) =>
                                        itemOfSizeList(
                                      selectedColor:
                                          selectedItemForSize == index
                                              ? Colors.black
                                              : Colors.white,
                                      inkwellWork: () {
                                        selectedItemForSize =
                                            cubit.cahngeSizeOfProduct(index);
                                      },
                                      sizeOfProduct: sizeItem[index],
                                    ),
                                    separatorBuilder: (context, index) =>
                                        const SizedBox(
                                      width: 10,
                                    ),
                                    itemCount: sizeItem.length,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Expanded(
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.2),
                                      offset: const Offset(0, 0.4),
                                      spreadRadius: 4,
                                      blurRadius: 4,
                                    ),
                                  ],
                                ),
                                child: Row(
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      icon: const Icon(
                                        Icons.arrow_back_ios_new_rounded,
                                        size: 30,
                                      ),
                                    ),
                                    Expanded(
                                      child: InkWell(
                                        onTap: () {
                                          buildMessage(context,
                                              image:
                                                  'asset/images/check-all.png',
                                              subTitle:
                                                  "This product has added to\nYour Cart");
                                        },
                                        child: Container(
                                          height: 50,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: HexColor('F69B32'),
                                          ),
                                          child: const Center(
                                            child: Text(
                                              'Add to Cart',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.favorite,
                                          color: Colors.redAccent),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

List<Color> colorItem = [
  Colors.white38,
  Colors.black,
  Colors.brown,
];

List<String> sizeItem = [
  'S',
  'M',
  'L',
  'XL',
];
