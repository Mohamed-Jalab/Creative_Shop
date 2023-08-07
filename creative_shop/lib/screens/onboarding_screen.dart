import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'onboarding_list.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final myController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: myController,
        itemCount: onBoardingList.length,
        itemBuilder: (context, i) => Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  onBoardingList[i].image!,
                ),
                fit: BoxFit.cover),
          ),
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              colors: [
                Colors.redAccent.withOpacity(0.4),
                Colors.red.withOpacity(0.4),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomLeft,
            )),
            child: Container(
              margin: const EdgeInsets.only(top: 50, right: 6, left: 6),
              child: Column(
                children: [
                  Text(
                    onBoardingList[i].title!,
                    style: const TextStyle(
                        color: Colors.white,
                        fontFamily: ' Poppins',
                        fontSize: 35),
                  ),
                  const SizedBox(height: 30),
                  Text(onBoardingList[i].title2!,
                      style: const TextStyle(
                          color: Colors.white,
                          fontFamily: ' Poppins',
                          fontSize: 18)),
                  const Spacer(),
                  Container(
                    alignment: Alignment.topLeft,
                    margin: const EdgeInsets.only(left: 8, bottom: 20),
                    child: SmoothPageIndicator(
                      controller: myController,
                      count: 3,
                      effect: ExpandingDotsEffect(
                        activeDotColor: Colors.red.shade900,
                        dotColor: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
