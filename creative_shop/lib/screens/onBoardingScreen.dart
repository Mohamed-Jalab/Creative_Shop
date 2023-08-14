import 'package:creative_shop/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'onBoardingList.dart';

class OnBoardingScreen extends StatelessWidget {
  OnBoardingScreen({Key? key}) : super(key: key);

  final myController = PageController();

  bool isLast = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
                controller: myController,
                onPageChanged: (int index) {
                  if (index == 2) {
                    isLast = true;
                  } else {
                    isLast = false;
                  }
                },
                // physics: const BouncingScrollPhysics(),
                itemCount: 3,
                itemBuilder: (context, i) => Stack(children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          image: DecorationImage(
                              image: AssetImage(
                                ONBoardingList[i].image!,
                              ),
                              fit: BoxFit.fill),
                        ),
                        height: double.infinity,
                      ),
                      Container(
                          height: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            gradient: LinearGradient(
                              begin: FractionalOffset.topCenter,
                              end: FractionalOffset.bottomCenter,
                              colors: [
                                Colors.black.withOpacity(.7),
                                Colors.white.withOpacity(0),
                              ],
                            ),
                          )),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 50, right: 10, left: 10),
                        child: Column(
                          children: [
                            Text(
                              ONBoardingList[i].title!,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontFamily: ' Poppins',
                                  fontSize: 35),
                            ),
                            const SizedBox(height: 3),
                            Text(
                              ONBoardingList[i].title2!,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontFamily: ' Poppins',
                                  fontSize: 35),
                            ),
                            const SizedBox(height: 15),
                            Text(ONBoardingList[i].title3!,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontFamily: ' Poppins',
                                    fontSize: 18)),
                            const SizedBox(height: 3),
                            Text(ONBoardingList[i].title4!,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontFamily: ' Poppins',
                                    fontSize: 18)),
                          ],
                        ),
                      )
                    ])),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            color: Colors.red,
            child: Row(
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  child: SmoothPageIndicator(
                    controller: myController,
                    count: 3,
                    effect: ExpandingDotsEffect(
                      activeDotColor: Colors.red.shade900,
                      dotColor: Colors.white,
                    ),
                  ),
                ),
                const Spacer(),
                FloatingActionButton(
                  backgroundColor: Colors.red,
                  onPressed: () {
                    if (!isLast) {
                      myController.nextPage(
                          duration: const Duration(milliseconds: 750),
                          curve: Curves.fastLinearToSlowEaseIn);
                    } else {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) {
                            return const LoginScreen();
                          },
                        ),
                      );
                    }
                  },
                  child: const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
