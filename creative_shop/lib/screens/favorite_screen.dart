import 'package:flutter/material.dart';
import 'package:intrinsic_grid_view/intrinsic_grid_view.dart';

import '../shared/constant.dart';

class FavoriteScreen extends StatelessWidget {
  FavoriteScreen({super.key});
  //! you have to put onTap
  List favoriteList = [];
  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < allProduct.length; i++) {
      for (int j = 0; j < allProduct[i].length; j++) {
        if (allProduct[i][j].isFavorite) {
          favoriteList.add(allProduct[i][j]);
        }
      }
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Favorite'),
        backgroundColor: primaryColor,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: IntrinsicGridView.vertical(
          columnCount: 2,
          horizontalSpace: 4,
          verticalSpace: 4,
          padding:
              const EdgeInsets.only(top: 16, bottom: 12, left: 4, right: 4),
          children: List.generate(favoriteList.length, (index) {
            return favoriteList[index];
          }),
        ),
      ),
    );
  }
}
