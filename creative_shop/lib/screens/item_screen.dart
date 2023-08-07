import 'package:flutter/material.dart';

import '../shared/component/component.dart';
import '../shared/component/constant.dart';

class ItemScreen extends StatelessWidget {
  const ItemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                const Image(
                  image: NetworkImage(
                      'https://www.kenzacaftan.com/895-thickbox_default/yara-kaftan-mariee.jpg'),
                  height: 450,
                  width: double.infinity,
                  fit: BoxFit.fitWidth,
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
                      const SizedBox(
                        width: 250,
                      ),
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
                      const SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 400),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      circles(),
                      circles(color: redColor),
                      circles(),
                      circles(),
                      const SizedBox(
                        width: 230,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: Container(
                          alignment: AlignmentDirectional.bottomEnd,
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: greyColor1,
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.share_outlined,
                              color: Colors.white,
                            ),
                          ),
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  myButton(
                    child: const Icon(
                      Icons.favorite,
                      color: redColor,
                      size: 30,
                    ),
                  ),
                  Row(
                    children: [
                      myButton(
                        width: 150,
                        height: 50,
                        child: const Center(
                          child: Text(
                            'Add to Bag',
                            style: TextStyle(fontSize: 20, color: redColor),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      myButton(
                        width: 150,
                        height: 50,
                        color: redColor,
                        child: const Center(
                          child: Text(
                            'Buy Now',
                            style: TextStyle(
                              fontSize: 20,
                              color: whiteColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
