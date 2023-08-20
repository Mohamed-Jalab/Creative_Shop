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
    HomeScreen(),
    const FavoritScreen(),
    const CartScreen(),
    const ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    final navIcons = [
      NavBarIcon(
        onTap: () {
          if (selectedInd != 1) {
            // Navigator.of(context).pushReplacement(
            //     MaterialPageRoute(builder: (_) => HomeScreen()));
            setState(() {
              selectedInd = 1;
            });
            print('if Home');
          }
          print('Home');
        },
        icon: Icons.home_outlined,
        isSelected: selectedInd == 1,
        title: 'Home',
      ),
      NavBarIcon(
        onTap: () {
          if (selectedInd != 2) {
            // Navigator.of(context).pushReplacement(
            //     MaterialPageRoute(builder: (_) => const FavoritScreen()));
            setState(() {
              selectedInd = 2;
            });
            print('if Favorit');
          }
          print('Favorit');
        },
        isSelected:selectedInd == 2,
        icon: Icons.favorite_outline_rounded,
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
            print('if My Cart');
          }
          print('My Cart');
        },
        isSelected: selectedInd == 3,
        icon: Icons.shopping_cart_outlined,
        title: 'My Cart',
      ),
      NavBarIcon(
        onTap: () {
          if (selectedInd != 4) {
            // Navigator.of(context).pushReplacement(
            //     MaterialPageRoute(builder: (_) => const ProfileScreen()));
            setState(() {
              selectedInd = 4;
            });
            print('if Profile');
          }
          print('Profile');
        },
        isSelected: selectedInd == 4,
        icon: Icons.person_outline_rounded,
        title: 'Profile',
      ),
    ];
    return Scaffold(
      body: screens[selectedInd-1],
      bottomNavigationBar: BottomAppBar(
      elevation: 8,
      color: Colors.white,
      child: SizedBox(
        height: 72,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(navIcons.length, (index) {
            bool isThisTheTime = (index + 1 == selectedInd);
            NavBarIcon returnedOne = NavBarIcon(
              onTap: navIcons[index].onTap,
              title: navIcons[index].title,
              icon: navIcons[index].icon,
              isSelected: isThisTheTime,
            );
            return returnedOne;
          }),
        ),
      ),
    ),
    );
  }
}
