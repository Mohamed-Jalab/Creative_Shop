import 'package:flutter/material.dart';
import 'package:intrinsic_grid_view/intrinsic_grid_view.dart';

import '../shared/constant.dart';
import 'cate_screen.dart';
import 'category_screen.dart';
import 'product_screen.dart';
import 'widgets/cate_card.dart';
import 'widgets/item_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = PageController(viewportFraction: 0.45, keepPage: true);

  dynamic cateCards;
  late List<ItemCard> trendCards;

  @override
  void initState() {
    super.initState();
    trendCards = [
      ItemCard(
        onTap: () {
        },
        image: 'asset/images/accessories/1.jpg',
        title: 'Pearl Bracelet',
        newPrice: '199\$',
        category: 'Accessories',
      ),
      ItemCard(
          onTap: () {},
          image: 'asset/images/collages/1.jpg',
          title: 'Painting',
          newPrice: '69\$',
          category: 'Collages'),
      ItemCard(
          onTap: () {},
          image: 'asset/images/flowers/1.jpg',
          title: 'Fower Bouquet',
          newPrice: '99\$',
          category: 'Flowers')
    ];
  }

  @override
  Widget build(BuildContext context) {
    for (int index = 0; index < trendCards.length; index++) {
      trendCards[index].onTap = () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => ProductScreen(
                imageUrl: trendCards[index].image,
                category: trendCards[index].category,
                title: trendCards[index].title),
          ),
        );
      };
    }

    final itemCards = [
      ItemCard(
        onTap: () {},
        image: 'asset/images/papers/1.jpg',
        title: 'Paper Roses',
        newPrice: '59\$',
        category: 'Papers',
        // saleText: '-40%',
        // oldPrice: '99\$',
        isFavorite: true,
      ),
      ItemCard(
        onTap: () {},
        image: 'asset/images/flowers/2.jpg',
        title: 'Flower with Letter',
        newPrice: '99\$',
        // oldPrice: '74.99\$',
        category: 'Flowers',
        // saleText: '+25%',
      ),
      ItemCard(
        onTap: () {},
        image: 'asset/images/gifts/1.jpg',
        title: 'Party Gifts',
        newPrice: '39\$',
        category: 'Gifts',
        isFavorite: true,
      ),
      ItemCard(
        onTap: () {},
        image: 'asset/images/raizens/1.jpg',
        title: 'Raizen',
        newPrice: '49\$',
        category: 'Gifts',
      ),
      ItemCard(
        onTap: () {},
        image: 'asset/images/embroidery/1.jpg',
        title: 'Embroidery',
        newPrice: '89\$',
        category: 'Embroidery',
      ),
    ];
    cateCards = [
      CateCard(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (_) =>
                  CateScreen(list: accessoriesCards, title: 'Accessories')));
        },
        image: const AssetImage('asset/images/accessories/1.jpg'),
        title: 'Accessories',
      ),
      CateCard(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (_) =>
                  CateScreen(list: candlesCards, title: 'Candles')));
        },
        image: const AssetImage('asset/images/candles/1.jpg'),
        title: 'Candles',
      ),
      CateCard(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (_) =>
                  CateScreen(list: collagesCards, title: 'Collages')));
        },
        image: const AssetImage('asset/images/collages/3.jpg'),
        title: 'Collages',
      ),
      CateCard(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (_) =>
                  CateScreen(list: embroideryCards, title: 'Embroideries')));
        },
        image: const AssetImage('asset/images/embroidery/1.jpg'),
        title: 'Embroideries',
      ),
    ];

    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverFillRemaining(
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: IntrinsicGridView.vertical(
                          columnCount: 1,
                          children: [
                            const SizedBox(height: 140),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 12, right: 12),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Categories',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  TextButton(
                                    
                                    style: 
                                    ButtonStyle(
                                      overlayColor: MaterialStateColor.resolveWith((_) => secondaryColor.withOpacity(.1)),
                                      foregroundColor:
                                          MaterialStateProperty.all<Color>(
                                              secondaryColor),
                                    ),
                                    onPressed: () {
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
                                        builder: (context) =>
                                            const CategoryScreen(),
                                      ));
                                    },
                                    child: const Text('See All'),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8, right: 8),
                              child: SizedBox(
                                height: 165,
                                child: PageView(
                                  physics: const BouncingScrollPhysics(),
                                  padEnds: false,
                                  clipBehavior: Clip.none,
                                  controller: controller,
                                  children: cateCards,
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(
                                left: 12,
                                right: 12,
                                bottom: 12,
                              ),
                              child: Text(
                                'Trends',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600),
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
                                  physics: const BouncingScrollPhysics(),
                                  padEnds: false,
                                  controller: controller,
                                  clipBehavior: Clip.none,
                                  // itemCount: pages.length,
                                  children: trendCards,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            const Padding(
                              padding:
                                  EdgeInsets.only(left: 12, right: 12, top: 8),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                              padding: const EdgeInsets.only(
                                  top: 16, bottom: 12, left: 4, right: 4),
                              children:
                                  List.generate(itemCards.length, (index) {
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
                                  onTap: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                            builder: (_) => ProductScreen(
                                                  imageUrl:
                                                      itemCards[index].image,
                                                  title: itemCards[index].title,
                                                  category:
                                                      itemCards[index].category,
                                                )));
                                  },
                                );
                              }),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                // !here it is AppBar
                const SizedBox(
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
                const Column(
                  children: [
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
