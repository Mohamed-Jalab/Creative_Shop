import 'package:flutter/material.dart';

import 'nav_bar_icon.dart';

class TheAbsoluteBottomBar extends StatelessWidget {
  TheAbsoluteBottomBar({super.key, required this.selectedInd});

  final int selectedInd;

  final navIcons = [
    const NavBarIcon(
      icon: Icons.home_outlined,
      isSelected: true,
      title: 'Home',
    ),
    const NavBarIcon(
      icon: Icons.favorite_outline_rounded,
      title: 'Favorite',
    ),
    const NavBarIcon(
      icon: Icons.shopping_cart_outlined,
      title: 'My Cart',
    ),
    const NavBarIcon(
      icon: Icons.person_outline_rounded,
      title: 'Profile',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: 8,
      color: Colors.white,
      child: SizedBox(
        height: 72,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(navIcons.length, (index) {
            bool isThisTheTime = (index == selectedInd);
            NavBarIcon returnedOne = NavBarIcon(
              title: navIcons[index].title,
              icon: navIcons[index].icon,
              isSelected: isThisTheTime,
            );
            return returnedOne;
          }),
        ),
      ),
    );
  }
}
