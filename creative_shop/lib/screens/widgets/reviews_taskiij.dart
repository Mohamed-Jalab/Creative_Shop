import 'package:flutter/material.dart';

import '../../shared/constant.dart';

class ReviewsTaskiij extends StatelessWidget {
  const ReviewsTaskiij({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 8.0, bottom: 16.0),
          child: Divider(endIndent: 5, indent: 5, thickness: 1),
        ),
        Text(
          'Item reviews and shop ratings',
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w600, letterSpacing: 1.05),
        ),
        SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '4.98',
                        style: TextStyle(fontSize: 32),
                      ),
                      Icon(Icons.star)
                    ],
                  ),
                  Text('2.4K ratings')
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Item quality'),
                      Row(children: [
                        SizedBox(
                            width: 100,
                            child: LinearProgressIndicator(
                              value: 100,
                              color: primaryColor,
                            )),
                        SizedBox(width: 4),
                        Text('5.0'),
                      ]),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Shipping'),
                      Row(children: [
                        SizedBox(
                            width: 100,
                            child: LinearProgressIndicator(
                              value: 100,
                              color: primaryColor,
                            )),
                        SizedBox(width: 4),
                        Text('5.0'),
                      ]),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Customer Service'),
                      Row(children: [
                        SizedBox(
                            width: 100,
                            child: LinearProgressIndicator(
                              value: 100,
                              color: primaryColor,
                            )),
                        SizedBox(width: 4),
                        Text('5.0'),
                      ]),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
        Padding(
          padding: EdgeInsets.only(top: 8.0, bottom: 16.0),
          child: Text(
            'Item reviews',
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.w600, letterSpacing: 1.05),
          ),
        ),
        SizedBox(
          height: 160,
          child: PageView(

            controller: PageController(viewportFraction: .9),
            children: List.generate(3, (index) {
              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [Text('Misha'), Text('Jul 30, 2023')],
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Row(
                        children: List.generate(5, (index) => Icon(Icons.star)),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                          'Absoluyely loved the 3 hand make nesting bowls. Stunning!')
                    ],
                  ),
                ),
                elevation: 2,
              );
            }),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 104.0, left: 104.0),
          child: OutlinedButton(
            style: ButtonStyle(
                side: MaterialStateProperty.all<BorderSide>(
                    BorderSide(color: primaryColor, width: 2)),
                foregroundColor: MaterialStateProperty.all<Color>(primaryColor),
                shape: MaterialStateProperty.all<OutlinedBorder>(
                    const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(1000),
                  ),
                ))),
            onPressed: () {
              print('not working :)');
            },
            child: Text('See all reviews (19)'),
          ),
        )
      ],
    );
  }
}
