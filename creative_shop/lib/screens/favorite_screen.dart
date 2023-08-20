import 'package:flutter/material.dart';

import '../shared/constant.dart';

class FavoritScreen extends StatelessWidget {
  const FavoritScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Favorite'),
        backgroundColor: primaryColor,
      ),
      body: const Center(
        child: Text('There is no any favorite'),
      ),
    );
  }
}
