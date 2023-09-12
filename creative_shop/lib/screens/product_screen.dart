import 'package:creative_shop/models/item_of_cart.dart';
import 'package:creative_shop/screens/check_out_screen.dart';
import 'package:creative_shop/shared/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

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
    this.price = 69.99,
  });
  final String imageUrl;
  final String category;
  final String title;
  final double price;

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
                    child: PageView(
                        controller: cubit.scrollImagesController,
                        onPageChanged: cubit.onImageChanged,
                        physics: const BouncingScrollPhysics(),
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: HexColor('232F3E'),
                              ),
                              height: double.infinity,
                              child: Image.asset(
                                imageUrl,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: HexColor('232F3E'),
                              ),
                              height: double.infinity,
                              child: Image.asset(
                                imageUrl,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ]),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Center(
                    child: SmoothPageIndicator(
                      controller: cubit.scrollImagesController,
                      count: 2,
                      effect: JumpingDotEffect(
                        dotHeight: 16,
                        dotWidth: 16,
                        dotColor: secondaryColor.withOpacity(0.5),
                        activeDotColor: secondaryColor,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
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
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
                                  // !Price of item
                                  priceOfProduct: cubit.amountOfItem * price,
                                  imageOfProduct: imageUrl,
                                  typeOfProduct: category,
                                  nameOfProduct: title,
                                ),
                              ),
                            ),
                            const Divider(
                                endIndent: 5, indent: 5, thickness: 1),
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
                                const SizedBox(height: 5),
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
                                        const SizedBox(width: 10),
                                    itemCount: colorItem.length,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
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
                                const SizedBox(height: 5),
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
                                              : Colors.transparent,
                                      inkwellWork: () {
                                        selectedItemForSize =
                                            cubit.changeSizeOfProduct(index);
                                      },
                                      sizeOfProduct: sizeItem[index],
                                    ),
                                    separatorBuilder: (context, index) =>
                                        const SizedBox(width: 10),
                                    itemCount: sizeItem.length,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Expanded(
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
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
                                          if (cubit.amountOfItem > 0) {
                                            cubit.addItemToCart();
                                            buildMessage(context,
                                                image:
                                                    'asset/images/check-all.png',
                                                subTitle:
                                                    "The product has been successfully added\nto your cart!",
                                                function: () {
                                                  Navigator.of(context).pop();
                                                  Navigator.of(context).pop();
                                                },
                                                secondButtonText: 'Check out',
                                                secondButtonFunction: () {
                                                  Navigator.of(context).pop();
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          CheckOutScreen(
                                                              total:
                                                                  cubit.total),
                                                    ),
                                                  );
                                                });
                                            listOfCartItems.add(
                                              ItemOfCart(
                                                imageUrl: imageUrl,
                                                name: title,
                                                amountOfItem:
                                                    cubit.amountOfItem,
                                                price: cubit.total,
                                              ),
                                            );
                                          }
                                          // added new
                                        },
                                        child: Container(
                                          height: 50,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
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
                                      onPressed: cubit.changeFavorit,
                                      icon: cubit.isFavorite
                                          ? const Icon(Icons.favorite_rounded,
                                              size: 28, color: Colors.redAccent)
                                          : const Icon(
                                              Icons.favorite_border_rounded,
                                              color: Colors.black38,
                                              size: 28,
                                            ),
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
];
