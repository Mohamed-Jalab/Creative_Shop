import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../shared/component/component.dart';
import '../shared/component/constant.dart';

class ItemScreen extends StatelessWidget {
  const ItemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Image(
                  image: const NetworkImage(
                      'https://www.kenzacaftan.com/895-thickbox_default/yara-kaftan-mariee.jpg'),
                  height: 480.h,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.arrow_back_ios_new_rounded,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 240.w),
                      const Icon(
                        Icons.favorite_outline,
                        color: Colors.white,
                      ),
                      Stack(
                        alignment: AlignmentDirectional.topEnd,
                        children: [
                          const Icon(
                            Icons.lock_outlined,
                            color: Colors.white,
                          ),
                          circles(color: redColor),
                        ],
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 430.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      circles(),
                      circles(color: redColor),
                      circles(),
                      circles(),
                      SizedBox(
                        width: 190.w,
                      ),
                      Container(
                        padding: const EdgeInsets.only(right: 3),
                        alignment: AlignmentDirectional.center,
                        width: 35.w,
                        height: 35.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: greyColor1,
                        ),
                        child: const Icon(
                          Icons.share_outlined,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.pinkAccent.withOpacity(0.1),
                ),
                child: const Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Icon(
                        Icons.favorite_border_sharp,
                        color: Colors.pink,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Text(
                        'Popular: Hollow My Name Is Yousra',
                      ),
                    ),
                  ],
                ),
              ),
            ),
            myRow(
              text1: 'Ahma AnarKali Set',
              padd: const EdgeInsets.only(left: 10, top: 20),
            ),
            myRow(
                color: greyColor2,
                text1: 'Hand print, Hard Embroday&mirror work',
                padd: const EdgeInsets.only(left: 10, top: 10),
                fontsize: 15),
            myRow(
              padd: const EdgeInsets.only(left: 10, top: 20),
              text1: '\$34.000',
              text2: '\$42.600',
            ),
            const SizedBox(
              width: 15,
            ),
            myRow(
                padd: const EdgeInsets.only(left: 10, top: 10),
                text1: 'Hellow I am Here',
                color: greyColor2,
                fontsize: 15),
            myRow(
                padd: const EdgeInsets.only(
                  left: 10,
                  top: 20,
                ),
                text1: 'Free shopping',
                color: redColor),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 50.w,
                    child: MaterialButton(
                        padding: EdgeInsets.zero,
                        shape: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: redColor, width: 1.3),
                            borderRadius: BorderRadius.circular(8.0)),
                        height: 50.h,
                        onPressed: () {},
                        child: const Icon(
                          Icons.favorite,
                          color: redColor,
                        )
                        // color: RedColor,
                        ),
                  ),
                  SizedBox(
                    width: 120.w,
                    child: MaterialButton(
                      height: 50.h,
                      // color: redColor,
                      shape: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: redColor, width: 1.3),
                          borderRadius: BorderRadius.circular(8.0)),
                      onPressed: () {},
                      child: const Text(
                        'Add to Bag',
                        style: TextStyle(color: redColor),
                      ),
                      // color: RedColor,
                    ),
                  ),
                  SizedBox(
                    width: 120.w,
                    child: MaterialButton(
                      height: 50.h,
                      shape: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      // borderRadius: BorderRadius.circular(10.0),
                      color: redColor,
                      onPressed: () {},
                      child: const Text(
                        'Buy Now',
                        style: TextStyle(color: whiteColor),
                      ),
                      // color: RedColor,
                    ),
                  ),
                  // MyButton(
                  //   width: 120.w,
                  //   height: 50,
                  //   child: Center(
                  //     child: Text(
                  //       'Add to Bag',
                  //       style: TextStyle(
                  //           fontSize: 20, color: RedColor),
                  //     ),
                  //   ),
                  // ),
                  // SizedBox(
                  //   width: 10,
                  // ),
                  // MyButton(
                  //   width: 120.w,
                  //   height: 50.w,
                  //   color: RedColor,
                  //   child: Center(
                  //     child: Text(
                  //       'Buy Now',
                  //       style: TextStyle(
                  //         fontSize: 20,
                  //         color: WhiteColor,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
