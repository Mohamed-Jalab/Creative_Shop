// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:intrinsic_grid_view/intrinsic_grid_view.dart';

import '../models/ItemInfo_model.dart';
import '../shared/component/ItemCard.dart';
import '../shared/component/OfferCard.dart';
import '../shared/component/constant.dart';

class ShopBrowsingPage extends StatelessWidget {
  final controller = PageController(viewportFraction: 0.8, keepPage: true);

    final offerCard = [
      OffersCard(
        color: Colors.deepOrange,
        image: Image(
          image: AssetImage('asset/images/pant.jpg'),
        ),
      ),
      OffersCard(
        color: Colors.orange,
        image: Image(
          image: AssetImage('asset/images/pants2.jpeg'),
        ),
      ),
      OffersCard(
        color: Colors.cyanAccent,
        image: Image(
          image: AssetImage('asset/images/pant.jpg'),
        ),
      ),
    ];

    //todo item list view
    List<ItemInfo> itemCard = [
      ItemInfo(
          image: Image(
            image: AssetImage('asset/images/pants2.jpeg'),
          ),
          title: 'Lorem ipsum',
          newPrice: '99\$',
          category: 'category',
          saleText: '-87%',
          oldPrice: '60\$',
          isFavorite: true),
      ItemInfo(
        image: Image(
          image: AssetImage('asset/images/pant.jpg'),
        ),
        title: 'Lorem ipsum',
        newPrice: '99\$',
        category: 'category',
        saleText: '-87%',
      ),
      ItemInfo(
          image: Image(
            image: AssetImage('asset/images/pant.jpg'),
          ),
          title: 'Lorem ipsum',
          newPrice: '99\$',
          category: 'category',
          isFavorite: true),
    ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Theme(
        data: ThemeData(
          navigationBarTheme: NavigationBarThemeData(
            backgroundColor: Colors.white,
            elevation: 28.0,
            indicatorColor: Colors.transparent,
          ),
        ),
        child: NavigationBar(
          destinations: [
            NavigationDestination(
              icon: Icon(
                Icons.home_outlined,
                color: kColorThemeBrowse,
              ),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(Icons.category_outlined),
              label: 'Categories',
            ),
            NavigationDestination(
              icon: Icon(Icons.shopping_bag_outlined),
              label: 'My Cart',
            ),
            NavigationDestination(
              icon: Icon(Icons.person_outline_outlined),
              label: 'Profile',
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: 
                // Row(
                //   children: [
                    // Expanded(
                    //   child: 
                      TextField(
                        cursorColor: kColorThemeBrowse,
                        decoration: InputDecoration(
                          //labelText: 'Search',
                          hintText: 'Search',
        
                          suffixIcon: Icon(
                            Icons.search,
                            color: Colors.grey,
                          ),
                          focusColor: Colors.black12,
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: kColorThemeBrowse, width: 2.5),
                            borderRadius: BorderRadius.all(
                              Radius.circular(1000),
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: kColorThemeBrowse),
                            borderRadius: BorderRadius.all(
                              Radius.circular(1000),
                            ),
                          ),
                        ),
                      ),
                    // ),
                //   ],
                // ),
              ),
              // Expanded(
                // child:
                 IntrinsicGridView.vertical(
                  columnCount: 1,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 12, right: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Popular Item',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                          TextButton(
                            style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  kColorThemeBrowse),
                            ),
                            onPressed: () {/*todo go to see all page*/},
                            child: Text('See All'),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 4, right: 4),
                      child: SizedBox(
                        height: 180,
                        child: PageView.builder(
                          padEnds: false,
                          controller: controller,
                          // itemCount: pages.length,
                          itemBuilder: (_, index) {
                            return offerCard[index % offerCard.length];
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Center(
                      child: SmoothPageIndicator(
                          effect: ColorTransitionEffect(
                            strokeWidth: 0,
                            dotHeight: 12,
                            dotWidth: 12,
                            dotColor: Colors.black12,
                            activeDotColor: kColorThemeBrowse,
                            //todo make it constant
                          ),
                          controller: controller,
                          count: offerCard.length),
                    ),
                    // Expanded(
                      // child: 
                      IntrinsicGridView.vertical(
                        columnCount: 2,
                        horizontalSpace: 4,
                        verticalSpace: 4,
                        padding: EdgeInsets.only(
                            top: 16, bottom: 12, left: 4, right: 4),
                        children: List.generate(itemCard.length, (index) {
                          return ItemCard(
                            image: itemCard[index].image,
                            title: itemCard[index].title,
                            newPrice: itemCard[index].newPrice,
                            category: itemCard[index].category,
                            isFavorite: itemCard[index].isFavorite,
                            saleText: itemCard[index].saleText,
                            oldPrice: itemCard[index].oldPrice,
                            backgroundColor: itemCard[index].backgroundColor,
                            onTap: itemCard[index].onTap,
                          );
                        }),
                      ),
                    // )
                  ],
                ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
