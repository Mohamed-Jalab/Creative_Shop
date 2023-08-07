import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3)).then((value) => {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) => const OnBoardingScreen()))
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        //crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              alignment: Alignment.center,
              child: Image.asset(
                'asset/logo.png',
                width: 270,
              )),
          const Text(
            " Creative Shop",
            style: TextStyle(
              fontFamily: ' Poppins',
              fontSize: 42,
              color: Color.fromARGB(232, 138, 46, 149),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          const SpinKitFadingCircle(
            color: Colors.black,
            size: 40,
          ),
        ],
      ),
    );
  }
}
// D:\creative_shop_project\Creative_Shop\creative_shop\asset\images
// asset\images