import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:project_api/shared/component/component.dart';
import 'package:project_api/shared/component/constant.dart';

class itemScreen extends StatelessWidget {
  const itemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Stack(
                children: [
                  Image(
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
                          icon: Icon(
                            Icons.arrow_back_ios_new_rounded,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: 250,
                        ),
                        Icon(
                          Icons.favorite_outline,
                          color: Colors.white,
                        ),
                        Stack(
                          alignment: AlignmentDirectional.topEnd,
                          children: [
                            Icon(
                              Icons.lock_outlined,
                              color: Colors.white,
                            ),
                            circles(color: RedColor),
                          ],
                        ),
                        SizedBox(
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
                        circles(color: RedColor),
                        circles(),
                        circles(),
                        SizedBox(
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
                              color: GreyColor1,
                            ),
                            child: Center(
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
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Icon(
                          Icons.favorite_border_sharp,
                          color: Colors.pink,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text(
                          'Popular: Hollow My Name Is Yousra',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              MyRow(
                text1: 'Ahma AnarKali Set',
                padd: EdgeInsets.only(left: 10, top: 20),
              ),
              MyRow(
                  color: GreyColor2,
                  text1: 'Hand print, Hard Embroday&mirror work',
                  padd: EdgeInsets.only(left: 10, top: 10),
                  fontsize: 15),
              MyRow(
                padd: EdgeInsets.only(left: 10, top: 20),
                text1: '\$34.000',
                text2: '\$42.600',
              ),
              SizedBox(
                width: 15,
              ),
              MyRow(
                  padd: EdgeInsets.only(left: 10, top: 10),
                  text1: 'Hellow I am Here',
                  color: GreyColor2,
                  fontsize: 15),
              MyRow(
                  padd: EdgeInsets.only(
                    left: 10,
                    top: 20,
                  ),
                  text1: 'Free shopping',
                  color: RedColor),
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MyButton(
                        child: Icon(
                          Icons.favorite,
                          color: RedColor,
                          size: 30,
                        ),
                      ),
                      Container(
                        child: Row(
                          children: [
                            MyButton(
                              width: 150,
                              height: 50,
                              child: Center(
                                child: Text(
                                  'Add to Bag',
                                  style:
                                      TextStyle(fontSize: 20, color: RedColor),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            MyButton(
                              width: 150,
                              height: 50,
                              color: RedColor,
                              child: Center(
                                child: Text(
                                  'Buy Now',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: WhiteColor,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
