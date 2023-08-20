import 'package:creative_shop/screens/category_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../cate_screen.dart';

class CateCard extends StatelessWidget {
  const CateCard({
    super.key,
    this.title = 'Category',
    required this.imageProvider,
    this.onTap,
  });

  final String title;
  final ImageProvider imageProvider;
  final Function? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('Category');
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => CateScreen(title: title)));
      },
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: Column(
          children: [
            SizedBox(
              height: 120,
              width: 1000,
              child: Card(
                clipBehavior: Clip.antiAlias,
                elevation: 8,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(16),
                  ),
                ),
                margin: EdgeInsets.zero,
                color: Colors.red,
                child: Image(
                  fit: BoxFit.cover,
                  image: imageProvider,
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Center(
              child: Text(
                title,
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Colors.black45),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
