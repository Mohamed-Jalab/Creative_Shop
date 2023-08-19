import 'package:flutter/material.dart';

import 'about_us_screen.dart';

const backgroundColor = Color(0xffffffff);
const primaryColor = Color(0xff232F3E);
const secondaryColor = Color(0xffF69B32);

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundImage: AssetImage('asset/images/test.png'),
          ),
        ),
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('firstName lastName',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: backgroundColor)),
            SizedBox(
              height: 4,
            ),
            Text('email@gmail.com',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 14, color: backgroundColor)),
          ],
        ),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.edit))],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: backgroundColor,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade200,
                              spreadRadius: 5,
                              blurRadius: 10,
                              offset: const Offset(0, 3),
                            ),
                          ]),
                      child: Column(
                        children: [
                          buildTab(
                              icon: Icons.history, text: 'Purchase History'),
                          Container(
                            height: 1,
                            width: double.infinity,
                            color: Colors.grey.shade200,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: backgroundColor,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade200,
                              spreadRadius: 5,
                              blurRadius: 10,
                              offset: const Offset(0, 3),
                            ),
                          ]),
                      child: Column(
                        children: [
                          buildTab(
                              icon: Icons.notifications_none_outlined,
                              text: 'Notifications'),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: backgroundColor,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade200,
                              spreadRadius: 5,
                              blurRadius: 10,
                              offset: const Offset(0, 3),
                            ),
                          ]),
                      child: Column(
                        children: [
                          buildTab(
                              icon: Icons.place_outlined,
                              text: 'Delivery Addresses'),
                          Container(
                            height: 1,
                            width: double.infinity,
                            color: Colors.grey.shade200,
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              height: 60,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              width: double.infinity,
                              child: const Row(
                                children: [
                                  Icon(
                                    Icons.settings_outlined,
                                    color: primaryColor,
                                    size: 25,
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    'Settings',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: primaryColor),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: backgroundColor,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade200,
                              spreadRadius: 5,
                              blurRadius: 10,
                              offset: const Offset(0, 3),
                            ),
                          ]),
                      child: Column(
                        children: [
                          buildTab(
                              icon: Icons.info_outline_rounded,
                              text: 'About Us',
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const AboutUsScreen(),
                                  ),
                                );
                              }),
                          Container(
                            height: 1,
                            width: double.infinity,
                            color: Colors.grey.shade200,
                          ),
                          buildTab(icon: Icons.call, text: 'Contact Us'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 60),
                  backgroundColor: secondaryColor,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(45)))),
              child: Text('Logout',
                  style: TextStyle(fontSize: 24, color: backgroundColor)),
            )
          ],
        ),
      ),
    );
  }
}

Widget buildTab({IconData? icon, String? text, void Function()? onTap}) =>
    GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        width: double.infinity,
        child: Row(
          children: [
            Icon(
              icon,
              color: primaryColor,
              size: 25,
            ),
            const SizedBox(
              width: 20,
            ),
            Text(
              '$text',
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: primaryColor),
            ),
            const Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: Colors.grey,
                    size: 18,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
