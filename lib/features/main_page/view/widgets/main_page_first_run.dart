import 'package:flutter/material.dart';

import '../../../../global/themes/colors.dart';

class MainPageBody extends StatefulWidget {
  const MainPageBody({Key? key}) : super(key: key);

  @override
  State<MainPageBody> createState() => _MainPageBodyState();
}

class _MainPageBodyState extends State<MainPageBody> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        alignment: Alignment.center,
        height: 350,
        width: 350,
        decoration: BoxDecoration(border: Border.all(color: myBlack)),
        child: const Text(
          "Welcome to Memes Generators\n Star Generating By Pressing OK",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
