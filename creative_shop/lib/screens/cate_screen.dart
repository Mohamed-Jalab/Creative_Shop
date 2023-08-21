// ignore_for_file: prefer_const_constructors

import 'package:creative_shop/screens/product_screen.dart';
import 'package:flutter/material.dart';
import 'package:intrinsic_grid_view/intrinsic_grid_view.dart';

import '../shared/constant.dart';
import 'widgets/item_card.dart';

class CateScreen extends StatelessWidget {
  final String title;
  final List<ItemCard> list;
  const CateScreen({
    super.key,
    this.title = 'Creative Shop',
    required this.list,
  });

  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < list.length; i++) {
      list[i].onTap = () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => ProductScreen(
                imageUrl: list[i].image,
                category: list[i].category,
                title: list[i].title),
          ),
        );
      };
    }
    final itemCards = [
      ItemCard(
          onTap: () {
            // Navigator.of(context)
            //     .push(MaterialPageRoute(builder: (_) => ProductScreen()));
          },
          image: 'asset/images/pants2.jpeg',
          title: 'Lorem ipsum',
          newPrice: '99\$',
          category: 'category',
          saleText: '-87%',
          oldPrice: '60\$',
          isFavorite: true),
      ItemCard(
        onTap: () {},
        image: 'asset/images/pant.jpg',
        title: 'Lorem ipsum',
        newPrice: '99\$',
        category: 'category',
        saleText: '-87%',
      ),
      ItemCard(
          onTap: () {},
          image: 'asset/images/pant.jpg',
          title: 'Lorem ipsum',
          newPrice: '99\$',
          category: 'category',
          isFavorite: true),
    ];
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: IntrinsicGridView.vertical(
                        columnCount: 1,
                        children: [
                          SizedBox(
                            height: 130,
                          ),
                          IntrinsicGridView.vertical(
                            columnCount: 2,
                            horizontalSpace: 4,
                            verticalSpace: 4,
                            padding: EdgeInsets.only(
                                top: 16, bottom: 12, left: 4, right: 4),
                            children: List.generate(list.length, (index) {
                              return ItemCard(
                                image: list[index].image,
                                title: list[index].title,
                                newPrice: list[index].newPrice,
                                category: list[index].category,
                                isFavorite: list[index].isFavorite,
                                saleText: list[index].saleText,
                                oldPrice: list[index].oldPrice,
                                backgroundColor:
                                    list[index].backgroundColor,
                                onTap: list[index].onTap,
                              );
                            }),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 100,
                  width: double.maxFinite,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.zero,
                      ),
                    ),
                    margin: EdgeInsets.zero,
                    color: primaryColor,
                    child: SafeArea(
                      child: Stack(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Icon(
                                    Icons.arrow_back_ios_new_rounded,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Center(
                            child: Text(
                              title,
                              overflow: TextOverflow.fade,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 22),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Column(
                  children: const [
                    SizedBox(
                      height: 70,
                    ),
                    //! here is TextField
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Card(
                              elevation: 8,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(1000),
                                ),
                              ),
                              child: TextField(
                                cursorColor: primaryColor,
                                decoration: InputDecoration(
                                  hintText: 'Search',
                                  prefixIcon: Icon(
                                    Icons.search,
                                    color: Colors.grey,
                                  ),
                                  filled: true,
                                  focusColor: Colors.white,
                                  fillColor: Colors.white,
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: primaryColor, width: 2.5),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(1000),
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: primaryColor,
                                      width: 1.5,
                                    ),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(1000),
                                    ),
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
              ],
            ),
          ),
        ],
      ),
      // bottomNavigationBar: TheAbsoluteBottomBar(
      //   selectedInd: 0,
      // ),
    );
  }
}
