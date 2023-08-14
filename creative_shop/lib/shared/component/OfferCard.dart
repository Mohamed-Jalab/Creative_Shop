import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class OffersCard extends StatelessWidget {
  const OffersCard(
      {this.color = Colors.green,
      required this.image,
      this.title = 'Get your special offers',
      this.onTap});

  final Color color;
  final Image image;
  final String title;
  final Function? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap!();
      },
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16))),
        clipBehavior: Clip.antiAlias,
        color: color,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.all(24),
              child: SizedBox(
                width: 124,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                      softWrap: true,
                    ),
                    TextButton(
                      onPressed: () {
                        onTap!();
                      },
                      style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(color),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        )),
                        backgroundColor: MaterialStateColor.resolveWith(
                            (states) => Colors.white),
                        textStyle: MaterialStateTextStyle.resolveWith(
                          (states) => TextStyle(
                            color: color,
                          ),
                        ),
                      ),
                      child: Text('Shop now!'),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 8,
            ),
            SizedOverflowBox(
              alignment: Alignment.topRight,
              size: Size(1, 180),
              child: FittedBox(
                //  SizedBox(
                // width: 100,
                // height: 100,
                // child:
                // fit: BoxFit.fitHeight,
                child: image,
                // ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
