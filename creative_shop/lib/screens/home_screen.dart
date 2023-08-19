// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:creative_shop/screens/category_screen.dart';
import 'package:creative_shop/screens/product_screen.dart';
import 'package:flutter/material.dart';
//import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:intrinsic_grid_view/intrinsic_grid_view.dart';
//import 'package:flutter_svg/flutter_svg.dart';

import '../shared/constant.dart';
import 'cate_screen.dart';
import 'new/the_absolute_bottom_bar.dart';
import 'new/cate_card.dart';
import 'new/item_card.dart';

class HomeScreen extends StatelessWidget {
  final controller = PageController(viewportFraction: 0.45, keepPage: true);

  late final cateCards;

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
  final trendCards = [
    ItemCard(
        onTap: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => ProductScreen())),
      image: Image(image: AssetImage('asset/images/pants2.jpeg')),
      title: 'Lorem ipsum',
      newPrice: '99\$',
      category: 'category',
      isFavorite: true,
    ),
    ItemCard(
      onTap: () => Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => ProductScreen())),
        image: Image(image: AssetImage('asset/images/pants2.jpeg')),
        title: 'Lorem ipsum',
        newPrice: '99\$',
        category: 'category'),
    ItemCard(
          onTap: () => Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => ProductScreen())),
        image: Image(image: AssetImage('asset/images/pants2.jpeg')),
        title: 'Lorem ipsum',
        newPrice: '99\$',
        category: 'category')
  ];
  final itemCards = [
    ItemCard(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => ProductScreen())),
        image: Image(
          image: AssetImage('asset/images/pants2.jpeg'),
        ),
        title: 'Lorem ipsum',
        newPrice: '99\$',
        category: 'category',
        saleText: '-87%',
        oldPrice: '60\$',
        isFavorite: true),
    ItemCard(
      onTap: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => ProductScreen())),
      image: Image(
        image: AssetImage('asset/images/pant.jpg'),
      ),
      title: 'Lorem ipsum',
      newPrice: '99\$',
      category: 'category',
      saleText: '-87%',
    ),
    ItemCard(
          onTap: () => Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => ProductScreen())),
        image: Image(
          image: AssetImage('asset/images/pant.jpg'),
        ),
        title: 'Lorem ipsum',
        newPrice: '99\$',
        category: 'category',
        isFavorite: true),
  ];
    cateCards = [
      CateCard(
        imageProvider: AssetImage('asset/images/pants2.jpeg'),
      ),
      CateCard(
        imageProvider: AssetImage('asset/images/pant.jpg'),
      ),
      CateCard(
        title: 'Weapons',
        imageProvider: AssetImage('asset/images/pants2.jpeg'),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return CateScreen(title: 'Meow');
          }));
        },
      ),
    ];

    return Scaffold(
      bottomNavigationBar: TheAbsoluteBottomBar(
        selectedInd: 0,
      ),
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
                            height: 140,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 12, right: 12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Categories',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                ),
                                TextButton(
                                  style: ButtonStyle(
                                    foregroundColor:
                                        MaterialStateProperty.all<Color>(
                                            secondaryColor),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) => CategoryScreen(),
                                    ));
                                  },
                                  child: Text('See All'),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8, right: 8),
                            child: SizedBox(
                              height: 165,
                              child: PageView(
                                padEnds: false,
                                clipBehavior: Clip.none,
                                controller: controller,
                                children: cateCards,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 12,
                              right: 12,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Trends',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                ),
                                TextButton(
                                  style: ButtonStyle(
                                    foregroundColor:
                                        MaterialStateProperty.all<Color>(
                                            secondaryColor),
                                  ),
                                  onPressed: () {/*todo go to see all page*/},
                                  child: Text('See All'),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 8,
                              right: 8,
                            ),
                            child: SizedBox(
                              height: 300,
                              child: PageView(
                                padEnds: false,
                                controller: controller,
                                clipBehavior: Clip.none,
                                // itemCount: pages.length,
                                children: trendCards,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 12, right: 12, top: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Newest',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                          IntrinsicGridView.vertical(
                            columnCount: 2,
                            horizontalSpace: 4,
                            verticalSpace: 4,
                            padding: EdgeInsets.only(
                                top: 16, bottom: 12, left: 4, right: 4),
                            children: List.generate(itemCards.length, (index) {
                              return ItemCard(
                                image: itemCards[index].image,
                                title: itemCards[index].title,
                                newPrice: itemCards[index].newPrice,
                                category: itemCards[index].category,
                                isFavorite: itemCards[index].isFavorite,
                                saleText: itemCards[index].saleText,
                                oldPrice: itemCards[index].oldPrice,
                                backgroundColor:
                                    itemCards[index].backgroundColor,
                                onTap: itemCards[index].onTap,
                              );
                            }),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                // !here it is AppBar
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
                    child: Center(
                      child: Text(
                        'Creative Shop',
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    ),
                  ),
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 70,
                    ),
                    //! here is TextField
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Card(
                              elevation: 8,
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(1000)),
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
                                      width: 1.2,
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
    );
  }
}
