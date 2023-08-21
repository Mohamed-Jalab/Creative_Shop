import 'package:flutter/material.dart';

import '../shared/component.dart';
import '../shared/constant.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: primaryColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('About Us'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: const Column(
                  children: [
                    Text(
                      'Created by ',
                      style: TextStyle(color: primaryColor, fontSize: 25),
                    ),
                    Text(
                      'Creative Shop Team',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: secondaryColor,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              const Text(
                'Team Members:',
                style: TextStyle(
                  color: primaryColor,
                  fontSize: 25,
                ),
              ),
              const SizedBox(height: 40),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  nameItem(
                      shadowColor: secondaryColor,
                      nameColor: primaryColor,
                      name: 'Adel Kharma'),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      nameItem(
                          shadowColor: primaryColor,
                          nameColor: secondaryColor,
                          name: 'Ahmad Albetar'),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  nameItem(
                      shadowColor: secondaryColor,
                      nameColor: primaryColor,
                      name: 'Ibrahim Habra'),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      nameItem(
                          shadowColor: primaryColor,
                          nameColor: secondaryColor,
                          name: 'Mohammed Jalab'),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  nameItem(
                      shadowColor: secondaryColor,
                      nameColor: primaryColor,
                      name: 'Radwan Sukkari'),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      nameItem(
                          shadowColor: primaryColor,
                          nameColor: secondaryColor,
                          name: 'Sama Mlayes'),
                    ],
                  ),
                  const SizedBox(height: 20),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
