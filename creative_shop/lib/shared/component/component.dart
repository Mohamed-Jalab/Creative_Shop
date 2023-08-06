import 'package:flutter/material.dart';

import 'constant.dart';

Widget circles(
        {Color color = greyColor6,
        double width = 10,
        double height = 10,
        child}) =>
    Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Container(
        child: child,
        width: width,
        height: height,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          // borderRadius: BorderRadius.circular(15),
          color: color,
        ),
      ),
    );

Widget myRow({
  String text1 = 'Hellow',
  String text2 = '',
  double fontsize = 20,
  Color color = Colors.black,
  EdgeInsets padd = const EdgeInsets.only(left: 10),
}) =>
    Padding(
      padding: padd,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            text1,
            style: TextStyle(
                textBaseline: TextBaseline.alphabetic,
                overflow: TextOverflow.ellipsis,
                fontSize: fontsize,
                color: color),
            textAlign: TextAlign.right,
          ),
          const SizedBox(width: 10),
          Text(
            text2,
            style: TextStyle(
                textBaseline: TextBaseline.alphabetic,
                overflow: TextOverflow.ellipsis,
                fontSize: fontsize,
                color: greyColor2),
            textAlign: TextAlign.right,
          ),
        ],
      ),
    );

Widget myButton(
        {double width = 70,
        double height = 50,
        child,
        Color color = whiteColor}) =>
    Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        border: Border.all(color: redColor),
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: child,
      ),
    );
