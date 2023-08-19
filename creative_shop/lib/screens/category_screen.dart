import 'package:flutter/material.dart';

import '../../models/categroy_model.dart';
import '../shared/component.dart';
import 'new/the_absolute_bottom_bar.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: TheAbsoluteBottomBar(
        selectedInd: 0,
      ),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(35, 47, 62, 1),
        title: const Text(
          "Category",
          style: TextStyle(fontSize: 23),
        ),
        centerTitle: true,
        actions: const [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Icon(
              Icons.search,
              size: 27,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisSpacing: 10, mainAxisExtent: 190),
              itemCount: model.length,
              itemBuilder: (BuildContext context, int index) {
                return grid(context, model[index]);
              },
            ),
          ],
        ),
      ),
    );
  }
}
