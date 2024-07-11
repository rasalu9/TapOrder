import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tap_and_order/home_screens/bottomnavigationbar.dart';
import 'package:tap_and_order/home_screens/home_screen.dart';
import 'package:tap_and_order/add_product/product_list_screen.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => Bottomnavigation()),
              (Route<dynamic> routes) => false,
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 100,
            height: 100,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image(

                  // fit: BoxFit.fill,
                  image: AssetImage("assets/images/tap2.png")),
            ),
          ),
        ],
      ),
    );
  }
}
