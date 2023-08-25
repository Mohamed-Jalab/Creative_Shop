import 'package:creative_shop/screens/cart_screen.dart';
import 'package:creative_shop/screens/favorite_screen.dart';
import 'package:creative_shop/screens/home_screen.dart';
import 'package:creative_shop/screens/profile_screen.dart';
// import 'package:creative_shop/screens/widgets/the_absolute_bottom_bar.dart';
import 'package:flutter/material.dart';

import '../shared/constant.dart';
import 'widgets/nav_bar_icon.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Widget> screens = [
    const HomeScreen(),
    const FavoriteScreen(),
    const CartScreen(),
    const ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    final navIcons = [
      NavBarIcon(
        onTap: () {
          if (selectedInd != 1) {
            setState(() {
              selectedInd = 1;
            });
          }
        },
        isSelected: selectedInd == 1,
        icon: selectedInd == 1 ? Icons.home : Icons.home_outlined,
        title: 'Home',
      ),
      NavBarIcon(
        onTap: () {
          if (selectedInd != 2) {
            setState(() {
              selectedInd = 2;
            });
          }
        },
        isSelected: selectedInd == 2,
        icon: selectedInd == 2
            ? Icons.favorite_rounded
            : Icons.favorite_outline_rounded,
        title: 'Favorite',
      ),
      NavBarIcon(
        onTap: () {
          if (selectedInd != 3) {
            // Navigator.of(context).pushReplacement(
            //     MaterialPageRoute(builder: (_) => const CartScreen()));
            setState(() {
              selectedInd = 3;
            });
          }
        },
        isSelected: selectedInd == 3,
        icon: selectedInd == 3
            ? Icons.shopping_cart
            : Icons.shopping_cart_outlined,
        title: 'My Cart',
      ),
      NavBarIcon(
        onTap: () {
          if (selectedInd != 4) {
            setState(() {
              selectedInd = 4;
            });
          }
        },
        isSelected: selectedInd == 4,
        icon: selectedInd == 4
            ? Icons.person_rounded
            : Icons.person_outline_rounded,
        title: 'Profile',
      ),
    ];
    return Scaffold(
        body: screens[selectedInd - 1],
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(.1),
                  offset: const Offset(0, -.2),
                  blurRadius: 15),
            ],
          ),
          height: 60,
          child: BottomNavigationBarTheme(
            data: const BottomNavigationBarThemeData(
                unselectedItemColor: Colors.black38,
                selectedItemColor: secondaryColor,
                showUnselectedLabels: false,
                // showSelectedLabels: false,

                type: BottomNavigationBarType.fixed),
            child: BottomNavigationBar(
              currentIndex: selectedInd - 1,
              onTap: (value) {
                setState(() {
                  selectedInd = value + 1;
                });
              },
              // elevation: 15,
              items: [
                BottomNavigationBarItem(
                    icon: Icon((selectedInd - 1) == 0
                        ? Icons.home
                        : Icons.home_outlined),
                    label: 'Home'),
                BottomNavigationBarItem(
                    icon: Icon((selectedInd - 1) == 1
                        ? Icons.favorite
                        : Icons.favorite_outline),
                    label: 'Favorite'),
                BottomNavigationBarItem(
                    icon: Icon((selectedInd - 1) == 2
                        ? Icons.shopping_cart
                        : Icons.shopping_cart_outlined),
                    label: 'My Cart'),
                BottomNavigationBarItem(
                    icon: Icon((selectedInd - 1) == 3
                        ? Icons.person_rounded
                        : Icons.person_outline_rounded),
                    label: 'Profile'),
              ],
            ),
          ),
        )
        // BottomAppBar(
        //   elevation: 8,
        //   color: Colors.white,
        //   child: SizedBox(
        //     height: 55,
        //     child: Row(
        //       crossAxisAlignment: CrossAxisAlignment.center,
        //       mainAxisAlignment: MainAxisAlignment.spaceAround,
        //       children: List.generate(navIcons.length, (index) {
        //         bool isThisTheTime = (index + 1 == selectedInd);
        // NavBarIcon returnedOne = NavBarIcon(
        //           onTap: navIcons[index].onTap,
        //           title: navIcons[index].title,
        //           icon: navIcons[index].icon,
        //           isSelected: isThisTheTime,
        //         );
        //         return returnedOne;
        //       }),
        //     ),
        //   ),
        // ),
        );
  }
}
